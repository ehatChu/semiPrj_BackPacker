<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style>
       
        #logo-area {
            text-align: center;
            margin-top: 10%;
            margin-bottom: 5%;
        }
        
        #logo-area > #logo {
            width: 15%;
            height: 80px;
        }

        #login-area {
            width: 30%;
            margin: auto;
        }

        #login-area > #check-area {
            display: flex;
            justify-content: space-between;
        }
        
        .border-style {
            border: 1px solid lightgray;
            border-left: none;
            border-right: none;
            border-top: none;
            width: 100%;
            opacity: 70%;
            height: 60%;
        }

     
  label {
    font-size: 12px;
  }


  #login-btn {
    width: 100%;
    height: 50px;
    text-align: center;
    color: black;
    background-color: #94d2e6;
    border: none;
  }

  #next-area {
    display: flex;
    justify-content: space-between;
   
  }

  #next-area > a {
    color: black;
    text-decoration: none;
    font-size: smaller;
  }
    
  #join-btn {
    flex-basis: 60%;
  }

  #id-btn {
    flex-basis: 20%;
  }

  #password-btn {
    flex-basis: 20%;
  }






    </style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<main>
      <div id="logo-area">
        <img id="logo" src="${pageContext.request.contextPath}/static/img/logo/b_logo.png" alt="로고 사진">
    </div>

    <form action="${pageContext.request.contextPath}/member/login" method="POST">
        <div id="login-area">
            <input name="id" class="border-style" type="text" placeholder="아이디를 입력하세요">
            <br>
            <br>
            <input name="password" class="border-style" type="password" placeholder="비밀번호를 입력하세요">
            <br>
            <br>
            <br>
            <br>
            <br>
            <input id="login-btn" type="submit" value="로그인">
			

            <div id="next-area" class="next-area">
                <a id="join-btn" href="${pageContext.request.contextPath}/member/join">회원가입</a>
                <a id="id-btn" href="${pageContext.request.contextPath}/member/find/id">아이디 찾기</a>
                <a id="password-btn" href="${pageContext.request.contextPath}/member/find/password">비밀번호 찾기</a>
            </div>

        </div>


    </form>
    </main>
    
    
    <script type="text/javascript">
        $(document).ready(function() {
            $("form").submit(function(event) {
                event.preventDefault(); // Prevent the form from submitting

                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/member/login",
                    dataType: 'json',
                    data: $(this).serialize(), // Serialize the form data
                    success: function(data) {
                        console.log(data);
                        if (data === 'success') {
                            Swal.fire({
                                title: '로그인 성공',
                                icon: 'success'
                            }).then(function() {
                                // Redirect to the home page or desired URL
                                window.location.href = "${pageContext.request.contextPath}/home";
                            });
                        } else if (data === 'fail') {
                            Swal.fire({
                                title: '로그인 실패',
                                text: '아이디와 비밀번호를 확인하세요',
                                icon: 'error',
                                confirmButtonText: '확인'
                            });
                        }
                    }
                });
            });
        });
    </script>
</body>
</html>