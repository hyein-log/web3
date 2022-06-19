<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous">
</script>

<style type="text/css">
html {
    position: relative;
    min-height: 100%;
    margin: 0;
}
body {
    min-height: 100%;
}


.container{
    width: 40%;
    margin-left: 470px;
    font-family: 'Nanum Gothic', sans-serif;
    padding: 2%;
     margin-top: 2%; 
    margin-bottom: 10%;
   /*  border: 1px solid #E0E0E0; */
}


.quaTitle {
	color: #007bff;
	font-weight: 900;
	font-size: 30px;
	margin-left: 650px;
	margin-top: 150px;
	/* margin-bottom: 3%; */
	font-family: 'Nanum Gothic', sans-serif;

}

.accNum{
	font-weight: bold;
	font-size: 16px;
	margin-left: 20px;
}

#password1, #password2{
	 width: 300px;
    height: 30px;
    display: inline;
    border-radius: 20px;
    border: 1px solid #ced4da;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
     /* margin-top: 1%;  */
  	margin-left: 100px;
}
/* #password1{
	margin-left: 55px; 
} */

#password1:active, .#password1:focus {
    outline: 1px solid #007bff;
}

#password2:active, .#password2:focus {
    outline: 1px solid #007bff;
}

#change_btn{
	margin-top: 40px;
    background-color: #007bff;
    border: none;
    color: #fff;
    font-size: 16px;
    border-radius: 20px;
    color: #fff;
    padding: 10px 30px;
    font-weight: 400;
    height: 46px;
     cursor: pointer;
     margin-left: 170px;
}


.listTitle2{
	margin: auto;
	margin-left: 650px;
	font-size: 15px;
	/* margin-bottom: 1%; */
	color: gray;
}


</style>
</head>

<jsp:include page="../finances-master/header/header.jsp"></jsp:include>


<body>

<h2 class="quaTitle">비밀번호 재설정</h2>
<div class="listTitle2">변경할 비밀번호를 입력해주세요.</div>
	
<div class="container">

<!-- <span class="accNum">새 비밀번호</span> -->
<input type="text" name="password1" id="password1" placeholder="새 비밀번호"><br><br>

<!-- <span class="accNum">새 비밀번호 확인</span> -->
<input type="text" name="password2" id="password2" placeholder="새 비밀번호 확인"><br>

<input type="button" id="change_btn" value="비밀번호 재설정"><br>

</div>


<script>
	$("#change_btn").on("click",function(){
		var password1 = $("#password1").val();
		var password2 = $("#password2").val();
		if(password1.length < 1 && password2.length < 1){
			alert("패드워드를 입력해주세요!");
			return false;
		}
		if($("#password1").val() != $("#password2").val()){
			alert("비밀번호 확인 실패.");
			return false;
		}
		location.href = "pwChange.do?password="+password1;
	});
</script>

<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>

</body>
</html>