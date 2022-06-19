<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COS BANK 공지사항 수정</title>

<style type="text/css">
.wrap{
		width: 900px;
		margin-left: 450px;
		/* border: 1px solid black; */
		margin-top: 20px;
		height: 300px;
		
	}

.hTitle{
	color: #007bff;
	font-weight: 900;
	font-size: 30px;
	margin-left: 400px;
	margin-top: 150px;
	margin-bottom: 2%;
	font-family: 'Nanum Gothic', sans-serif;
}

.sendbtnDiv {
	text-align: center;
	margin-top: 1%;
}

.btnSubmit,.btnReset {
	background-color: #007bff;
    border: 1px solid #007bff;
    color: white;
    font-size: 15px;
    border-radius: 8px;
    padding: 10px 30px;
    font-weight: 400;
    height: 40px;
    cursor: pointer;
}

.accNum{
	font-weight: bold;
	font-size: 16px;
	margin-left: 50px;
}

.form-accSend {
    width: 80%;
    height: 20px;
    display: inline;
    border-radius: 20px;
    border: 1px solid #ced4da;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    margin-top: 3%;
  	 margin-left: 20px; 
}

.form-accSend:active, .form-accSend:focus {
    outline: 1px solid #007bff;
}

.form-content {
	width: 80%;
	height: 200px;
	/* display: block; */
	border-radius: 10px;
	border: 1px solid #ced4da;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	font-weight: 400;
	/*  line-height: 1.5; */
	/*   color: #495057; */
	background-color: #fff;
	resize: none;
	margin-left: 120px;
}

.form-content:active, .form-content:focus {
    outline: 1px solid #007bff;
}
</style>
</head>
<body>
<h2 class="hTitle">공지사항 수정</h2>
<div class="wrap">

<form action="noticeUpdate.do" method="post">
	<input type="hidden" name="nno" value="${notice.notice_id}">
	
	<span class="accNum">제목 : </span>
	 <input type="text" name="title"  value="${notice.notice_title}" class="form-accSend"><br>
	 
	 <span class="accNum">내용 : </span><br>
	<%-- <input type="text" name="content"  value="${notice.notice_content}"><br> --%>
	<pre><textarea name="content"  class="form-content">${notice.notice_content}</textarea>
	</pre>
	 
	 <div class="sendbtnDiv">
	  	<input type="submit" class="btnSubmit" value="등록">
	 	<input type="reset" class="btnReset" value="취소">
	 </div>
</form>
</div>

</body>
</html>