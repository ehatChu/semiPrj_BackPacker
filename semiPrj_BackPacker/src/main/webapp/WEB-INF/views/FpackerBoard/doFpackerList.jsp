<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>P_Packer_find_board</title>
<style>
	body {
		overflow-x :hidden;	
	}
    * {
        margin: 0px;
        padding: 0px;
    }
	main {

		width: 100vw;
	}

   
    #content-area {
        display: flex;
    }
    #content-area > div{
        box-sizing: border-box;
    }
    #ca1 {
        width: 10vw;
    }

    #ca2 {
        width: 10vw;
    }

    #c-main {
        width: 80vw;
    }

    #page-area {
        height: 5vh;
    }

    #input-box {
        position: relative;
    }
	#input-box > i {
		position: absolute;
		top :10px;
		left: 5px;
		z-index: 1;
	}
 	#input-box > input {
 		padding-left : 30px;
 	}
    #middle-area {
        display: flex;
        justify-content: space-between;
        align-items: self-end;
    }

    #big-text {
        font-weight: 800;
        font-size: 40px;
    }

   
    #page-area {
        text-align: center;
        margin-top: 30px;
    }
  

    #c-main > div:first-child{
        margin-top: 30px;
        font-size: 14px;
    }
    #search-area {
        margin-bottom: 30px;
    }

    #category-area{
        border-radius: 10px;
        background-color: #D7ECF2;
        border: none;
        font-size: 12px;
        font-weight: 700;
        padding: 5px 0px 5px 10px;
    }
    #input-box input {
        border-radius: 20px;
        border: 1px solid #CBCBCB;
    }
    input::placeholder{
        color: #8c8c8c;
        font-size: 13px;
    }
    input [type=submit]{
        border-radius: 0%;    
    }
    #write-btn {
        padding: 10px 20px 10px 20px;
        background-color: #94D2E6;
        font-size: 20px;
        font-weight: 800;
        color: white;
        border-radius: 10px;
        border: none;
        margin-right: 50px;
    }

    #main-img > img {
        object-fit: none;
        width: 100vw;
        height: 450px;
    }

    #main-img {
        position: relative;
    }
    #info-text {
        font-weight: 800;
        font-size: 50px;
        position: absolute;
        top: 100px;
        left: 50px;
    }
    #page-area > a{
        margin-right: 30px;
    }
    #page-area > a:last-child{
        margin-right: 0px;
    }

    /* main-area content-area 관련 스타일*/
    #main-area {
        display: grid;
        height: 1300px;
        margin-top: 30px;
        grid-template-columns: 1fr 1fr 1fr 1fr;
        grid-template-rows: 1fr 1fr;
    }

    .content-area > img{
        object-fit: cover;
        width: 100%;
        height: 90%;
        border-radius: 30px;
    }

    .content-area {
        margin-bottom: 70px;
        margin-right: 50px;
        cursor : pointer;
    }
    .text-small {
        font-size: 16px;
    }
    .content-small-bold {
        font-weight: 600;
    }
    .text-area {
        margin-top: 5px;
    }
    /*  */
    .content-area > img {
    	object-fit : cover;
    }
      .s-btn {
        border: none;
        border-top-left-radius: 10px ;
        border-top-right-radius: 10px;
        padding: 5px 5px 0px 5px;
    }
    .active-btn {
    	background-color: #94D2E6;
        color: white;
    }
    .current-page {
    	color :  #D7ECF2;
    }
   	.small-text {
   		font-size : 12px;
   	}
