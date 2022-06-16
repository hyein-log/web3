
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>

<meta charset="UTF-8">

<title>계좌개설</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<style type="text/css">
html {
    position: relative;
    min-height: 100%;
    margin: 0;
}
body {
    min-height: 100%;
}
.wrap {
	width:35%;
	margin: auto;
	padding-top: 5rem;
} 
.sendForm{
    /*width: 30%;*/
    font-family: 'Nanum Gothic', sans-serif;
   /* padding: 3%;*/
    margin-bottom: 10%;
    margin-left: 50px;
}

.form-accSend {
    width: 350px;
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
  /*   margin-top: 3%; */
}

.form-accSend:active, .form-accSend:focus {
    outline: 1px solid #007bff;
}
.sendDiv {
    margin-bottom: 30px;
    color: #007bff;
    
   
}

.sendbtnDiv{
   margin-left: 15%;
}
label{
    color:#000;
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


.btnCencel{
 	background-color: #fff;
    border: 1px solid #007bff;
    color: #007bff;
    font-size: 16px;
    border-radius: 30px;
    color: #007bff;
    font-size: 16px;
    border-radius: 30px;
    padding: 10px 30px;
    font-weight: 400;
    height: 46px;
}

.btnCencel:hover{
	background-color: #007bff;
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


.#accCreat {
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
	/* padding-left: 250px; */
}

.idLink{
	text-decoration: none;
	color: #007bff;
	font-weight: bold;
	padding-left: 310px;
}

#accSelect{
	/* margin-left: 400xpx; */
    font-family: 'Nanum Gothic', sans-serif;
    padding: 3%;
    margin-top: 10%;
}

</style>
</head>

<jsp:include page="../finances-master/header/header.jsp"></jsp:include>
<div class="wrap"> 
<div id="accSelect">
	<h2 id="accCreat1">개설계좌선택</h2>
	<br>
	<input type="radio" name="bank_account" value="0" checked="checked" data-bank="입출금통장" style="margin-left: 40px;" >입출금통장
	<input type="radio" name="bank_account" value="1" data-bank="적금통장" style="margin-left: 50px;">적금통장
	<input type="radio" name="bank_account" value="2" data-bank="예금통장" style="margin-left: 50px;">예금통장
</div>
<br><br>

<form action="acc_create.do" class="sendForm" method="post" >


        <div class="sendDiv align">
            <label class="accNum">계좌 종류 :</label>
           <span id="bankType" style="font-weight: bold;">입출금통장</span>
           <input type="hidden" name="bank_account"  id="bank_account" value="0">
        </div>
        <div class="sendDiv align">
            <label class="accNum">이름 :</label>
            <input type="text" name="member_id" value="${member.name }">
        </div>
        <div class="sendDiv align">
            <label class="accNum">계좌 비밀번호 :</label><br><br>
           <input type="password" name="acc_pass" class="form-accSend">
        </div>
        <div class="sendbtnDiv">
			<input type="submit" class="btnSubmit" value="개설하기" >
			<input type="reset" class="btnCencel" value="취소" >
		</div>
        
    </form>
 </div>
 <script>
$(function(){
	 
	$("input[name='bank_account']").change(function(){
		$("#bankType").html( $(this).attr("data-bank") );
		$("#bank_account").val($(this).val());
	});
	
});

 </script>
 

<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>

  



</body>
</html>

