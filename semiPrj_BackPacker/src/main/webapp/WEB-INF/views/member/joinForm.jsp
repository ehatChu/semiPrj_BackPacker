
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style>
      #joinTitle {
            text-align: center;
            color: #94d2e6;
            margin-top: 5%;
            font-weight: bold;
        }

        #join-area {
            border: 1px solid lightgray;
             margin: auto;
            width: 50%; /* 전체 폭 조정 */
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
  
        }

       
        #first-area {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            flex-basis: 50%;
            margin-bottom: 20px;
            margin-left: 5%;
            margin-top: 5%;
        }

        #name-area {
            display: flex;
            flex-direction: column;
            margin-right: 10%;

        }


        #second-area {
            display: flex;
            flex-wrap: wrap;
            flex-basis: 30%;
            margin-bottom: 20px;
            margin-top: 5%;
            margin-right: 5%;
        }

        #input-area {
            display: flex;
            flex-direction: column;
        }

        #third-area {
            margin-top: 10%;
            flex-basis: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
        }

        .border-style {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            border: 1px solid lightgray;
            border-left: none;
            border-right: none;
            border-top: none;
        }




        input {
            border: none;
            width: 100%;
            height: 70%;
        }

        #id {
            border: none;
            width: 50%;
            height: 70%;
        }

        
        #idWarning {
            font-size: 12px;
        }

       .input-style {
    display: flex;
    align-items: center; /* Center the input and button vertically */
    justify-content: space-between; /* Add space between input and button */
    width: 100%;
    border: 1px solid lightgray;
    border-top: none;
    border-left: none;
    border-right: none;
}

#checkId,
#checkNick {
    border: none;
    color: white;
    background-color: #94d2e6;
    height: 70%; /* Adjust the height as needed */
    margin-left: 10px; /* Add space between input and button */
    padding: 5px 10px; /* Add padding to the button */
    text-align: center;
}
       

        #nick {
            border: none;
            width: 50%;
            height: 80%;
        }

        #message {
            font-size: 12px;
            color: gray;
        }
        
        #gender-area input {
            width: 15%;
        }

        #intro-title {
            color: gray;
            font-size: 30px;
        }

        #intro-message {
            font-size: 10px;
            color: gray;
        }


        #guide-message {
            color: gray;
            font-size: 12px;
        }

        #submit-btn {
            color: white;
            background-color: #94d2e6;
            width: 50%;
            height: 40px;
        }
        
        .test-style {
        	height: 30px;
        }
        
       #gender-area input[type="radio"] {
  width: 15px;
  height: 15px;
  margin-right: 5px;
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  border-radius: 50%;
  border: 2px solid lightgray;
}

#gender-area input[type="radio"]:checked {
  background-color: #94d2e6;
  border-color: #94d2e6;
}

#gender-area input[type="radio"]::before {
  content: '';
  display: block;
  width: 60%;
  height: 60%;
  margin: 20% auto;
  border-radius: 50%;
  background-color: #94d2e6;
  visibility: hidden;
}

