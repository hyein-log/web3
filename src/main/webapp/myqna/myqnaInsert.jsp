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
    margin: auto;
    font-family: "Open Sans";
    padding: 3%;
    margin-top: 10%;
    margin-bottom: 10%;
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
	margin-left: 180px;

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
    height: 45px;
}

.btnCencel:hover , .btnSubmit:hover{
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

.btnSubmit {
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
    height: 45px;
}

.sendbtnDiv{
   /*  text-align: center; */
   margin-left: 180px;
}
</style>
</head>

<jsp:include page="../finances-master/header/header1.jsp"></jsp:include>


<form action="qnaInsert.do" class="sendForm" method="get">
	<h2>1:1 문의하기</h2>
	<br>
        <div class="title">
          제목 : <pre><input type="text" class="form-accSend" name="title"> </pre>
        </div>
        <div class="title">
          작성자 : <pre><input type="text" class="form-accSend" name="member_id" value="1"> </pre>
        </div>
        <div class="content">
          내용 : <pre><input type="text" class="form-content" name="content"></pre>
        </div>
      <div class="sendbtnDiv">
			<input type="submit" class="btnSubmit" value="Write" >
			<input type="reset" class="btnCencel" value="Cancel" >
		</div>
    </form>
 
 

<jsp:include page="../finances-master/footer/footer1.jsp"></jsp:include>

  


</body>

</html>