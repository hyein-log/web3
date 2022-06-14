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
<%
String accid = request.getParameter("accid");
%>
</head>
<body>
	<form action="AutoSendInsert.do" method="post">
	<input type="hidden" value="<%= accid %>" name="accid">
		자동이체 종류 <select name="autoCate" id="autoSelect">
			<option value="auto1" >정기적금</option>
			<option value="auto2">공과금</option>
			<option value="auto3">기타</option>
		</select> 
		<input type="text" id="seltype" name="autoContent" placeholder="종류를 직접 입력하세요." style="display: none;"> <br />
		자동이체 금액 <input type="number" name="autoCost"><br /> 
		이체일 <input type="number" name="autoDate"><br />
		만기일 <input type="date" class="endDate" name="autoEnd"><br /> 
		계좌 비밀번호 <input type="password"><br />
		<input type="submit" value="자동이체 등록" >
	</form>
</body>
<script>
	$("#autoSelect").change(function() {
		var type = $("#autoSelect option:selected").text();
		if (type == "기타") {
			$("#seltype").show();
		} else {
			$("#seltype").css('display', 'none');
		}
		
		if(type == "공과금"){
			$(".endDate").attr("disabled", true);
		} else {
			$(".endDate").attr("disabled", false);
		}
	});
</script>
</html>