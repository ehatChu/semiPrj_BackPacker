package com.bp.app.memberReview.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bp.app.chat.room.vo.ChattingRoomVo;
import com.bp.app.member.vo.MemberVo;
import com.bp.app.memberReview.service.MemberReviewService;
import com.bp.app.memberReview.vo.MemberReviewVo;
@WebServlet("/click/profile/review")
public class MemberReviewWriteController extends HttpServlet{
   
   
   MemberReviewService mrs = new MemberReviewService();
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      //로그인 멤버랑 선택됨 멤버가 채팅룸이 있고 결제확인이 y 인 경우에면 넘어간다
      try {
         //데꺼
         String loginMemberNo = req.getParameter("loginMemberNo");
         String selectMemberNo = req.getParameter("selectMemberNo");
         //데뭉
         if (loginMemberNo.equals(selectMemberNo)) {
        	 req.setAttribute("errorMsg", "자기 자신에게는 후기를 작성할 수 없습니다.");
             req.getRequestDispatcher("/WEB-INF/views/common/error-page.jsp").forward(req, resp);
             return;
         }
         //서비스
         List<ChattingRoomVo> crvList = null;
         MemberVo loginMember = (MemberVo)req.getSession().getAttribute("loginMember");
         MemberVo selectMember = mrs.getSelectMemberVo(selectMemberNo);
         crvList = mrs.checkCanWriteReview(loginMemberNo,selectMemberNo);
         if(crvList.isEmpty()) {
        	 req.setAttribute("errorMsg", "같이 여행한 적이 없어요");
        	 req.getRequestDispatcher("/WEB-INF/views/common/error-page.jsp").forward(req, resp);
         }else {
        	 req.setAttribute("loginMember", loginMember);
        	 req.setAttribute("selectMember", selectMember);
        	 req.setAttribute("crvList", crvList);
        	 req.getRequestDispatcher("/WEB-INF/views/profile/write-review.jsp").forward(req, resp);
         }
      }catch(Exception e) {
         System.out.println("[ERROR] go prfile errr....");
         e.printStackTrace();
         
         req.setAttribute("errorMsg", "같이 여행한 적이 없어요");
         req.getRequestDispatcher("/WEB-INF/views/common/error-page.jsp").forward(req, resp);
         
      }
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      try {
         
         MemberReviewVo mrv = new MemberReviewVo();
         String giverNo = req.getParameter("loginMemberNo");
         String memberNo = req.getParameter("selectMemberNo");
         String chattingRoomNo = req.getParameter("chattingRoomNo");
         String content = req.getParameter("reviewContent");
         String score = req.getParameter("rating");
         mrv.setGiverNo(giverNo);
         mrv.setMemberNo(memberNo);
         mrv.setChattingRoomNo(chattingRoomNo);
         mrv.setContent(content);
         mrv.setScore(score);
         
         MemberReviewService mrs = new MemberReviewService();
         int result = mrs.writeReview(mrv);
         MemberVo vo = new MemberVo();
         vo = mrs.selectMemberGetScore(memberNo);
         String originScore = vo.getMemberScore();
         int result2 = mrs.plusScore(mrv,originScore);
         
         if(result == result2) {
            
            String root = req.getContextPath();
            resp.sendRedirect(root+"/click/profile?selectMemberNo="+memberNo);
         }else {
            throw new Exception("[ERROR] 후기 작성 에러");
         }
         
      }catch(Exception e){
         
         e.printStackTrace();
      
         req.setAttribute("errorMsg", "후기는 1번 매칭마다 1번만 가능합니다");
         
		
         req.getRequestDispatcher("/WEB-INF/views/common/error-page.jsp").forward(req, resp);
      
      }
      
      
   }
}