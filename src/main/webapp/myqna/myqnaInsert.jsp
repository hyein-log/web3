<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
  <title>Finances &mdash; Website Template by Colorlib</title>
  <meta charset="utf-8">
<style type="text/css">
.sendForm{
    width: 35%;
/*     margin: auto;
 */   
  font-family: "Open Sans";
    padding: 3%;
    margin-top: 5%;
    margin-bottom: 10%;
    margin-left: 500px;
}

.form-accSend {
    width: 80%;
    height: 23px;
    /* display: block; */
    border-radius: 10px;
    border: 1px solid #ced4da;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
}

.form-accSend:active, .form-accSend:focus {
    outline: 1px solid #007bff;
}
.form-content:active, .form-content:focus {
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
}



.form-content{
	width: 80%;
    height: 150px;
    /* display: block; */
    border-radius: 10px;
    border: 1px solid #ced4da;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
   /*  line-height: 1.5; */
  /*   color: #495057; */
    background-color: #fff;
}


h2{
	/* margin-left: 180px; */

}

.btnCencel{
 	background-color: #fff;
    border: 1px solid #007bff;
    color: #007bff;
    color: #007bff;
    font-size: 15px;
    border-radius: 8px;
    padding: 10px 30px;
    font-weight: 400;
    height: 40px;
}

.btnCencel:hover , .btnSubmit:hover{
	background-color: #007bff;
	color: #fff;
    font-size: 15px;
    border-radius: 8px;
    color: #fff;
    padding: 10px 30px;
    font-weight: 400;
    height: 40px;
}

.btnSubmit {
background-color: #fff;
    border: 1px solid #007bff;
    color: #007bff;
    font-size: 15px;
    border-radius: 8px;
    padding: 10px 30px;
    font-weight: 400;
    height: 40px;

}

.sendbtnDiv{
   /*  text-align: center; */
   margin-left: 180px;
}
</style>
</head>

<jsp:include page="../finances-master/header/header.jsp"></jsp:include>


<form action="myqnaInsert.do" class="sendForm" method="get">
	<h2>1:1 문의하기</h2>
	<p style="font-size: 13px;">
	· 문의글의 답변은 마이페이지 > 1:1문의내역에서 조회 가능합니다.<br>
	<span style="color: #007bff;font-weight: bold;">· 서비스 운영시간 : 오전 9시 ~ 오후 6시 월 ~ 금 (토, 일, 공휴일 제외)</span>
	</p>
	<br>
        <div class="title" style="color: black;font-weight: bold;">
          제목  <pre><input type="text" class="form-accSend" name="title"> </pre>
        </div>
        <div class="content" style="color: black;font-weight: bold;">
          내용  <pre><textarea class="form-content" name="content"></textarea></pre>
        </div>
      <div class="sendbtnDiv">
			<input type="submit" class="btnSubmit" value="글쓰기" >
			<input type="reset" class="btnCencel" value="취소" >
		</div>
    </form>
 
 

<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>

  


</body>

</html>
