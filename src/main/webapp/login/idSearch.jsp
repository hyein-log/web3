<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
  <title>COS BANK 아이디찾기</title>
  <meta charset="utf-8">

<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
html {
	position: relative;
	min-height: 100%;
	margin: 0;
}

body {
	min-height: 100%;
}
.sendForm{
    width: 30%;
    margin: auto;
    font-family: 'Nanum Gothic', sans-serif;
    padding: 3%;
    margin-top: 7%;
    margin-bottom: 7%;
}

.form-accSend {
    width: 90%;
    height: 30px;
    display: block;
    border-radius: 30px;
    border: 1px solid #ced4da;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    margin-top: 3%;
}

.form-accSend:active, .form-accSend:focus {
    outline: 1px solid #007bff;
}
.sendDiv {
    margin-bottom: 30px;
}

.sendbtnDiv{
    text-align: center;
}
label{
    color:#007bff;
    margin-bottom: 0.5rem;
    font-size: 16px;
}
.btnSubmit {
    background-color: #007bff;
    border: none;
    color: #fff;
    font-size: 16px;
    border-radius: 30px;
    color: #fff;
    font-size: 16px;
    border-radius: 30px;
    padding: 10px 30px;
    font-weight: 400;
    height: 46px;
}

#signIn {
	font-size: 30px;
	text-align: center;
}

.signJoin{
	text-align: center;
}


.joinLink{
	text-decoration: none;
	color: #007bff;
	font-weight: bold;
}

.accNum{
	font-weight: bold;
}

.passLink{
	text-decoration: none;
	color: #007bff;
	font-weight: bold;
	padding-left: 250px;
}

.idLink{
	text-decoration: none;
	color: #007bff;
	font-weight: bold;
	padding-left: 310px;
}

.btnSubmit{
	cursor: pointer;
}

</style>
</head>

<jsp:include page="../finances-master/header/header.jsp"></jsp:include>

<form class="sendForm" method="get" encType="UTF-8">
<h2 id="signIn">ID Search.</h2>
<br><br>
        <div class="sendDiv align">
            <label class="accNum">Name*</label>
            <input type="text" class="form-accSend" name="name" id="name">
        </div>
        <div class="sendDiv align">
            <label class="accNum">Email *</label>
            <input type="text" class="form-accSend" name="email2" id="email2">
        </div>
          <div class="sendbtnDiv">
        	<input type="button" id="confirm_btn" class="btnSubmit" value="Send by email">
        </div>
    </form>
 <form action="MailSend.do" method="post" id="mailsendfrm">
  <input type="hidden" name="id" id="id">
  <input type="hidden" name="email" id="email">
</form>
 


  
<script>
	$("#confirm_btn").on("click", function(){
		//var frm = $("#idSearch");	
		
		if($("#name").val().length < 1){
			alert("이름을 입력해주세요.");
			return false;

		}
		if($("#email2").val().length < 1){
			alert("이메일을 정확하게 입력해주세요.");
			return false;
		}
		$.ajax({
			url:"IdSearch.do",
			type:"post",
			data:{"name":$("#name").val(),
				"email":$("#email2").val()},
			success:function(responseData){
				if(responseData!=0){
					$("#id").val(responseData);
					$("#email").val($("#email2").val());
					$("#mailsendfrm").submit();
				   //location.href="MailSend.do?id=" + responseData+"&email="+$("#email").val();
				}else{
					alert("해당하는 id가 없습니다.");
					$("#name").val("");
					$("#email").val("");
					$("#name").focus();
				}
			}
		});
		
	});  
	

</script>

<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>

</body>

</html>