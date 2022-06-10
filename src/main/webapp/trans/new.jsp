<%@page import="dto.AcclistVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">

<head>
<title>Finances &mdash; Website Template by Colorlib</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style type="text/css">
.sendForm {
	width: 30%;
	margin: auto;
	font-family: "Open Sans";
	padding: 3%;
	margin-top: 10%;
	margin-bottom: 10%;
}

.form-accSend {
	width: 100%;
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
}

.form-accSend:active, .form-accSend:focus {
	outline: 1px solid #007bff;
}

.sendDiv {
	margin-bottom: 30px;
}

.sendbtnDiv {
	text-align: center;
}

label {
	color: #000;
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

.o {
	margin-top: 8rem;
}

.d {
	text-align: center;
	margin-top: 4rem;
}

.parent {
	width: 60%;
	margin: 10px auto;
	display: flex;
	height: 50%;
	margin-top: 4rem;
}

.first {
	flex: 1;
	margin: 0px 2%;
	width: 30%;
	box-sizing: border-box;
}

.second {
	flex: 1;
	margin: 0px 2%;
	width: 30%;
	box-sizing: border-box;
}

.third {
	flex: 1;
	margin: 0px 2%;
	width: 30%;
	box-sizing: border-box;
}

.bg {
	background-color: white;
	border-radius: 20px 20px;
	box-shadow: 5px 5px 10px grey;
}

.a {
	transition: all 0.2s linear;
}

.a:hover {
	transform: scale(1.1);
}

.background {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh;
	background-color: rgba(0, 0, 0, 0.3);
	z-index: 1000;
	/* 숨기기 */
	z-index: -1;
	opacity: 0;
}

.show {
	opacity: 1;
	z-index: 1000;
	transition: all .5s;
}

.window {
	position: relative;
	width: 100%;
	height: 100%;
}

.popup {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #ffffff;
	box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
	/* 초기에 약간 아래에 배치 */
	transform: translate(-50%, -40%);
}

.show .popup {
	transform: translate(-50%, -50%);
	transition: all .5s;
}

table, td {
	border: 1px solid gray;
	border-collapse: collapse;
	padding: 10px;
	margin: auto;
}
</style>
</head>

<jsp:include page="../master/header/header3.jsp"></jsp:include>
<div class="d" style="font-size: 40px;">
	<div class="o"">거래내역</div>
</div>


<div class=parent>
	<div class="first bg a">
		<h3 class="d">전체 거래내역</h3>
		<br>
		<ul>

			<li>고객님의 거래내역을 전부 확인할 수 있습니다.</li>
			<li>모든 계좌의 거래를 한 페이지로 한 눈에 확인하세요.</li>
			<li>특정 계좌의 거래내역도 조회하기버튼을 통해 확인 가능합니다.</li>

		</ul>
		<p class="text-center">
			<a href="#" id="all" class="btn btn-outline-primary d">조회하기</a>
		</p>
	</div>
	<div class="second bg a">

		<h3 class="d">출금 내역</h3>
		<br>
		<ul>

			<li>고객님의 출금 내역을 조회하고 싶으시다면 클릭하세요.</li>
			<li>출금 조회를 하고싶은 특정 계좌를 선택할 수 있습니다.</li>
			<li>출금내역을 지도와 함께 보며 어디에서 사용된 금액인지 확인해보세요.</li>
		</ul>
		<p class="text-center">
			<a href="#" id="in" class="btn btn-outline-primary d">조회하기</a>
		</p>
	</div>
	<div class="third bg a">
		<h3 class="d">입금 내역</h3>
		<br>
		<ul>

			<li>고객님의 입금 내역을 조회하고 싶으시다면 클릭하세요.</li>
			<li>입금 조회를 하고싶은 특정 계좌를 선택할 수 있습니다.</li>
			<li>고객님 명의의 계좌 잔고를 확인 하실 수 있습니다.</li>
		</ul>
		<p class="text-center">
			<a href="#" id="out" class="btn btn-outline-primary d">조회하기</a>
		</p>
	</div>
</div>
<div class="o"></div>

<div class="background">
	<div class="window">
		<div class="popup">
			<button id="close">닫기</button>
			<br> <br>
			<c:if test="${a eq 1}">
			
			
			<%
			List<AcclistVO> acclist = (List<AcclistVO>) session.getAttribute("acclist");
			%>
			<c:if test="${not empty acclist[0].account_id}">


				<table id="table1">
					<tr>
						<td>NO</td>
						<td>ACCOUNTTYPE</td>
						<td>ACC_NUMBER</td>
						<td>BALANCE</td>
						<td>MAKEDATE</td>
						<td>PAST_ACC</td>
						<td>TRANS_ACC</td>
						<td>TRANS_DATE</td>
						<td>TRANS_KIND</td>
						<td>TRANS_NAME</td>


					</tr>
					<c:forEach items="${acclist }" var="acclist" varStatus="status">

						<td>${status.count }</td>
						<td>${acclist.accounttype}</td>
						<td>${acclist.acc_number}</td>
						<td>${acclist.balance}</td>
						<td>${acclist.makedate }</td>
						<td>${acclist.past_acc }</td>
						<td>${acclist.trans_acc }</td>
						<td>${acclist.trans_date }</td>
						<td>${acclist.trans_kind }</td>
						<td>${acclist.trans_name }</td>
						<!-- 						<td><input type="button" value="계좌상세보기" -->
						<!-- 							class="accDetailView btn btn-primary" data-toggle="modal" -->
						<%-- 							data-target="#myModal" data-location="${acclist.location}" --%>
						<%-- 							data-id="${acclist.trans_id}"></td> --%>

					</c:forEach>

				</table>

			</c:if>
			<c:if test="${empty acclist }">
				<h1>내역을 확인할 계좌가 없습니다.</h1>

			</c:if>
			</c:if>
		</div>
		
	</div>
</div>
<div class="o"></div>
<jsp:include page="../master/footer/footer3.jsp"></jsp:include>


<script>
	function show() {
		document.querySelector(".background").className = "background show";
	}

	function close() {
		document.querySelector(".background").className = "background";
	}

// 	document.querySelector("#all").addEventListener("click", show);
// 	document.querySelector("#in").addEventListener("click", show);
// 	document.querySelector("#out").addEventListener("click", show);
	document.querySelector("#close").addEventListener("click", close);
</script>
<script type="text/javascript">
// 	$(function() {
// 		$("#in").click(function() {
// 			var Location = $(this).attr("data-location");
// 			var TRANS_ID = $(this).attr("data-id");
// 			call(Location);
// 			$.ajax({
// 				url : "transdetail.do",
// 				data : {
// 					"TRANS_ID" : TRANS_ID
// 				},
// 				type : "get",
// 				success : function(responseData) {
// 					//중복 :1, 중복아님 : 0
<%-- <%Object x = request.getAttribute("str"); --%>
<%-- System.out.println(x);%> --%>
// 	}

// 			});
// 		});
// 	});

$(function(){
	$("#all").click(function show() {
		document.querySelector(".background").className = "background show";
		const a = 1;
	})
});
$(function(){
	$("#in").click(function show() {
		document.querySelector(".background").className = "background show";
		const a = 2;
	})
});
$(function(){
	$("#out").click(function show() {
		document.querySelector(".background").className = "background show";
		const a = 3;
	})
});
</script>
</body>


</html>