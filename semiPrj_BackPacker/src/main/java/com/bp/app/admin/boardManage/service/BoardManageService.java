

package com.bp.app.admin.boardManage.service;

import java.sql.Connection;
import java.util.List;

import com.bp.app.admin.boardManage.dao.BoardManageDao;
import com.bp.app.admin.boardManage.vo.GuideReportVo;
import com.bp.app.admin.boardManage.vo.InfoBoardReportVo;
import com.bp.app.admin.boardManage.vo.QnaBoardVo;
import com.bp.app.common.db.JDBCTemplate;
import com.bp.app.common.page.PageVo;
import com.bp.app.gboard.vo.GuideBoardVo;
import com.bp.app.travelReview.vo.TravelReviewVo;

public class BoardManageService {
	private final BoardManageDao dao;
	
	public BoardManageService() {
		dao=new BoardManageDao();
	}
	public int getGuideBoardListCnt(String searchType, String searchValue) throws Exception {
		
		//conn
		
		Connection conn = JDBCTemplate.getConnection();
		
		int cnt = dao.getGuideBoardListCnt(conn, searchType, searchValue);
		
		//close
		
		JDBCTemplate.close(conn);
		
		return cnt;
	}
	public List<GuideBoardVo> getGuideBoardList(PageVo pv) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		List<GuideBoardVo>voList = dao.getGuideBoardList(conn, pv);
		//sql

		//close
		
		JDBCTemplate.close(conn);
		
		return voList;
	}
	public List<GuideBoardVo> getGuideBoardList(PageVo pv, String searchType, String searchValue) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		List<GuideBoardVo>voList = dao.getGuideBoardList(conn, pv, searchType, searchValue);
		//sql

		//close
		
		JDBCTemplate.close(conn);
			
		return voList;
	}
	public int getReviewInfoBoardListCnt(String searchType, String searchValue) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		int cnt = dao.getReviewInfoBoardListCnt(conn, searchType, searchValue);
		
		//close
		
		JDBCTemplate.close(conn);
		
		return cnt;
	}
	public List<TravelReviewVo> getReviewInfoBoardList(PageVo pv) throws Exception {
		Connection conn = JDBCTemplate.getConnection();
		List<TravelReviewVo>voList = dao.getReviewInfoBoardList(conn, pv);
		//sql

		//close
		
		JDBCTemplate.close(conn);
		
		return voList;
	}
	public List<TravelReviewVo> getReviewInfoBoardList(PageVo pv, String searchType, String searchValue) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		List<TravelReviewVo>voList = dao.getReviewInfoBoardList(conn, pv, searchType, searchValue);
		//sql

		//close
		
		JDBCTemplate.close(conn);
		
		return voList;
	}
	public int getGuideBoardReportDetailCnt(String searchType, String searchValue, String selectGuideBoardNo) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		int cnt = dao.getGuideBoardReportDetailCnt(conn, searchType, searchValue ,selectGuideBoardNo);
		
		//close
		
		JDBCTemplate.close(conn);
		
		return cnt;
	}
	public List<GuideReportVo> getGuideBoardReportDetail(PageVo pv, String selectGuideBoardNo) throws Exception {
		Connection conn = JDBCTemplate.getConnection();
		
		List<GuideReportVo>voList = dao.getGuideBoardReportDetail(conn, pv,selectGuideBoardNo);
		//sql

		//close
		
		JDBCTemplate.close(conn);
		
		return voList;
		
	}
	public List<GuideReportVo> getGuideBoardReportDetail(PageVo pv, String searchType, String searchValue, String selectGuideBoardNo) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		List<GuideReportVo>voList = dao.getGuideBoardReportDetail(conn, pv, searchType, searchValue, selectGuideBoardNo);
		//sql

		//close
		
		JDBCTemplate.close(conn);
		
		return voList;
	}
	public int getReviewInfoBoardReportDetailCnt(String searchType, String searchValue,String selectReviewInfoBoardNo) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		int cnt = dao.getReviewInfoBoardReportDetailCnt(conn, searchType, searchValue ,selectReviewInfoBoardNo);
		
		//close
		
		JDBCTemplate.close(conn);
		
		return cnt;
	}
	public List<InfoBoardReportVo> getReviewInfoBoardReportDetail(PageVo pv, String selectReviewInfoBoardNo) throws Exception {
		Connection conn = JDBCTemplate.getConnection();
		
		List<InfoBoardReportVo>voList = dao.getReviewInfoBoardReportDetail(conn, pv,selectReviewInfoBoardNo);
		//sql

		//close
		
		JDBCTemplate.close(conn);
		
		return voList;
		
	}
	public List<InfoBoardReportVo> getReviewInfoBoardReportDetail(PageVo pv, String searchType, String searchValue, String selectReviewInfoBoardNo) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		List<InfoBoardReportVo>voList = dao.getReviewInfoBoardReportDetail(conn, pv, searchType, searchValue, selectReviewInfoBoardNo);
		//sql

		//close
		
		JDBCTemplate.close(conn);
		
		return voList;
	}
	public int writeQnaBoard(QnaBoardVo qvo) throws Exception {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = dao.writeQnaBoard(conn, qvo);
		
		if (result ==1) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
				
	}
	public int write(TravelReviewVo trvo) throws Exception {

		Connection conn = JDBCTemplate.getConnection();
		int result = dao.write(conn , trvo);
//		int result2 = dao.increaseScore(conn,trvo);
		
		if(result == 1) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	
	}
}
