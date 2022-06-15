<%@page import="dto.PagingVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.AcclistVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">

<head>

<title>결제내역 지도</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<script src="https://unpkg.com/typeit@8.3.3/dist/index.umd.js"></script>
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
/* table { */
/*   border-collapse: collapse; */
/*   width: 100%; */
/* } */

/* th, td { */
/*   padding: 8px; */
/*   text-align: left; */
/*   border-bottom: 1px solid #ddd; */
/* } */
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

/*   팝업 임시 버튼 스타일  */
.btn-box .btn-open {
	display: block;
	width: 200px;
	height: 50px;
	margin: 80px auto 0;
	line-height: 50px;
	background: #333;
	text-align: center;
}

.btn-box .btn-open span {
	color: #fff;
}

/* 팝업 스타일 */
.modal-bg {
	display: none;
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.6);
	z-index: 999;
}

.modal-wrap {
	display: none;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 500px;
	height: 600px;
	background: #fff;
	z-index: 1000;
}

#divPaging>div {
	float: left;
	width: 30px;
	margin: 0 auto;
	text-align: center;
	list-style: none;
	text-align: center;
	padding: 0;
	margin: 0;
}
</style>



</head>
<body>
	<%
	String accNum = (String) request.getAttribute("accNum");
	String kind = (String) request.getAttribute("kind");
	long balance = (long)request.getAttribute("balance");
	System.out.println(accNum);
	System.out.println(balance);
	ArrayList<AcclistVO> list = (ArrayList) session.getAttribute("alist");
	if (list == null) {
		list = new ArrayList<AcclistVO>();
	}
	session.setAttribute("alist", list);
	PagingVO paging = (PagingVO) session.getAttribute("paging");
	System.out.println("++++++++" + list);
	%>
	<jsp:include page="../finances-master/header/header.jsp"></jsp:include>
	<div class="d" style="font-size: 40px;">
		<div class="o">거래내역</div>
	</div>
	<div class="o"></div>
	<c:set var="path" value="${pageContext.request.contextPath }" />

	<c:if test="${not empty alist }">
	<div>계좌번호 : <%=accNum %></div>
	<div>잔액 : <%=balance %></div>
		<table id="table1" class="table">
			<thead style="background-color: skyblue;">
				<tr>
					<td>NO</td>
					<td>ACCOUNTTYPE</td>
					<td>PAST_ACC</td>
					<td>TRANS_ACC</td>
					<td>TRANS_DATE</td>
					<td>TRANS_NAME</td>
					<td>TRANS_KIND</td>
				</tr>
			</thead>

			<c:forEach items="${alist }" var="acclist" varStatus="status">
				<tbody>
					<tr>
						<td>${status.count }</td>

						<td><c:if test="${acclist.accounttype==0}">입출금 통장</c:if> <c:if
								test="${acclist.accounttype==1}">예금 통장</c:if> <c:if
								test="${acclist.accounttype==2}">적금 통장</c:if></td>
						<td>${acclist.past_acc }</td>
						<td>${acclist.trans_acc }</td>
						<td>${acclist.trans_date }</td>
						<td>${acclist.trans_name }</td>

						<td><c:if test="${acclist.trans_kind=='결제'}">


								<!-- 전체 레이아웃 -->
								<div id="wrap">
									<!-- Content -->
									<section class="content">
										<div class="container">
											<!-- 팝업용 임시 버튼입니다. -->
											<div class="btn-box">
												<input type="button" value="결제 지도보기"
													class="mapView btn btn-primary"
													data-location="${acclist.location}"
													data-id="${acclist.trans_id}"
													onClick="javascript:popOpen();">

											</div>
											<!-- //팝업용 임시 버튼입니다. -->
										</div>
									</section>
									<!-- //Content -->
								</div>
								<!-- //전체 레이아웃 -->

							</c:if> <c:if test="${acclist.trans_kind=='입금'}">입금</c:if> <c:if
								test="${acclist.trans_kind=='자동이체'}">자동이체</c:if> <c:if
								test="${acclist.trans_kind=='출금'}">출금</c:if></td>
				</tbody>

			</c:forEach>
		</table>
		<jsp:include page="paging.jsp">
			<jsp:param value="${paging.page }" name="page" />
			<jsp:param value="${paging.beginPage }" name="beginPage" />
			<jsp:param value="${paging.endPage }" name="endPage" />
			<jsp:param value="${paging.prev }" name="prev" />
			<jsp:param value="${paging.next }" name="next" />
			<jsp:param value="<%=kind %>" name="kind" />
			<jsp:param value="${acclist.acc_number}" name="accNum" />
		</jsp:include>
	</c:if>
	<c:if test="${empty alist }">
		<script type="text/javascript">
			alert("거래내역이 존재하지 않습니다.");
			location.href = '../finances-master/main.jsp';
		</script>
	</c:if>


	<div class="o"></div>

	<!-- modal 영역 -->
	<div class="modal-bg" onClick="javascript:popClose();"></div>

	<div class="modal-wrap">


		<p style="margin-top: -12px"></p>
		<div id="map" style="width: 50%; height: 500px; margin: auto;"></div>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a0fe8ab83a2740ee68a1917df2e416f1&libraries=services"></script>

		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(36.633535, 127.425882), // 지도의 중심좌표
				level : 4
			// 지도의 확대 레벨
			};

			call("서울특별시 중구 세종대로 110");

			function call(addr) {

				// 지도를 생성합니다    
				map = new kakao.maps.Map(mapContainer, mapOption);
				var mapTypeControl = new kakao.maps.MapTypeControl();
				map.addControl(mapTypeControl,
						kakao.maps.ControlPosition.TOPRIGHT);
				var zoomControl = new kakao.maps.ZoomControl();
				map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();

				var myAddress = [ addr ]; // "경기 성남시 분당구 성남대로 51 포스빌 1층 108호",		"경기 성남시 분당구 판교백현로 29", "경기 성남시 분당구 판교백현로 45" 

				function myMarker(won, address) {
					// 주소로 좌표를 검색합니다
					geocoder
							.addressSearch(
									//'주소',
									address,
									function(result, status) {
										// 정상적으로 검색이 완료됐으면 
										if (status === kakao.maps.services.Status.OK) {

											var coords = new kakao.maps.LatLng(
													result[0].y, result[0].x);

											// 결과값으로 받은 위치를 마커로 표시합니다

											var marker = new daum.maps.Marker({
												map : map,
												position : coords
											});

											// 인포윈도우로 장소에 대한 설명을 표시합니다
											/*
											var infowindow = new daum.maps.InfoWindow(
											        {
											            // content : '<div style="width:50px;text-align:center;padding:3px 0;">I</div>'
											            content : '<div style="color:red;">' +  number + '</div>'
											        });
											infowindow.open(map, marker);
											 */

											// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
											var content = '<div class="customoverlay">'
													+ '    <span class="title">'
													+ '<div style="font-style:normal; color:red; font-weight:bold; font-size:2.0em">'
													+ '</div>'
													+ '</span>'
													+ '</div>';

											// 커스텀 오버레이가 표시될 위치입니다 
											var position = new kakao.maps.LatLng(
													result[0].y, result[0].x);

											// 커스텀 오버레이를 생성합니다
											var customOverlay = new kakao.maps.CustomOverlay(
													{
														map : map,
														position : position,
														content : content,
														yAnchor : 1
													});

											// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
											map.setCenter(coords);

										}
									});
				}

				for (i = 0; i < myAddress.length; i++) {
					myMarker(i + 1, myAddress[i]);

				}
			}
		</script>

		<button class="modal-close" onClick="javascript:popClose();">닫기</button>

	</div>
	<!-- //modal 영역 -->
	<div class="o"></div>


	<div class="o"></div>


	<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	$(function() {
		$(".mapView").click(function() {
			var Location = $(this).attr("data-location");
			var TRANS_ID = $(this).attr("data-id");
			call(Location);

		});
	});

	function popOpen() {

		var modalPop = $('.modal-wrap');
		var modalBg = $('.modal-bg');

		$(modalPop).show();
		$(modalBg).show();
		$('html').css({
			overflow : 'hidden',
			heigth : 'auto'
		});
		map.relayout();

	}

	function popClose() {
		var modalPop = $('.modal-wrap');
		var modalBg = $('.modal-bg');

		$(modalPop).hide();
		$(modalBg).hide();
		$('html').removeAttr('style');
	}
</script>

</html>
