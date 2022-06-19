<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style type="text/css">
.wrap{
	
	margin: auto;
	padding-top: 5rem;
	font-family: 'Nanum Gothic', sans-serif;
}

.adminTitle{
color: #007bff;
	font-weight: 900;
	font-size: 30px;
	margin-top: 120px;
	margin-left: 15px;
	text-align: center;
	font-family: 'Nanum Gothic', sans-serif;
}

#qna_list_btn{
	margin-left: 250px;
	width: 500px;
	height: 80px;
	background-color: white;
	border: 1px solid gray;
	/* font-weight: bold; */
	font-size: 15px;
	color: #616161;
	cursor: pointer;
	font-family: 'Nanum Gothic', sans-serif;
}

#notice_list_btn{
	margin-left: 5px;
	width: 500px;
	height: 80px;
	background-color: white;
	border: 1px solid gray;
	font-size: 15px;
	color: #616161;
	cursor: pointer;
	font-family: 'Nanum Gothic', sans-serif;
	
}

#qna_list_btn:hover{
	margin-left: 250px;
	width: 500px;
	height: 80px;
	background-color: #007bff;;
	border: 1px solid #007bff;;
	/* font-weight: bold; */
	font-size: 15px;
	color: white;
	cursor: pointer;
	font-weight: bold;
}
#notice_list_btn:hover{
	margin-left: 5px;
	width: 500px;
	height: 80px;
	background-color: #007bff;;
	border: 1px solid #007bff;;
	/* font-weight: bold; */
	font-size: 15px;
	color: white;
	cursor: pointer;
	font-weight: bold;
}
</style>
</head>
<body>
<div class="wrap">
<h2 class="adminTitle" >COS BANK <br>관리자 페이지입니다.</h2>
<span class="adminPage">
<input type="button" id="qna_list_btn" value="문의사항 목록">
<input type="button" id="notice_list_btn" value="공지사항 목록"><br></span>
</div>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	$("#notice_list_btn").click(function(){
		location.href = "../notice/NoticeList.do";
	});
});
$(function(){
	$("#qna_list_btn").click(function(){
		location.href = "../myqna/myqnalist.do";
	});
});
</script>
</html>