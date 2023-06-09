package com.bp.app.accompany.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bp.app.gboard.service.GuideBoardService;
import com.bp.app.gboard.vo.GuideBoardVo;

@WebServlet ("/accompany/modify")
public class AccompanyModifyController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		req.getRequestDispatcher("/WEB-INF/views/accompanyBoard/accompanyBoardModify.jsp").forward(req, resp);
	}
	
	//UPDATE GUIDE_BOARD SET TITLE =? , SET CONTENT = ? , MODIFY_DATE = SYSDATE WHERE GUIDE_BOARD_NO = ? 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//데꺼
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String no = req.getParameter("no");
			
			
			//데뭉
			GuideBoardVo vo = new GuideBoardVo();
			vo.setTitle(title);
			vo.setContent(content);
			vo.setGuideBoardNo(no);
			
			//서비스
			GuideBoardService gbs = new GuideBoardService();
			if(title.length()>30) {
				throw new Exception();
			}
			int result = gbs.modify(vo);
			PrintWriter out =resp.getWriter();
			if(result==1) {
			
				out.write("ok");
				
			}else {
				throw new Exception();
			}
		} catch (Exception e) {
			e.printStackTrace();
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			
			
			PrintWriter out =resp.getWriter();
			
			if(title.length()==0) {
				out.write("noTitle");
			}else if(title.length()>30) {
				out.write("tooMuch");
			}else if(content.length()==0) {
				out.write("noContent");
			}else {
				System.out.println("타이틀길이"+title.length());
				out.write("no");
			}
			
			
			
			// TODO: handle exception
		}
		
	}
}
