package com.kh.tripick.common.model.vo;

import java.sql.Date;

public class Reply {
	private int replyNo;
	private String replyWriter;
	private String replyContent;
	private Date create_date;
	private String status;
	private String replyLevel;
	private int refBoardNo;
	
	public Reply() {
		super();
	}
	public Reply(int replyNo, String replyWriter, String replyContent, Date create_date, String status,
			String replyLevel, int refBoardNo) {
		super();
		this.replyNo = replyNo;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.create_date = create_date;
		this.status = status;
		this.replyLevel = replyLevel;
		this.refBoardNo = refBoardNo;
	}
	
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getReplyLevel() {
		return replyLevel;
	}
	public void setReplyLevel(String replyLevel) {
		this.replyLevel = replyLevel;
	}
	public int getRefBoardNo() {
		return refBoardNo;
	}
	public void setRefBoardNo(int refBoardNo) {
		this.refBoardNo = refBoardNo;
	}
	
	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyWriter=" + replyWriter + ", replyContent=" + replyContent
				+ ", create_date=" + create_date + ", status=" + status + ", replyLevel=" + replyLevel + ", refBoardNo="
				+ refBoardNo + "]";
	}
}
