<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COS BANK 자동이체</title>
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
    width: 35%;
    margin-left: 470px;
    font-family: 'Nanum Gothic', sans-serif;
    padding: 2%;
    margin: auto;
   /*  margin-top: 5%;  */
    margin-bottom: 10%; 
     border: 7px solid #B6D9FF; 
     /* text-align: center; */

}

.listTitle{
	color: #007bff;
	font-weight: 900;
	font-size: 30px;
	margin-top: 150px;
	margin-left: 470px;
}

.sendDiv {
    margin-bottom: 30px;
    
   
}

.accNum{
	font-weight: bold;
	font-size: 16px;
	margin-left: 20px;
}

.form-accSend {
    width: 250px;
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
  /*   margin-top: 3%; */
  	 margin-left: 20px; 
}

.form-accSend:active, .form-accSend:focus {
    outline: 1px solid #007bff;
}

.autoDate, /* .endDate */{
 width: 250px;
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
  /*   margin-top: 3%; */
  	 margin-left: 60px; 
}

.autoDate:active, .autoDate:focus ,/*  endDate:active, .endDate:focus */ {
    outline: 1px solid #007bff;
}

#autoSelect{
	margin-left: 20px;
}



.sendbtnDiv{
   margin-left: 40%;
}

.btnSubmit {
	margin-top: 40px;
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

#seltype{
	width: 200px;
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
  /*   margin-top: 3%; */
  	 margin-left: 5px; 

}

#autoSelect{
	width: 120px;
	height: 35px;
	border-radius: 20px;
	text-align: center;
	border: 1px solid #ced4da;
}
</style>

<%
String accid = request.getParameter("accid");
%>

</head>

<jsp:include page="../finances-master/header/header.jsp"></jsp:include>


<body>
<h2 class="listTitle">자동이체 등록</h2>
	<form action="AutoSendInsert.do" method="post" class="sendForm">
	<input type="hidden" value="<%= accid %>" name="accid">
		자동이체 종류 <select name="autoCate" id="autoSelect">
			<option>정기적금</option>
			<option>공과금</option>
			<option>기타</option>
		</select> 
		<input type="text" id="seltype" name="autoContent" placeholder="종류를 직접 입력하세요." style="display: none;"> <br />
		<br>
		
		
		 <span class="accNum">자동이체 금액</span>
		<input type="number" name="autoCost" class="form-accSend">
		<br /> <br>
		 
		<label class="accNum">이 체 일 </label>
		<input type="number" name="autoDate" class="autoDate"><br /><br>
		
		<label class="accNum">만 기 일</label>
		 <input type="date" class="endDate" name="autoEnd"><br /> <Br>
		 
		 
		<label class="accNum">계좌 비밀번호</label>
		 <input type="password" name="pw" class="form-accSend"><br />
		
		<div class="sendbtnDiv">
			<input type="submit"  class="btnSubmit"  value="등록하기" >
		</div>
	</form>
	
	<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>
	
</body>
<script>
	$("#autoSelect").change(function() {
		var type = $("#autoSelect option:selected").text();
		if (type == "기타") {
			$("#seltype").attr('value', '');
			$("#seltype").show(); 
			$(".endDate").attr("disabled", false);
		} else if(type=="정기적금"){
			$("#seltype").attr('value', '정기적금');
			$("#seltype").css('display', 'none');
			$(".endDate").attr("disabled", false);
		} else {
			$("#seltype").attr('value', '공과금');
			$("#seltype").css('display', 'none');
			$(".endDate").attr("disabled", true);
			
		}
	});
</script>
</html>