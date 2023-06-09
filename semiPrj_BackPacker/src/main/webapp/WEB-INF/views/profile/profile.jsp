<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- 프로필 버튼 관련 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<!-- 폰트어썸 cdn -->
<script src="https://kit.fontawesome.com/794ac64f16.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style type="text/css">

        .profileWrap{
           padding-top: 50px;
           width: 600px;
           height: 700px;
           margin: auto;
       }
       .profileTop{
          
           height: 10%;
           display: grid;
           grid-template-columns: 3fr 1fr;
           
           
       }
   
       #profileTopLeft{
       		font-size : 22px;
           grid-row: 1/3;
           text-align: left;
           color:  #94d2e6;
       }
       
     
   
       #profileTopRightUp{
           text-align: center;
           font-size: 24px;
           
   
       }
   
       #profileTopRightDown{
           display: grid;
           grid-template-columns: 1fr 1fr;
           text-align: center;
           font-size: 12px;
       }
   
       #profileTopRightUp button{
          background-color : #F16F6F;
           color: white;
           width: 135px;
           height: 30px;
           font-size: 15px;
           border: 0px;
           border-radius: 10px;
       }
       
       #profileTopRightDown button{
           border: 0px;
           background-color: #94d2e6;
           color: white;
           margin: auto;
           width: 65px;
           height: 20px;
           font-size: 9px;
           border-radius: 5px;
       }
   
   
   
   
       .profileMiddle{
           height: 40%;
          
           display: grid;
           grid-template-columns: 1fr 4fr;
           grid-template-rows: 1fr 7fr;
           
           
       }
       #profileMidLeft{
           padding: 10px;
           text-align: right;
           vertical-align: top;
           grid-row: 1/3;
       }
   
       #profileMidRightUp{
           display: grid;
           grid-template-columns: 9fr 4fr;
           grid-row: 1;
           text-align: left;
       }
       #profileMidRightUpDistance{
           font-size: 25px;
           color:  #94d2e6;
       }
       #profileMidRightUpKm{
           font-size: 18px;
           letter-spacing: 1px;
           color:  #94d2e6;
       }
       .profileMidRightDown{
          word-wrap: break-word;
         width: 430px;
         height: 200px;
           letter-spacing: 0.5px;
           overflow: auto;
           border : 0px ;
            resize: none; /* 크기 조절 방지 */
            border: none; /* 보더 제거 */
       	 outline: none; 
   
       }
   
       .profileBottom{
           margin-left: 30px;
           height: 50%;
           
           
       }
       #more{
           
           margin: auto;
           width: 80px;
           border: 0px;
           font-size: 15px;
           border-radius: 10px;
           background-color: #94d2e6;
           color: white;
       }
       #profileBottomTitle{
           margin-left: 60px;
           font-size: 24px;
           letter-spacing: 1px;
            color:  #94d2e6;
       }
       .comentContent{
       		display: flex;
   			 align-items: flex-start;
       		overflow : auto;
           font-size: 15px;
       }
       .dateIdNick{
          font-size : 12px;
         text-align: right;
          width : 100%;
         height: 50px
          
      }
        
       .imgInput{
           padding: 5px;
           width: 50px;
           text-align: right;
           vertical-align: top;
           cursor: pointer;
       }
         
         #reviewTable{
         height : 150px
         }
         .btnimg{
         cursor: pointer;
         	border: 0px;
         	cursor: pointer;
         }
         .profile-border{
         border-radius : 50px;
         }
   </style>
</head>

