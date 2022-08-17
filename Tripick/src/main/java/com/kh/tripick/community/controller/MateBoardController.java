package com.kh.tripick.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.model.vo.Reply;
import com.kh.tripick.common.template.Pagination;
import com.kh.tripick.community.model.service.MateBoardService;
import com.kh.tripick.community.model.vo.ComAttachment;
import com.kh.tripick.community.model.vo.LocalBoard;
import com.kh.tripick.community.model.vo.Mate;

@Controller
public class MateBoardController {
	
	@Autowired
	private MateBoardService mateBoardService;

	// 게시글리스트
	@RequestMapping("list.mb")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1")
									int currentPage, ModelAndView mv) {
		PageInfo pi = Pagination.getPageInfo(mateBoardService.selectListCount(), currentPage, 10, 10);
		
		mv.addObject("pi", pi)
		  .addObject("list", mateBoardService.selectList(pi))
		  .setViewName("mateboard/mateboardList");
		
		return mv;
	}
	// 게시글검색
	@RequestMapping("search.mb")
	public ModelAndView selectSearch(@RequestParam(value="cpage", defaultValue="1")int currentPage,
										String keyword, String condition, ModelAndView mv ) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int listCount = mateBoardService.selectSearchCount(map);
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<LocalBoard> list = mateBoardService.selectSearchList(map, pi);
		
		System.out.println(list);
		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .setViewName("mateboard/mateboardList");
		
		return mv;
	}
	// 작성폼
	@RequestMapping("enrollForm.mb")
	public String enrollForm(HttpSession session) {
		session.setAttribute("lclist", mateBoardService.selectLocalcatList());
		return "mateboard/mateboardEnroll";
	}
	// 수정폼
	@RequestMapping("updateForm.mb")
	public String updateForm(int mno, Model model) {
		//System.out.println(mateBoardService.selectLocalcatList());
		model.addAttribute("lclist", mateBoardService.selectLocalcatList());
		model.addAttribute("at", mateBoardService.selectAttachment(mno));
		model.addAttribute("m", mateBoardService.selectBoard(mno));
		return "mateboard/mateBoardUpdate";
	}
	// 게시글 상세보기
	@RequestMapping("detail.mb")
	public ModelAndView selectBoard(ModelAndView mv, int mno) {
		int result = mateBoardService.increaseCount(mno);
		if(result > 0) {
			
			Mate m = mateBoardService.selectBoard(mno);
			ComAttachment at = mateBoardService.selectAttachment(mno);
			//System.out.println(m);
			mv.addObject("m", m)
			  .addObject("at", at)
			.setViewName("mateboard/mateboardDetail");
			
		} else {
			mv.addObject("errorMsg", "상세조회실패~").setViewName("common/errorPage");
			
		} return mv;
	}
	// 게시글 작성
	@RequestMapping("insert.mb")
	public String insertBoard(Mate m, MultipartFile upfile, HttpSession session, Model model) {
		System.out.println(m);
		System.out.println(upfile);
		
		int result = mateBoardService.insertBoard(m);
		
		// 첨부파일이 있을때
		if(!upfile.getOriginalFilename().equals("")) {
			
			ComAttachment at = new ComAttachment();
			String changeName = saveFile(upfile, session);
			
			at.setMateNo(m.getMateNo());
			at.setOriginName(upfile.getOriginalFilename());
			at.setChangeName("resources/community-upfiles/" + changeName);
			
			int result1 = mateBoardService.insertAttachment(at);
			if(result * result1 > 0) {
				session.setAttribute("alertMsg", "작성성공~");
				return "redirect:list.mb";
			} else{
				model.addAttribute("errorMsg", "첨부파일을 등록하는데 문제가 발생");
				return "common/errorPage";
			}
		}
		
		if(result > 0) {
			session.setAttribute("alertMsg", "게시글 작성성공~");
			return "redirect:list.mb";
		} else{
			model.addAttribute("errorMsg", "게시글을 못쓰겠어여");
			return "common/errorPage";
		}
	}
	// 게시글 수정
	@RequestMapping("update.mb")
	public String updateBoard(Mate m, MultipartFile reupfile, HttpSession session, Model model) {
		
		System.out.println(m);
		int result = mateBoardService.updateBoard(m);
		//ComAttachment a = mateBoardService.selectAttachment(m.getMateNo());
		//System.out.println(result);
		// 첨부파일을 넣은 경우
		ComAttachment a = new ComAttachment();
		if(!reupfile.getOriginalFilename().equals("")) {
			
			ComAttachment at = mateBoardService.selectAttachment(m.getMateNo());
			
			// 기존에 첨부파일이 있었다면?? -> 기존의 첨부파일을 지우기
			if(at.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(at.getChangeName())).delete();
				
				String changeName = saveFile(reupfile, session);
				
				at.setMateNo(m.getMateNo());
				at.setOriginName(reupfile.getOriginalFilename());
				at.setChangeName("resource/uploadFiles/" + changeName);
				
				int result1 = mateBoardService.updateAttachment(at);
				System.out.println(result1);
				if(result * result1 > 0) {
					model.addAttribute("alertMsg", "게시글 수정 성공");
					return "redirect:detail.mb?mno=" + m.getMateNo();
				} else {
					model.addAttribute("errorMsg", "첨부파일 수정실패");
					return "common/errorPage";
				}
			}
			
			// 새로 넘어온 첨부파일을 서버에 업로드 시키기
			// saveFile()을 호출해서 현재 넘어온 첨부파일을 서버에 저장시키자
			String changeName = saveFile(reupfile, session);
			
			a.setMateNo(m.getMateNo());
			a.setOriginName(reupfile.getOriginalFilename());
			a.setChangeName("resource/uploadFiles/" + changeName);
			
			//System.out.println(a);
			int result1 = mateBoardService.updateNewAttachment(a);
			//System.out.println(result1);
			
			if(result * result1 > 0) {
				model.addAttribute("alertMsg", "게시글 수정 성공");
				return "redirect:detail.mb?mno=" + m.getMateNo();
			} else {
				model.addAttribute("errorMsg", "첨부파일 수정실패");
				return "common/errorPage";
			}
	}
			
	
	// 파일저장
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename();
		
		// 202207220225124214(년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)(Math.random() * 90000) + 10000;
		// 확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		//System.out.println(changeName);
		
		String savePath = session.getServletContext().getRealPath("/resources/community-upfiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return "main";
	}
	
	@RequestMapping("delete.mb")
	public String deleteBoard(int mno, String filePath, HttpSession session, Model model) {
		
		int result = mateBoardService.deleteBoard(mno);
		
		if(result > 0) {
			// 만약에 첨부파일이 있었을 경우 삭제하기
			if(!filePath.equals("")) {
				// 기존에 존재하는 첨부파일을 삭제
				// "resources/uploadFiles/xxxx.jpg"
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			// 게시판 리스트페이지로 list.bo url 재요청
			session.setAttribute("alertMsg", "게시글 삭제 성공~!");
			return "redirect:list.mb";
		} else {
			model.addAttribute("errorMsg", "게시글 삭제 실패ㅠㅠ");
			return "common/errorPage";
			
		}
	}
	@ResponseBody
	@RequestMapping(value="rlist.mb", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int bno) {
		ArrayList<Reply> list = mateBoardService.selectReplyList(bno);
		//System.out.println(list);
		return new Gson().toJson(list);
		
	}
	
	@ResponseBody
	@RequestMapping("rinsert.mb")
	public String ajaxInsertReply(Reply r) { // 성공했을 때는 success 실패했을때는 fail
		System.out.println(r);
		return mateBoardService.insertReply(r) > 0 ? "success" : "fail";
	}	

}