#gender-area input[type="radio"]:checked::before {
  visibility: visible;
}
    	.label-age {
    		margin-top: 10px;
    	}
    	
    	#gender-box {
    		margin-top: 5px;
    	}
    	
    	#age-box {
    		margin-top: 10px;
    	}
    	
    	#file-input {
    		display: none;
    		
    	}
    	
    	.button-text {
    		display: flex;
		    align-items: center;
		    justify-content: center;
		    height: 100%;
    	}
    	
    	#profile-area {
    		cursor: pointer;
    	}
    	
    	/* .preview-area {
            width: 200px;
            height: 200px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        } */
    </style>
     
   
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	 <main>
        <h1 id="joinTitle">회원가입</h1>

    <form id="join-form" action="${pageContext.request.contextPath}/member/join" method="POST" onsubmit="return checkJoinProcess();" enctype="multipart/form-data">
        <div id="join-area">
        
            <div id="first-area">
                <div class="input-style">
                    <input type="text" name="id" id="id" placeholder="아이디를 입력하세요">
                    <button type="button" id="checkId"><span class="button-text">아이디 중복 확인</span></button>
                </div>
                <span id="idWarning">아이디는 8~16자로, 영문과 숫자를 조합해야 합니다.</span>
                <br>
                <div class="input-style">
                    <input class="test-style" type="password" name="password" placeholder="비밀번호를 입력하세요">
                </div>
                <br>
                <div class="input-style">
                    <input class="test-style" type="password" name="passwordAgain" placeholder="비밀번호 재확인">
                </div>
                <br>
                <div class="input-style">
                    <input type="text" name="nick" id="nick" placeholder="닉네임(8자 이내)" maxlength="8">
                    <button type="button" id="checkNick"><span class="button-text">닉네임 중복 확인</span></button>
                </div>
                <br>

                <div class="input-style">
                    <input class="test-style" type="text" name="name" placeholder="이름을 입력하세요">
                </div>
                <br>
                <div class="input-style">
                    <input class="test-style" type="text" name="phoneNumber" placeholder="핸드폰번호를 입력하세요">
                </div>
                <br>
                <div class="input-style">
                	<input class="test-style" type="text" name="email" placeholder="이메일을 입력하세요">
                </div>
                <br>
                <div class="input-style">
                    <input class="test-style" type="text" name="address" placeholder="주소를 입력하세요">
                </div>
                <br>
                <span id="message"><i class="fa-solid fa-circle-info" style="color: #808080;"></i> 아이디, 닉네임, 이름, 성별은 한번 입력되면 수정할 수 없습니다.</span>
            </div>
           
            <div id="second-area">
                <div id="name-area">
                    <span id="gender-box">성별</span>
                    <br>
                    <span class="label-age">나이</span>
                    <br>
                    <label id="profile-area">
                    	프로필 사진
                    	<input id="file-input" type="file" name="profileImage">
                    </label>
                </div>
                <div id="input-area">
                    <div id="gender-area">
                        <label><input type="radio" name="gender" value="M">남</label>
                        <label><input type="radio" name="gender" value="F">여</label>
                    </div>
                    <br>
                    <select id="age-box" name="age" id="age">
                        <option value="20">20대</option>
                        <option value="30">30대</option>
                        <option value="40">40대</option>
                        <option value="50">50대</option>
                    </select>
                    <br>
                    <div id="preview-area" class="preview-area">
                    	
                    </div>
                </div>
    
                
                    
                            
            </div>

            <div id="third-area">
                <div id="intro-title">자기소개를 작성해주세요</div>
                <p id="intro-message">앞으로 올리실 모든 글에 들어가는 자기소개입니다. 마이 페이지에서 수정 가능합니다.</p>
                <br>
                <label>
                    <textarea style="resize: none;" name="introMessage" id="introduce-message" cols="70" rows="20" placeholder="자기소개는 최대 4000자까지 작성 가능합니다." resize="none" wrap="hard" ></textarea>
                </label>
            
                <br>
                <br>
                <br>
                <p id="guide-message"><i class="fa-solid fa-circle-info" style="color: #94d2e6;"></i> 프패커 등록은 가입후 마이페이지를 방문해 주세요</p>
                <input id="submit-btn" type="submit" value="가입하기">
            </div>
        </div>
    </form>
    </main>


	<script>
		//사진 미리보기
		const fileTag = document.querySelector("input[type=file]");
		const previewArea = document.querySelector("#preview-area");
		let currentImage;
		fileTag.onchange = function(e){
			if(fileTag.files.length == 0) {
				previewArea.innerHTML = '';
				return;
			}
			
			const fr = new FileReader();
			
			fr.readAsDataURL(fileTag.files[0]);
			fr.onload = function(e) {
				const imgTag = document.createElement('img');
				imgTag.src = e.target.result;
				imgTag.alt = "미리보기 이미지 사진";
				imgTag.width = 100;
				imgTag.height = 100;
				imgTag.style.borderRadius = "50%";
				
				
				 if (currentImage) {
	                    previewArea.removeChild(currentImage);
	                }

                // Set the new image as the current image
                currentImage = imgTag;
				
				
				previewArea.appendChild(imgTag);
			}
		};
		
		function checkJoinProcess() {
		    const formInputs = document.querySelectorAll('input[type="text"], input[type="password"]');
		    const genderCheckbox = document.querySelector('input[name="gender"]:checked');

		    for (let i = 0; i < formInputs.length; i++) {
		        if (formInputs[i].value.trim() === '') {
		            Swal.fire({
		                icon: 'error',
		                title: '회원가입 실패',
		                text: '모든 값을 입력하셔야 합니다',
		            });
		            return false;
		        }
		    }

		    if (!genderCheckbox) {
		        Swal.fire({
		            icon: 'error',
		            title: '회원가입 실패',
		            text: '성별을 선택해 주세요',
		        });
		        return false;
		    }
		    
		    const passwordInput = document.querySelector('input[name="password"]');
		    const passwordAgainInput = document.querySelector('input[name="passwordAgain"]');
		  
		    if (passwordInput.value.trim() !== passwordAgainInput.value.trim()) {
		        Swal.fire({
		            icon: 'error',
		            title: '비밀번호 오류',
		            text: '비밀번호가 일치하지 않습니다.',
		        });
		        return false;
		    }
		    
		    if(passwordInput.value.length < 4) {
		    	Swal.fire({
		    		icon: 'error',
		    		title: '비밀번호 오류',
		    		text: '비밀번호는 4자 이상이어야 합니다.'
		    	});
		    	return false;
		    }
		    
		    const phoneNumber = document.querySelector('input[name="phoneNumber"]').value;
		    
		    if(phoneNumber.length != 11) {
		    	Swal.fire({
		    		icon: 'error',
		    		title : '핸드폰번호 작성 오류',
		    		text : '핸드폰번호는 11자로 작성하셔야 합니다.'
		    	});
		    	return false;
		    }
		    
		    let isValid = true;
		    
		    $.ajax({
		        url: "${root}/member/join/checkPhoneNumber",
		        data: { 'phoneNumber': phoneNumber },
		        method: "POST",
		        dataType: "json",
		        async: false, // Make the request synchronous
		        success: function(data) {
		          if (data === false) {
		            Swal.fire({
		              title: '핸드폰번호 등록 불가',
		              icon: 'warning',
		              text: '입력하신 핸드폰번호는 이미 사용중입니다.'
		            });
		            isValid = false; // Set isValid flag to false
		          }
		        },
		        error: function(error) {
		          console.log(error);
		        }
		      });
		    
		    if(isValid) {
		    	Swal.fire({
					  icon: 'success',
					  title: '회원가입 성공',
					  text: '환영합니다!',
					});
			    
			    return true;
		    }
		    
		    return false;
		}
		
		

	</script>
	
	<script>
    // 아이디 중복확인
    const checkIdButton = document.querySelector("#checkId");
    checkIdButton.addEventListener("click", function() {
        const idInput = document.querySelector("#id");
        const id = idInput.value.trim();
		
        //add regex here
         const idRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;

            if (id === '') {
                Swal.fire({
                    icon: 'error',
                    title: '입력 오류',
                    text: '아이디를 입력하세요.',
                });
            } else if (!idRegex.test(id)) {
                Swal.fire({
                    icon: 'error',
                    title: '입력 오류',
                    text: '아이디는 8~16자로, 영문과 숫자만 조합해야 합니다.',
                });
            }  else {
            $.ajax({
                url: "${root}/member/join/checkId",
                data: { 'id': id },
                method: "POST",
                dataType: "json",
                success: function(data) {
                	console.log(data);
                    if (data === false) {
                        Swal.fire({
                            title : '아이디 사용 불가',
                            icon: 'warning',
                            text: id+'는 이미 사용중입니다.'
                            
                        });
                    } else {
                        Swal.fire({
                            title : '아이디 사용 가능',
                            icon: 'success',
                            text: id+'는 사용 가능합니다:)'
                            
                        });
                    }
                },
                error: function(error) {
                    console.log(error);
                }
            });
        }
    });
</script>


<script>
//닉네임 중복확인
const checkNickButton = document.querySelector("#checkNick");
checkNickButton.addEventListener("click", function() {
    const nickInput = document.querySelector("#nick");
    const nick = nickInput.value.trim();
	



        if (nick === '') {
            Swal.fire({
                icon: 'error',
                title: '입력 오류',
                text: '닉네임을 입력하세요.',
            });
        }  else {
		        $.ajax({
		            url: "${root}/member/join/checkNick",
		            data: { 'nick': nick },
		            method: "POST",
		            dataType: "json",
		            success: function(data) {
		            	console.log(data);
		                if (data === false) {
		                    Swal.fire({
		                        title : '닉네임 사용 불가',
		                        icon: 'warning',
		                        text: nick+'는 이미 사용중입니다.'
		                        
		                    });
                } else {
                    Swal.fire({
                        title : '닉네임 사용 가능',
                        icon: 'success',
                        text: nick+'는 사용 가능합니다:)'
                        
                    });
                }
            },
            error: function(error) {
                console.log(error);
            }
        });
    }
});
</script>
</body>
</html>