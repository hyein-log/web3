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
<html lang="ko">

<head>
<title>COS BANK 결제내역 지도</title>
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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com/%22%3E">
<link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="css/timepicker.css">
<link rel="stylesheet" href="css/trans.css">
<link rel="stylesheet" href="css/selectTerm.css">
<script src="js/trans.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script>
	$(function() {
		$(".datepicker").datepicker(
				{
					showOn : "both",
					buttonImage : "css/png.png",
					buttonImageOnly : true,
					// 					changeMonth : true,
					// 					changeYear : true,
					// 					yearRange : "-1:+0",
					// 					showButtonPanel : true,
					multidate : true, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
					multidateSeparator : ",",
					templates : {
						leftArrow : '&laquo;',
						rightArrow : '&raquo;'
					},
					// 					currentText : '오늘 날짜',
					dateFormat : 'yy년 mm월 dd일',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					yearSuffix : '년',

					showButtonPanel : true,
					dateFormat : "yy-mm-dd",
					onClose : function(selectedDate) {

						var eleId = $(this).attr("id");
						var optionName = "";

						if (eleId.indexOf("StartDate") > 0) {
							eleId = eleId.replace("StartDate", "EndDate");
							optionName = "minDate";
						} else {
							eleId = eleId.replace("EndDate", "StartDate");
							optionName = "maxDate";
						}

						$("#" + eleId).datepicker("option", optionName,
								selectedDate);
						$(".searchDate").find(".chkbox2").removeClass("on");
					}
				});
	});
</script>
<style type="text/css">
html {
	position: relative;
	min-height: 100%;
	margin: 0;
}

body {
	min-height: 100%;
}

.listTitle {
	color: #007bff;
	font-weight: 900;
	font-size: 30px;
	margin-top: 130px;
	margin-left: 80px;
}

.listTitle2 {
	margin-left: 80px;
	font-size: 14px;
	margin-bottom: 3.5%;
}

td {
	border: 1px solid #e9ecef;
}

.listTable {
	width: 90%;
	margin: auto;
	padding: 3%;
	margin-top: 50px;
	margin-bottom: 10%;
	/*   border: 1px solid #007bff; */
	border-style: solid;
	border-width: 3px 1px 1px 1px;
	border-color: rgb(0 123 255/ 25%);
	text-align: center;
	border-collapse: collapse;
}

.trTitle {
	padding: 30px 30px;
	font-weight: bold;
	font-size: 17px;
	color: #007bff;
	background-color: #ECF7FF;
	height: 50px;
}

.trContent {
	height: 47px;
	font-size: 15px;
	font-weight: bold;
	color: #616161;
}

.wrap {
	width: 35%;
	margin: auto;
	font-size: 18px;
	margin-bottom: 2%;
	text-align: center;
}

.wrap1 {
	width: 50%;
	margin: auto;
	font-size: 18px;
	margin-bottom: 2%;
	text-align: center;
}

#data {
	color: black;
	font-weight: bold;
}

.paging {
	margin-top: 2rem;
	margin-bottom: 1rem;
}

#loca {
	text-align: center;
	color: #444444;
	font-weight: bold;
	font-size: 20px;
	margin-top: 1.5rem;
}

.modal-close {
	margin: auto;
	margin-top: 2rem;
	color : navy;
	background-color: white;
}
</style>

