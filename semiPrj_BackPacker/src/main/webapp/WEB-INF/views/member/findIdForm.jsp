<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 페이지</title>
<style>
        #findId-title {
            color: #94d2e6;
            text-align: center;
            margin-top : 10%;
            margin-bottom: 3%;
            font-weight: bold;
        }

        #findId-area {
           
            width: 30%;
            margin: auto;
        }

        #name-area {
            display: flex;
            justify-content: space-evenly;
        }

        #phone-area {
            display: flex;
            justify-content: space-evenly;

        }

        #name, #phone {
            border:none;
        }

        #name {
            border-left: 10%;
        }

        #span-name {
            margin-right: 10%;
        }

        .border-style {
            border: 1px solid lightgray;
            border-left:none;
            border-right:none;
            border-top:none;
            width: 60%;
        }
        
        #submit-btn {
            text-align: center;
            background-color: #94d2e6;
            color: white;
            border: none;
            width: 15%;
            height: 30px;
            margin-left: auto;
            margin-top: 3%;
            display: block;
            margin-right: 9%;
        }

        #check-id-area {
            text-align: center;
        }
    </style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<main>
        <h1 id="findId-title">아이디 찾기</h1> 
    <form action=""${pageContext.request.contextPath}/member/findId}">
        <div id="findId-area">
             <div id="name-area">
                <span id="span-name">이름</span>
                <div class="border-style">
                    <input id="name" type="text" placeholder="이름을 입력하세요" name="id">
                </div>
               
             </div>
             <br>
             <br>
             <div id="phone-area">
                <span>핸드폰 번호</span>
                <div class="border-style">
                    <input name="phoneNumber" id="phone" type="tel" placeholder="핸드폰 번호를 입력하세요">
                </div>
                
             </div>
             <br>
             <br>

             <input id="submit-btn" type="submit" value="찾기">
        </div>
        <br>
        <br>
        <br>
        <br>
        <br>
        <div id="check-id-area">
            <div>jonny님의 아이디는 jju9705 입니다.</div>
        </div>
            
    </form>
    </main>
    
</body>
</html>