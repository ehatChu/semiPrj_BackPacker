<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .detail{
      margin-top: 100px;
   }
      #page-area{
      width : 500px;
      margin: auto;
      display: flex;
      justify-content: space-evenly; 
   }
   

      .comentContent{
           font-size: 18px;
      }
      .dateIdNick{
         font-size : 12px;
      text-align: right;
         width : 100%;
      
         
   }
       
      .imgInput{
          padding: 5px;
          width: 50px;
          text-align: right;
          vertical-align: top;
      }
      #detailTitle{
         padding :20px;
         font-size: 25px;
      }
      #detailWrap{
         padding:  50px;
      }
      #detailWrap tr{
      height : 50px;
      }
</style>
</head>

<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
   <div class="detail">
        <div id="detailTitle">
            <div hidden>${selectMemberDetail.memberNo}</div>
            <b>${selectMemberDetail.nick}님이 받은 평가</b>
        </div>
        <br>
        <div id="detailWrap">
            
            <table id="reviewTable">
            <c:forEach items="${ selectMemberReviewlistDetail }" var="reviewListDetail" >
                <tr>
                    <td hidden>
                        ${reviewListDetail.giverNo}
                    </td>
                    <td class = "imgInput " rowspan="2">
                      <button onclick="imgClick(event)">50*50</button>
                    </td>
                    <td class="comentContent" >${reviewListDetail.content}</td>
                </tr>
                <tr>
                    
        
                    <td class="dateIdNick">${reviewListDetail.enrollDate} ${reviewListDetail.giverId} ${reviewListDetail.giverNick}</td>

                </tr>
                
              </c:forEach>
            </table>
            <br>

            
            
            <div id="page-area">
            <c:if test="${ pv.currentPage > 1 }">
               <a class="btn btn-outline-info" href="${pageContext.request.contextPath}/click/profile/review/detail?selectMemberNo=${selectMemberDetail.memberNo}&page=${pv.currentPage-1}">이전</a>
            </c:if>
            <c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
               <a class="btn btn-outline-info" href="${pageContext.request.contextPath}/click/profile/review/detail?selectMemberNo=${selectMemberDetail.memberNo}&page=${i}">${i}</a>
            </c:forEach>
            <c:if test="${ pv.currentPage < pv.maxPage }">
               <a class="btn btn-outline-info" href="${pageContext.request.contextPath}/click/profile/review/detail?selectMemberNo=${selectMemberDetail.memberNo}&page=${pv.currentPage+1}">다음</a>
            </c:if>
         </div>
        </div>
     </div>
</body>
</html>
<script type="text/javascript">
function imgClick(e) {
     const no = e.target.parentNode.parentNode.children[0].innerText; //게시글 작성자 번호
     const width = 800;
     const height = 1000;
     const left = (screen.width / 2) - (width / 2);
     const top = 0;
     window.open('${root}/click/profile?selectMemberNo='+no, '', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);
   }
</script>