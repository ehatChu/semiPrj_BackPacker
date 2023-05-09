package com.bp.app.admin.memberManage.service;

import java.sql.Connection;
import java.util.List;

import com.bp.app.admin.memberManage.dao.AdminMemberDao;
import com.bp.app.common.db.JDBCTemplate;
import com.bp.app.common.page.PageVo;
import com.bp.app.member.vo.MemberVo;

public class AdminMemberService {
   private final AdminMemberDao dao = new AdminMemberDao();
   public int editStatus(MemberVo vo) throws Exception {
      //conn
      Connection conn = JDBCTemplate.getConnection();
      
      String status = vo.getMemberStatus();
      int result = dao.editStatus(conn,vo, status);
      JDBCTemplate.close(conn);
      
      
      
      
      return 0;
   }
   
   


   public int getMemberListCnt(String searchType, String searchValue) throws Exception {
      //conn
         Connection conn = JDBCTemplate.getConnection();
         
         int cnt = dao.getMemberListCnt(conn , searchType , searchValue);
         
         //close
         JDBCTemplate.close(conn);
         
         return cnt;
   }




   public List<MemberVo> getMemberList(PageVo pv) throws Exception {
      Connection conn = JDBCTemplate.getConnection();
      
      List<MemberVo> voList = dao.getMemberList(conn , pv);
      
      //close
      JDBCTemplate.close(conn);
      
      return voList;
   }




   public List<MemberVo> getMemberList(PageVo pv, String searchType, String searchValue) throws Exception {
      
      
      //conn
      Connection conn = JDBCTemplate.getConnection();
      
      List<MemberVo> voList = dao.getMemberList(conn , pv , searchType, searchValue);
      
      //close
      JDBCTemplate.close(conn);
      
      return voList;
      
   }




   public List<MemberVo> getMemberList() throws Exception {
      Connection conn = JDBCTemplate.getConnection();
      
      List<MemberVo> voList = dao.getMemberList(conn);
      
      JDBCTemplate.close(conn);
      
      // TODO Auto-generated method stub
      return voList;
   }

   
}