</head>
<body>


	<jsp:include page="../finances-master/header/header.jsp"></jsp:include>
	<h2 class="listTitle">거래 내역 조회</h2>
	<div class="listTitle2">고객님의 입/출금 거래내역을 확인할 수 있습니다.</div>
	<hr>
	<c:set var="path" value="${pageContext.request.contextPath }" />

	<c:if test="${not empty alist }">
		<div class="wrap">
			<div>
				계좌번호 :
				${accNum}</div>
			<div id="data"></div>
		</div>

		<form action="transIn.do" autocomplete="off">

			<!-- search -->

			<table class="searchBox">
				<caption>조회</caption>
				<colgroup>
					<col width="123px">
					<col width="*">
				</colgroup>

				<tbody>
					<tr>
						<th></th>
						<td>
							<div class="wrap1">
								<ul class="searchDate">
									<li>조회기간 :</li>
									<li><span class="chkbox2"> <input type="radio"
											name="dateType" id="dateType1" onclick="setSearchDate('0d')" />
											<label for="dateType1">당일</label>
									</span></li>
									<li><span class="chkbox2"> <input type="radio"
											name="dateType" id="dateType2" onclick="setSearchDate('3d')" />
											<label for="dateType2">3일</label>
									</span></li>
									<li><span class="chkbox2"> <input type="radio"
											name="dateType" id="dateType3" onclick="setSearchDate('1w')" />
											<label for="dateType3">1주</label>
									</span></li>
									<li><span class="chkbox2"> <input type="radio"
											name="dateType" id="dateType4" onclick="setSearchDate('2w')" />
											<label for="dateType4">2주</label>
									</span></li>
									<li><span class="chkbox2"> <input type="radio"
											name="dateType" id="dateType5" onclick="setSearchDate('1m')" />
											<label for="dateType5">1개월</label>
									</span></li>
									<li><span class="chkbox2"> <input type="radio"
											name="dateType" id="dateType6" onclick="setSearchDate('3m')" />
											<label for="dateType6">3개월</label>
									</span></li>
									<li><span class="chkbox2"> <input type="radio"
											name="dateType" id="dateType7" onclick="setSearchDate('6m')" />
											<label for="dateType7">6개월</label>
									</span></li>
								</ul>

								<div class="clearfix" style="margin-right: 150px">
									<!-- 시작일 -->
									<span class="dset"> <input type="text"
										class="datepicker inpType" name="searchStartDate"
										id="searchStartDate" value="${searchStartDate}">
									</span> <span class="demi">~</span>
									<!-- 종료일 -->
									<span class="dset"> <input type="text"
										class="datepicker inpType" name="searchEndDate"
										id="searchEndDate" value="${searchEndDate}">
									</span> <input type="hidden" name="accNum"
										value="${accNum}"> <input
										type="hidden" name="kind" value="${kind}"> <input
										type="hidden" name="sel" value="1"> <span> </span>
								</div>
							</div>
						</td>
					</tr>
				<tbody>
			</table>
			<div class="wrap">
				<input type="submit" value="기간조회" id="termbtn"
					class="btn btn-outline-primary buttonWH">
			</div>
		</form>

		<div class="table0">
			<table id="table1" class="listTable">
				<thead style="background-color: skyblue;">
					<tr class="trTitle">
						<td>통장 종류</td>
						<td>이전 통장 잔액</td>
						<td>거래 금액</td>
						<td>거래 일자</td>
						<td>거래 명</td>
						<td>거래 유형</td>
					</tr>
				</thead>

				<c:forEach items="${alist }" var="acclist">
					<tbody>
						<tr class="trContent">
							<td><c:if test="${acclist.accounttype==0}">입출금 통장</c:if> <c:if
									test="${acclist.accounttype==1}">예금 통장</c:if> <c:if
									test="${acclist.accounttype==2}">적금 통장</c:if></td>
							<td><fmt:formatNumber value="${acclist.past_acc }"
									pattern="#,###" /></td>
							<td><fmt:formatNumber value="${acclist.trans_acc }"
									pattern="#,###" /></td>
							<td>${acclist.trans_date }</td>
							<c:if test="${empty acclist.trans_name }">
							<td> - </td>
							</c:if>
							<c:if test="${not empty acclist.trans_name }">
							<td>${acclist.trans_name }</td>
							</c:if>
							<td><c:choose>
									<c:when test="${acclist.trans_kind=='결제'}">
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

									</c:when>
									<c:otherwise>${acclist.trans_kind}
									</c:otherwise>
								</c:choose></td>
								</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
		<div class="wrap paging">
			<jsp:include page="paging.jsp">
				<jsp:param value="${paging.page }" name="page" />
				<jsp:param value="${paging.beginPage }" name="beginPage" />
				<jsp:param value="${paging.endPage }" name="endPage" />
				<jsp:param value="${paging.prev }" name="prev" />
				<jsp:param value="${paging.next }" name="next" />
				<jsp:param value="${kind}" name="kind" />
				<jsp:param value="${sel}" name="sel" />
				<jsp:param value="${searchStartDate}" name="searchStartDate" />
				<jsp:param value="${searchEndDate}" name="searchEndDate" />
				<jsp:param value="${accNum}" name="accNum" />
			</jsp:include>
		</div>
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
		<div id="map"
			style="width: 80%; height: 350px; margin: auto; margin-top: 4rem; border-radius: 30px;"></div>
		<div id="loca"></div>
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
				document.getElementById("loca").innerHTML = "상세 주소 :"+ myAddress[0]
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
		<div class="wrap">
			<button class="modal-close btn btn-primary" onClick="javascript:popClose(); ">닫기</button>
		</div>
	</div>
	<!-- //modal 영역 -->
	<div class="o"></div>


	<div class="o"></div>


	<jsp:include page="../finances-master/footer/Mainfooter.jsp"></jsp:include>
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
<script type="text/javascript">
	var balance =
${"balance"}
	document.getElementById("data").innerHTML = "잔액 : "
			+ balance.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
</script>
</html>
