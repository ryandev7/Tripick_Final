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
import com.kh.tripick.community.model.service.LocalBoardService;
import com.kh.tripick.community.model.vo.ComAttachment;
import com.kh.tripick.community.model.vo.LocalBoard;

@Controller
public class LocalBoardController {
	
	@Autowired
	private LocalBoardService localBoardService;
	
	@RequestMapping("list.lb")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1")int currentPage,
									@RequestParam(value="lcode", defaultValue="0")int lcode, ModelAndView mv) {
		
		// 전체 게시글 조회
		if(lcode == 0) {
		PageInfo pi = Pagination.getPageInfo(localBoardService.selectListCount(), currentPage, 10, 10);
		//ArrayList<Board> list = boardService.selectList(pi);
		
		mv.addObject("pi",pi)
		  .addObject("list", localBoardService.selectList(pi))
		  .addObject("lclist", localBoardService.selectLocalcatList())
		  .setViewName("localboard/localboardList");
		//System.out.println(localBoardService.selectList(pi));
		
		return mv;	
		
		} else { // 입력받은 지역코드의 게시글 리스트
			PageInfo pi = Pagination.getPageInfo(localBoardService.selectLocalListCount(lcode), currentPage, 10, 10);
			
			mv.addObject("pi",pi)
			  .addObject("lclist", localBoardService.selectLocalcatList())
			  .addObject("list", localBoardService.selectList(pi,lcode))
			  .setViewName("localboard/localboardList");
			//System.out.println(localBoardService.selectList(pi,lcode));
			return mv;
		}
		
	}

	
	@RequestMapping("enrollForm.lb")
	public String enrollForm(HttpSession session) {
		session.setAttribute("lclist", localBoardService.selectLocalcatList());
		return "localboard/localboardEnroll";
	}
	
	@RequestMapping("insert.lb")
	public String insertBoard(LocalBoard b, MultipartFile upfile, HttpSession session, Model model) {
		System.out.println(b);
		System.out.println(upfile);
		
		int result = localBoardService.insertBoard(b);
		//System.out.println(result);
		
		// 첨부파일이 있을 때
		if(!upfile.getOriginalFilename().equals("")) {
			ComAttachment at = new ComAttachment();
			String changeName = saveFile(upfile, session);
			
			at.setOriginName(upfile.getOriginalFilename());
			at.setChangeName("resources/community-upfiles/" + changeName);
			at.setLocalBoardNo(b.getLocalBoardNo());
			
			int result1 = localBoardService.insertAttachment(at);
			//System.out.println(result1);
			if(result * result1 > 0) {
				session.setAttribute("alertMsg", "작성성공~");
				return "redirect:list.lb";
			} else{
				model.addAttribute("errorMsg", "첨부파일을 등록하는데 문제가 발생");
				return "common/errorPage";
			}
		}
		
		
		if(result > 0) {
			session.setAttribute("alertMsg", "작성성공~");
			return "redirect:list.lb";
		} else{
			model.addAttribute("errorMsg", "게시글을 못쓰겠어여");
			return "common/errorPage";
		}
	}
	
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
	
	@RequestMapping("detail.lb")
	public ModelAndView selectBoard(ModelAndView mv, int bno) {
		int result = localBoardService.increaseCount(bno);
		if(result > 0) {
			
			LocalBoard b = localBoardService.selectBoard(bno);
			ComAttachment at = localBoardService.selectAttachment(bno);
			//System.out.println(b);
			mv.addObject("b", b)
			  .addObject("at", at)
			.setViewName("localboard/localboardDetail");
			
		} else {
			mv.addObject("errorMsg", "상세조회실패~").setViewName("common/errorPage");
			
		} return mv;
	}
	
	@RequestMapping("delete.lb")
	public String deleteBoard(int bno, String filePath, HttpSession session, Model model) {
		
		int result = localBoardService.deleteBoard(bno);
		
		if(result > 0) {
			// 만약에 첨부파일이 있었을 경우 삭제하기
			if(!filePath.equals("")) {
				// 기존에 존재하는 첨부파일을 삭제
				// "resources/uploadFiles/xxxx.jpg"
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			// 게시판 리스트페이지로 list.bo url 재요청
			session.setAttribute("alertMsg", "게시글 삭제 성공~!");
			return "redirect:list.lb";
		} else {
			model.addAttribute("errorMsg", "게시글 삭제 실패ㅠㅠ");
			return "common/errorPage";
			
		}
	}
	@RequestMapping("updateForm.lb")
	public String updateForm(int bno, Model model) {
		model.addAttribute("b", localBoardService.selectBoard(bno));
		model.addAttribute("at", localBoardService.selectAttachment(bno));
		model.addAttribute("lclist", localBoardService.selectLocalcatList());
		return "localboard/localboardUpdate";
	}
	@RequestMapping("update.lb")
	public String updateBoard(LocalBoard b, MultipartFile reupfile, HttpSession session, Model model) {
		// 새로 첨부파일이 넘어온 경우
		if(!reupfile.getOriginalFilename().equals("")) {
			// 기존에 첨부파일이 있었다면?? -> 기존의 첨부파일을 지우기
			ComAttachment a = new ComAttachment();
			if(a.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(a.getChangeName())).delete();
			}
			// 새로 넘어온 첨부파일을 서버에 업로드 시키기
			// saveFile()을 호출해서 현재 넘어온 첨부파일을 서버에 저장시키자
			String changeName = saveFile(reupfile, session);
			
			// b라는 Board객체에 새로운 정보(원본명, 저장경로) 담기
			a.setOriginName(reupfile.getOriginalFilename());
			a.setChangeName("resource/uploadFiles/" + changeName);
			}
		
			int result = localBoardService.updateBoard(b);
			
			if(result > 0) {
				model.addAttribute("alertMsg", "게시글 수정 성공~");
				return "redirect:detail.lb?bno=" + b.getLocalBoardNo();
			} else {
				model.addAttribute("errorMsg", "이번엔 무슨 잘못을 했느냐~");
				return "common/errorPage";
			}
			
		}
	
	
	@ResponseBody
	@RequestMapping(value="rlist.lb", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int bno) {
		ArrayList<Reply> list = localBoardService.selectReplyList(bno);
		System.out.println(list);
		return new Gson().toJson(localBoardService.selectReplyList(bno));
		
	}
	
	@ResponseBody
	@RequestMapping("rinsert.lb")
	public String ajaxInsertReply(Reply r) { // 성공했을 때는 success 실패했을때는 fail
		System.out.println(r);
		return localBoardService.insertReply(r) > 0 ? "success" : "fail";
	}
	
	@RequestMapping("search.lb")
	public ModelAndView selectSearch(@RequestParam(value="cpage", defaultValue="1")int currentPage,
										String keyword, String condition, ModelAndView mv ) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int listCount = localBoardService.selectSearchCount(map);
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<LocalBoard> list = localBoardService.selectSearchList(map, pi);
		
		System.out.println(list);
		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .setViewName("localboard/localboardList");
		
		return mv;
	}
	
	}
	


