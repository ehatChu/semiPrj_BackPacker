package com.bp.app.memberReview.vo;

public class MemberReviewVo {

   
   private String no;
   private String giverNo;
   private String memberNo;
   private String chattingRoomNo;
   private String enrollDate;
   private String content;
   private String score;
   private String giverId;
   private String giverNick;
   private String boardTitle;
   private String state;
   private String giverProfile;
public String getNo() {
	return no;
}
public void setNo(String no) {
	this.no = no;
}
public String getGiverNo() {
	return giverNo;
}
public void setGiverNo(String giverNo) {
	this.giverNo = giverNo;
}
public String getMemberNo() {
	return memberNo;
}
public void setMemberNo(String memberNo) {
	this.memberNo = memberNo;
}
public String getChattingRoomNo() {
	return chattingRoomNo;
}
public void setChattingRoomNo(String chattingRoomNo) {
	this.chattingRoomNo = chattingRoomNo;
}
public String getEnrollDate() {
	return enrollDate;
}
public void setEnrollDate(String enrollDate) {
	this.enrollDate = enrollDate;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getScore() {
	return score;
}
public void setScore(String score) {
	this.score = score;
}
public String getGiverId() {
	return giverId;
}
public void setGiverId(String giverId) {
	this.giverId = giverId;
}
public String getGiverNick() {
	return giverNick;
}
public void setGiverNick(String giverNick) {
	this.giverNick = giverNick;
}
public String getBoardTitle() {
	return boardTitle;
}
public void setBoardTitle(String boardTitle) {
	this.boardTitle = boardTitle;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public String getGiverProfile() {
	return giverProfile;
}
public void setGiverProfile(String giverProfile) {
	this.giverProfile = giverProfile;
}
@Override
public String toString() {
	return "MemberReviewVo [no=" + no + ", giverNo=" + giverNo + ", memberNo=" + memberNo + ", chattingRoomNo="
			+ chattingRoomNo + ", enrollDate=" + enrollDate + ", content=" + content + ", score=" + score + ", giverId="
			+ giverId + ", giverNick=" + giverNick + ", boardTitle=" + boardTitle + ", state=" + state
			+ ", giverProfile=" + giverProfile + "]";
}
public MemberReviewVo(String no, String giverNo, String memberNo, String chattingRoomNo, String enrollDate,
		String content, String score, String giverId, String giverNick, String boardTitle, String state,
		String giverProfile) {
	super();
	this.no = no;
	this.giverNo = giverNo;
	this.memberNo = memberNo;
	this.chattingRoomNo = chattingRoomNo;
	this.enrollDate = enrollDate;
	this.content = content;
	this.score = score;
	this.giverId = giverId;
	this.giverNick = giverNick;
	this.boardTitle = boardTitle;
	this.state = state;
	this.giverProfile = giverProfile;
}
public MemberReviewVo() {
	super();
	// TODO Auto-generated constructor stub
}

   
}