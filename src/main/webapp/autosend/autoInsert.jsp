<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COS BANK 자동이체</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


<style type="text/css">
html {
	position: relative;
	min-height: 100%;
	margin: 0;
}

body {
	min-height: 100%;
}

.sendForm {
	width: 35%;
	margin-left: 470px;
	font-family: 'Nanum Gothic', sans-serif;
	padding: 2%;
	margin: auto;
	/*  margin-top: 5%;  */
	margin-bottom: 6.5rem;
	border: 7px solid #B6D9FF;
	/* text-align: center; */
}

.listTitle {
	color: #007bff;
	font-weight: 900;
	font-size: 30px;
	margin-top: 9rem;
	margin-left: 470px;
}

.sendDiv {
	margin-bottom: 30px;
}

.accNum {
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
	font-size: 14px;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	/*   margin-top: 3%; */
	margin-left: 20px;
	font-family: 'Nanum Gothic', sans-serif;
}

.form-accSend:active, .form-accSend:focus {
	outline: 1px solid #007bff;
}

.autoDate, .endDate {
	width: 250px;
	height: 20px;
	display: inline;
	border-radius: 20px;
	border: 1px solid #ced4da;
	padding: 0.375rem 0.75rem;
	font-size: 14px;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	/*   margin-top: 3%; */
	margin-left: 60px;
	font-family: 'Nanum Gothic', sans-serif;
}

.autoDate:active, .autoDate:focus, endDate:active, .endDate:focus {
	outline: 1px solid #007bff;
}

#autoSelect {
	margin-left: 20px;
}

.sendbtnDiv {
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

#seltype {
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

#autoSelect {
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
	<form action="AutoSendInsert.do" method="post" class="sendForm"
		id="frmUpdate">
		<input type="hidden" value="<%=accid%>" name="accid"> <label
			class="accNum">자동이체 종류 </label> <select id="autoSelect"
			name="selcontent">
			<option value="정기적금" selected="selected">정기적금</option>
			<option value="공과금">공과금</option>
			<option value="기타">기타</option>
		</select> <input type="text" id="seltype" name="autoContent"
			placeholder="종류를 직접 입력하세요." style="display: none;"> <br /> <br>
		<span class="accNum">자동이체 금액</span> <input type="number"
			name="autoCost" class="form-accSend sendMoney" class="sendMoney"
			required> <br /> <br> <label class="accNum">이 체
			일 </label> <input type="number" name="autoDate" class="autoDate"
			id="sendDate" required><br /> <br> <label
			class="accNum">만 기 일</label> <input type="date" class="endDate"
			name="autoEnd"><br /> <Br> <label class="accNum">계좌
			비밀번호</label> <input type="password" name="pw" class="form-accSend" required><br />

		<div class="sendbtnDiv">
			<input type="submit" id="insertBtn" class="btnSubmit" value="등록하기">
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
		} else if (type == "정기적금") {
			$("#seltype").attr('value', '정기적금');
			$("#seltype").css('display', 'none');
			$(".endDate").attr("disabled", false);
		} else {
			$("#seltype").attr('value', '공과금');
			$("#seltype").css('display', 'none');
			$(".endDate").attr("disabled", true);

		}
	});

	$("#frmUpdate").submit(function() {
		if ($("#seltype").val().length > 10) {
			alert("종류 이름은 10자 이내로 입력해주세요.");
			return false;
		}
		if ($("#sendDate").val() < 1 || $("#sendDate").val() > 31) {
			alert("이체일은 1~31일 사이의 숫자를 입력해주세요.");
			return false;
		}

		if ($(".sendMoney").val() < 1) {
			alert("금액에 음수는 입력할 수 없습니다.");
			return false;
		}

		/* 날짜비교 */
		var today = new Date();
		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);

		var dateStr = year + '-' + month + '-' + day;
		if ($(".endDate").val() != null) {
			var date1 = new Date(dateStr).getTime();
			var date2 = new Date($(".endDate").val()).getTime();
			if (date1 > date2) {
				alert("선택된 만기일이 오늘보다 이전 날짜입니다.");
				return false;
			}

		}

	});
</script>
</html>