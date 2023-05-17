<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- 폰트어썸 cdn -->
<script src="https://kit.fontawesome.com/794ac64f16.js" crossorigin="anonymous"></script>
    <c:set var="root" value = "${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #wrapt{
        width: 800px;
        margin-top: 100px;
        margin-left: auto;
        margin-right: auto;
    }
    #thi{
        text-align: center;
    }
    
    #acbtable {
    width: 800px;
    height : 450px;
    border-collapse: collapse;
    border-spacing: 10px;
    text-align: center;
    font-size: 18px;
    }

    #acbtable th{
    
    border-bottom: 1px solid black;
    }
    #acbtable td{
    padding-top: 10px; 
    padding-bottom: 10px;
    border-bottom: 1px solid black;
    }

    #page-area-acb{
      width : 300px;
      margin: auto;
      display: flex;
      justify-content: space-evenly; 
}
 
  #page-area{
      width : 500px;
      margin: auto;
      display: flex;
      justify-content: space-evenly; 
   }
</style>
</head>
<body>


   	 <div id="wrapt">
<%@ include file="/WEB-INF/views/common/header.jsp" %>
 <%@ include file="/WEB-INF/views/common/nav.jsp" %>
        <h1 id="th1">후기, 정보 게시판 신고 내용</h1>
        <hr>
        <div id="search-area">
                <form action="${root}/admin/reviewInfoBoard/report" method="get">
                    <input type="hidden" value="1" name="page">
                    <select name="searchType" id="opt" >
                    	
                        <option value="writerName">작성자 이름</option>
                        <option value="writerNick" >작성자 닉네임</option>
                        <option value="writerId" >작성자 아이디</option>
                        <option value="content">신고내용</option>
                        
                    </select>
                    <input type="hidden"  value="${selectReviewInfoBoardNo}" name = "selectReviewInfoBoardNo">
                    <input class = "searchValueElem " type = "text" name = "searchValue" value = "${searchVo.searchValue}" placeholder="검색할 내용">
                    <input type="submit">
                    
                </form>

            </div>
        <div id="board1">
            
            <table id="acbtable">
                <thead>
                    <tr>
                        <th>신고자 아이디</th>
                        <th>신고자 닉네임</th>
                        <th>신고자 이름</th>
                        
                    </tr>
                </thead>
                 <tbody>
                	<c:forEach items="${voList}" var="vo">
	                    <tr style="border-bottom: 0px;">
	                        <td hidden>${vo.reportNo}</td>
	                        <td hidden>${vo.memberNo}</td>
	                        <td hidden>${vo.infoBoardNo}</td>
	                        <td style="border-bottom: 0px;">${vo.writerId}</td>
	                        <td style="border-bottom: 0px;">${vo.writerNick}</td>
	                        <td style="border-bottom: 0px;">${vo.writerName}</td>
	                       
	                    </tr>        
	                    <tr style="border-top: 0px;">
	                    
	                  
	                        <td colspan="4" style="border-top: 0px; text-align: left; overflow: auto;"> <strong>내용 : </strong>  ${vo.reportContent}</td>
	                    </tr>
                	</c:forEach>
                </tbody>
                
            </table>
            <br><br>
           <div id="page-area">
            	<c:if test="${pv.currentPage >1}">
	            	<a class ="btn btn-outline-info" href="${root}/admin/reviewInfoBoard/report?page=${pv.currentPage -1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">이전</a>
            	</c:if>
	           	<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
	           		<c:if test="${pv.currentPage != i}">
		            	<a class ="btn btn-outline-info" href="${root}/admin/reviewInfoBoard/report?page=${i}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">${i}</a>
	           		</c:if>
	           		<c:if test="${pv.currentPage == i}">
		            	<a class ="btn btn-outline-info" >${i}</a>
	           		</c:if>
	           	</c:forEach>
	           	<c:if test="${pv.currentPage != pv.maxPage}">
	            	<a class ="btn btn-outline-info" href="${root}/admin/reviewInfoBoard/report?page=${pv.currentPage + 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">다음</a>
	           	</c:if>
            </div>
        </div>
    </div>
</body>

</html>
<script>


	const searchType = '${searchVo.searchType}';
	const searchValue = '${searchVo.searchValue}';
	
	const searchValueSelectTag = document.querySelector("select[name='searchValue']");
	const searchValueInputTag = document.querySelector("input[name='searchValue']");
	
	
	if( searchType.length > 1){
		initSearchType();
	};
	
	function initSearchType(){
	    const x = document.querySelector('select > option[value="' + searchType + '"]');
		x.selected = true;
	
	}
	
	//서치 타입 변경시 함수 실행
	
	




   
</script>