</style>
</head>
<body>
	<div id="wrap">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<main>
        <div id="main-img">
            <img src="${root}/static/img/board-dofpacker-main.jpg" alt="">
            <div id="info-text">
                전문적인<br>
                프패커를<br>
                만나보세요<br>
            </div>
        </div>
        <div id="content-area">
            <div id="ca1"></div>
            <div id="c-main">
                <div><a href="${root}/accompany/list?page=1">동행구하기 게시판으로 이동하기</a></div>
                <div id="search-area">
                	<form action="${root}/doFpacker/list" method="get">
                		<input type="hidden" name="page" value="1">
	                    <select name="searchType" id="category-area">
	                        <option value="title">제목</option>
	                        <option value="writerId">아이디</option>
	                        <option value="writerNick">닉네임</option>
	                    </select>
	                    <span id="input-box">
	                        <i class="fa-solid fa-magnifying-glass fa-sm" style="color: #8c8c8c;"></i>
	                        <input type="text" name="searchValue" placeholder="검색어를 입력하세요." value="${searchVo.searchValue}">
	                    </span>
	                    <!-- <input type="submit" value="검색"> -->                	
                	</form>
                </div>
                <div><button class="s-btn" type="button" onclick="location.href='${root}/findFpacker/list?page=1'">구해요</button><button class="s-btn active-btn">합니다</button></div>
                <div id="middle-area">
                    <span id="big-text">프패커게시판</span>
                    <c:if test="${empty loginMember}">
	                    <button id="write-btn" type="button" onclick="f01();">게시글 작성</button>
	                    <script>
	                    	function f01(){
	                    		alert('로그인 먼저 해주세요.');
	                    	}
	                    </script>
                    </c:if>
                    <c:if test="${loginMember.isGuide eq 'X'}">
	                    <button id="write-btn" type="button" onclick="f02();">게시글 작성</button>
	                	<script>
	                    	function f02(){
	                    		alert('가이더로 등록 후 게시글 작성이 가능합니다.');
	                    	}
	                    </script>
                    </c:if>
                    <c:if test="${loginMember.isGuide eq 'O'}">
	                    <button id="write-btn" type="button" onclick="location.href='${root}/doFpacker/write'">게시글 작성</button>
                    </c:if>
                    
                
                </div>
                
              
                <div id="main-area">
                	<c:forEach items="${gbvoList}" var="vo">
	                    <div class="content-area" onclick="location.href ='${root}/doFpacker/detail?no='+${vo.guideBoardNo}+'&writerNo='+${vo.writerNo}+'&schedulerNo='+${vo.schedulerNo}">
	                        <img class="thum-Img" src="${root}/static/img/Fpacker/${vo.mainImg}" alt="">
	                        <div class="text-area">
	                            <div class="text-small content-small-bold">
									<c:set var="titleLength" value="${fn:length(vo.title)}" />
		                            <c:if test="${titleLength >= 22}">
		                            ${vo.title}...
		                            </c:if>
		                            <c:if test="${titleLength <22 }">
		                            ${vo.title}
		                            </c:if>
		                            
	                            </div>
	                            <div class="text-samll">${vo.id}(${vo.nick})</div>
	                            <div class="small-text">최저가  ￦${vo.travelExpense}/인</div>
	                            
	                            
	                            <c:if test="${not empty vo.startDate}">
		                          <div class="small-text">${vo.startDate}~${vo.endDate}</div>
	                            </c:if>
	                            <c:if test="${empty vo.startDate}">
		                          <div class="small-text">확정된 일정이 없습니다.</div>	                                
	                            </c:if>
	                        </div>
	                    </div>
                	</c:forEach>

                </div>

            </div>
            <div id="ca2"></div>
        </div>
        <div id="page-area">
        	<c:if test="${pv.currentPage >1}">
	            <a href="${root}/doFpacker/list?page=1&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}"><<</a>
	            <a href="${root}/doFpacker/list?page=${pv.currentPage -1 }&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}"><</a>
        	</c:if>
            
            <c:forEach begin="${ pv.startPage }" end="${ pv.endPage }" step="1" var="i">
            	<c:if test="${pv.currentPage != i}">
	 	           <a href="${root}/doFpacker/list?page=${i}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">${i}</a>
           		</c:if>
           		<c:if test="${pv.currentPage == i}">
	 	           <a class="current-page">${i}</a>
           		</c:if>
            </c:forEach>
            
            <c:if test="${pv.currentPage < pv.maxPage }">
	            <a href="${root}/doFpacker/list?pa  ge=${pv.currentPage + 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">></a>
	            <a href="${root}/doFpacker/list?page=${pv.maxPage}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">>></a>            
            </c:if>
        </div>
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>
<script>
    const searchType = '${searchVo.searchType}';
    const searchValue = '${searchVo.searchValue}';
    function initSearchType(){
		const x = document.querySelector('select > option[value="' + searchType + '"]');
		x.selected = true;
	}
    if(searchType.length > 1){
		initSearchType();
	}
   
</script>

