<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
  <title>COS BANK 로그인</title>
  <meta charset="utf-8">
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
.sendForm{
    width: 30%;
    margin: auto;
    font-family: 'Nanum Gothic', sans-serif;
    padding: 3%;
    margin-top: 6rem;
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
    margin-right: 0;
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
	float:right;
	margin-right: 20px;
}

.idLink{
	text-decoration: none;
	color: #007bff;
	font-weight: bold;
	float:right;
	margin-right: 20px;
}

</style>
</head>


<jsp:include page="../finances-master/header/header.jsp"></jsp:include>

<form action="login.do" class="sendForm" name="frmLogin" method="post" encType="UTF-8">
<h2 id="signIn">Sign in to COS.</h2>
<br><br>
        <div class="sendDiv align">
            <label class="accNum">ID</label>
            <span><a href="../login/idSearch.jsp" class="idLink">Forget id?</a></span>
            <input type="text" class="form-accSend" name="userid">
        </div>
        <div class="sendDiv align">
            <label class="accNum">Password</label>
            <span><a href="../login/pwSearch.jsp" class="passLink"> Forget password?</a></span>
            <input type="password" class="form-accSend" name="userpass">
        </div>
        <div class="sendbtnDiv">
            <button type="submit" class="btnSubmit" value="Sign in">Sign in</button>
        </div>
        <br>
        <div class="signJoin">
              <span>New to CO3? <a href="../login/memberJoin.jsp" class="joinLink"> Create an account.</a></span>
  		</div>
    </form>
 
 

<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>

  



</body>

</html>