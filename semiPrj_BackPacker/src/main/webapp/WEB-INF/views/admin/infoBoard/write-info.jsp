<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- alert창 꾸미기 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	main{
		margin-top: 66px;
		padding: 0px;
		width:100%;
		height: 1100px; 
	}
	
	#travelReviewWrite{
		background-color:white;
		height:900px;
		width: 60%;
		margin:auto;
		display:flex;
		flex-direction: column;
		justify-content:space-evenly;
	}
	
	#reviewWrite{
		font-size: 2em;
		margin-top:66px;
	}
	
	#imgUpload{
		border: 1px solid lightgray;
		box-sizing: border-box;
		display:flex;
		justify-content:center;
		align-items:center;
		height:300px;
		width:90%;
		background-color:lightgray;
		position: relative;
	}
	
	
	label{
		cursor: pointer;
		font-size:1.4em;
		margin-left:90px;
	}
	
	#imgFile{
		visibility: hidden;
		
	}
	
	#write-title{
		border:1px solid lightgray;
		border-radius: 5px;
		width:90%;
		margin-top:10px;
		margin-bottom:10px;
		height:30px;
	}
	
	.summernote{
		border:1px solid lightgray;
		margin-top:10px;
		height:450px;
	}
	
	.note-editor{
		width:90%;
	}
	
	#submit{
		display:flex;
		justify-content: flex-end;
	}
	
	#submit > input{
		margin-right:80px;
        border-radius: 10px;
        border: 1px solid #94d2e6;
        background-color:  #94d2e6;
        height:40px;
        color:white;
        margin-top:10px;
		width:120px;
    }

	#main{
		display: flex;
		position: relative;
		align-items: center;
	}

	#Thumnail{
		position: absolute;
		display: flex;
		width: 100%;
	}

	#Thumnail > label{
		text-align: center;
		width: 120%;
	}
    

    

	
	
</style>
</head>
<body>


	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<main>
	
		<div id="travelReviewWrite">
			<br>
			<br>
			<div id="reviewWrite">여행정보 게시글 작성</div>
		
			<br>
				<form name="sub1" action="${root}/admin/infoBoard/write" method="post" enctype="multipart/form-data">
					<div id="main">
						<img id="imgUpload">
						<div id="Thumnail">
							<label id="upload" for="imgFile">
								썸네일 사진 올리기
							</label>
							<input type="file" name="fileName" id="imgFile">
						</div>
						
					</div>

						<input type="text" name="title" id="write-title"placeholder="제목을 30자 이내로 적어주세요." maxlength="30">
						<br>
						
						<textarea id="summernote" name="content" style="resize:none;" ></textarea>
						
						
							<div id="submit">
								<input type="button" value="작성 완료" onclick="send();">
							</div>
				</form>

			

		</div>
		
		
		
	</main>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
    <script>



    	$('#summernote').summernote({
			
    	  placeholder: 'Hello stand alone ui',
    	  tabsize: 2,
    	  height: 450,
          callbacks : {
              onImageUpload : f01,
      			},
    	  toolbar: [
    	    ['style', ['style']],
    	    ['font', ['bold', 'underline', 'clear']],
    	    ['color', ['color']],
    	    ['para', ['ul', 'ol', 'paragraph']],
    	    ['table', ['table']],
    	    ['insert', ['link', 'picture', 'video']],
    	    ['view', ['fullscreen', 'codeview', 'help']]
    	  ]
    	});
    	
        //파일업로드 발생 시 동작
        function f01(fileList){

          const fd = new FormData();
          for(let file of fileList){
            fd.append("f" , file);
          }

          $.ajax({
            url : '${root}/upload' ,
            type : 'post' ,
            data : fd ,
            processData : false ,
            contentType : false ,
            dataType : 'json' ,
            success: function(changeNameList) {
			console.log(changeNameList);
			for (let changeName of changeNameList) {
				const imageUrl = '${root}/static/img/travelReview/' + changeName;
				$('<img>').on('load', function() {
				$(this).attr('width', '300'); // Set the desired width
				$(this).attr('height', '200'); // Set the desired height
				$('#summernote').summernote('insertNode', this);
				}).attr('src', imageUrl);
			}
			},
            error : function(error){
              console.log(error);
            } ,
          });

        }
              
		const fileTag = document.querySelector("#imgFile");
		const Thumnail = document.querySelector('#Thumnail');
		const preview = document.querySelector("#imgUpload");
		
		fileTag.addEventListener('change' , function (params) {
			

			if(fileTag.files.length > 0){
				const fr = new FileReader();
				fr.readAsDataURL(fileTag.files[0]);

				fr.addEventListener("load" , function(event) {
					preview.src = event.target.result;
					preview.width = "100";
					preview.height = "100";
					Thumnail.style.visibility='hidden';
				})
				
			}else{
				preview.src = "";
			}
			
		})

		//정보작성시 제목 안넣었을때 작성 못하게
		function send(params) {
			if(document.querySelector('input[name=title]').value==""){
				Swal.fire({
				title : '정보 작성을 실패하였습니다.',
				icon: 'warning',
				text: '제목을 입력해주세요',
			})
				return false;
			}else{
				document.querySelector('form[name=sub1]').submit();
				Swal.fire({
				title : '정보 작성을 성공하였습니다.',
				icon: 'success',
				text: '',
			
			})
		}
	}		

		
     </script>

</body>
</html>