<body>

    <div class="profileWrap">

        <div class="profileTop">
            <div id="profileTopLeft">
                ${selectMember.nick } 님의 프로필
    
            </div>
            
            <div id="profileTopRightUp">
              <button id="writeReview" onclick="writeReview()">
                후기 작성하기
              </button>    
            </div>
            <c:if test="${selectMember.memberNo eq loginMember.memberNo }">
            <div id="profileTopRightDown">
               
            </div>
            </c:if>
        </div>

        <div class="profileMiddle">
            <div id="profileMidLeft">
            	<c:if test="${not empty selectMember.profileImage}">
                              <img  width="100px" height="100px" class="profile-border" src="${root}/static/img/member/profile/${selectMember.profileImage}" alt="" >
		                               
       					</c:if>
       					<c:if test="${empty selectMember.profileImage}">
       						 <img  width="100px" height="100px" class="profile-border" src="${root}/static/img/member/profile/profile_default.jpg" alt="" >
       					</c:if>
            </div>
            <div id="profileMidRightUp">
                <div id="profileMidRightUpDistance">
                    <b>
                       ✈ 이동한 거리
                    </b>
                </div>
                <div id="profileMidRightUpKm">
                   <b>${selectMember.memberScore } KM</b> 
                </div>
            </div>
            
            <div class="profileMidRightDown">
               <textarea class="profileMidRightDown" readonly >
               
                    ${ selectMember.introMessage}
               </textarea>
                
            </div>

        </div>
        

        <div class="profileBottom">
            <div id="profileBottomTitle">
            <div class="memberNoDiv" hidden>${selectMember.memberNo}</div>
            <div class="loginMemberDiv" hidden>${loginMember.memberNo}</div>
            <div class="crvDiv" hidden>${crv}</div>
                <b>${selectMember.nick}님이 받은 평가</b>
                <button id="more">더보기</button>
            </div>
            <br>
            <div>
               <c:forEach items="${ selectMemberReviewlist }" var="reviewList" end="1">
                <table id="reviewTable">
                    <tr>
		                  <td hidden>
		                     ${reviewList.giverNo}
		                  </td>
                        <td class = "imgInput " rowspan="2"  >
                          
                          <c:if test="${not empty reviewList.giverProfile}">
                              <img   width="50px" height="50px"  class="btnimg profile-border" src="${root}/static/img/member/profile/${reviewList.giverProfile}" alt="" onclick="goProfile(  ${reviewList.giverNo})" >
		                               
	       					</c:if>
	       					<c:if test="${empty reviewList.giverProfile}">
	       						 <img   width="50px" height="50px"  class="btnimg profile-border" src="${root}/static/img/member/profile/profile_default.jpg" alt="" onclick="goProfile(  ${reviewList.giverNo})" >
	       					</c:if>
                          

                        </td>
                        <td class="comentContent" >${reviewList.boardTitle} <br><br> ${reviewList.content}</td>
                    </tr>
                    <tr>
                        
            
                        <td class="dateIdNick">${reviewList.enrollDate} ${reviewList.giverId} ${reviewList.giverNick}</td>

                    </tr>
            
                </table>
                <br>
                
                </c:forEach>
                
         </div>
         </div>
            
           


       

    </div>
</body>
</html>


<script>
 
   const more = document.querySelector("#more");
   more.addEventListener('click',function(e){
      const no1 = e.target.parentNode.children[0].innerText; //게시글 작성자 번호
            
      e.preventDefault();
        window.location.href ='${root}/click/profile/review/detail?selectMemberNo='+no1;
   });
   
   
   function writeReview() {
	   let memberNoDiv = null;
	   memberNoDiv = document.querySelector(".memberNoDiv");
	   let memberNo = null;
       memberNo = memberNoDiv.innerText;
       const loginMemberDiv = document.querySelector(".loginMemberDiv")
       const loginMemberNo = loginMemberDiv.innerText;
       
       if (memberNo == loginMemberNo) {
           Swal.fire({
               icon: 'error',
               title: '본인',
               text: '작성자 본인은 작성이 불가능합니다.',
           });
       }else {
    	   
                	   window.location.href = '${root}/click/profile/review?selectMemberNo=${selectMember.memberNo}&loginMemberNo=${loginMember.memberNo}';
               
	     
       
       }
      
   };


   function goProfile(e){
	   
	
	   window.location.href = '${root}/click/profile?selectMemberNo='+e;
	};

  
   
   
</script>

