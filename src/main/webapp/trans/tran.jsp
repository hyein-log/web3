<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<script src="https://unpkg.com/typeit@8.3.3/dist/index.umd.js"></script>


<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {
		$(".accDetailView").click(function() {
			var Location = $(this).attr("data-location");
			var TRANS_ID = $(this).attr("data-id");
			call(Location);
			$.ajax({
				url : "transdetail.do",
				data : {
					"TRANS_ID" : TRANS_ID
				},
				type : "get",
				success : function(responseData) {
					//중복 :1, 중복아님 : 0
<%Object x = request.getAttribute("str");
System.out.println(x);%>
	}

									});
						});
	});
</script>

<style type="text/css">


.a {
	transition: all 0.2s linear;
	border-radius: 20px 20px;
}

.a:hover {
	transform: scale(1.1);
}
</style>
<script>
	function test(value) {
		if (value == "전체거래내역") {
			table1.style.display = '';
		} else {
			table1.style.display = 'none';
		}

		// 			else if(value.equals("예금통장")){
		// 				$("#selectIp_account").hide();
		// 				$("#selectSaving_account").hide();
		// 				$("#selectYe_account").show();

		// 			}
		// 			//입출금통장 선택시
		// 			else if(value.equals("입출금통장")){
		// 				$("#selectYe_account").hide();
		// 				$("#selectSaving_account").hide();
		// 				$("#selectIp_account").show();
		// 			}

	}
</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	
	<div class="site-wrap">
	
		<jsp:include page="../master/header/header3.jsp"></jsp:include>
		
	
			<div class="container">
				<div >
					<div >
						<h2 >거래내역</h2>
					</div>
				</div>
				<div class="row mb-5">
					<div class="col-md-6 mb-4 mb-lg-0 col-lg-4 pricing-popular"
						data-aos="fade-up" data-aos-delay="">
						<div class="pricing a">
							<h3 class="text-center text-black ">전체 거래내역</h3>
							<br>
							<ul class="list-unstyled ul-check success mb-5">

								<li>고객님의 거래내역을 전부 확인할 수 있습니다.</li>
								<li>모든 계좌의 거래를 한 페이지에 확인하세요.</li>
								<li>특정 계좌의 거래내역 조회도 가능합니다.</li>

							</ul>
							<p class="text-center">
								<a href="#" class="btn btn-outline-primary">조회하기</a>
							</p>
						</div>
					</div>

					<div class="col-md-6 mb-4 mb-lg-0 col-lg-4 pricing-popular"
						data-aos="fade-up" data-aos-delay="100">
						<div class="pricing a">
							<h3 class="text-center text-black ">출금 내역</h3>
							<br>
							<ul class="list-unstyled ul-check success mb-5">

								<li>고객님의 출금 내역을 조회하고 싶으시다면 클릭하세요.</li>
								<li>출금 조회를 하고싶은 특정 계좌를 선택할 수 있습니다.</li>
								<li>출금내역을 지도와 함께 확인하세요.</li>
							</ul>
							<p class="text-center">
								<a href="#" class="btn btn-outline-primary">조회하기</a>
							</p>
						</div>
					</div>

					<div class="col-md-6 mb-4 mb-lg-0 col-lg-4 pricing-popular"
						data-aos="fade-up" data-aos-delay="200">
						<div class="pricing a">
							<h3 class="text-center text-black a">입금 내역</h3>
							<br>
							<ul class="list-unstyled ul-check success mb-5">

								<li>고객님의 입금 내역을 조회하고 싶으시다면 클릭하세요.</li>
								<li>입금 조회를 하고싶은 특정 계좌를 선택할 수 있습니다.</li>
								<li>고객님 명의의 계좌 잔고를 확인 하실 수 있습니다.</li>
							</ul>
							<p class="text-center">
								<a href="#" class="btn btn-outline-primary">조회하기</a>
							</p>
						</div>
					</div>
				</div>

				<div class="row site-section" id="faq-section">
					<div class="col-12 text-center" data-aos="fade">
						<h2 class="section-title">Frequently Ask Questions</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6">

						<div class="mb-5" data-aos="fade-up" data-aos-delay="100">
							<h3 class="text-black h4 mb-4">Can I accept both Paypal and
								Stripe?</h3>
							<p>Far far away, behind the word mountains, far from the
								countries Vokalia and Consonantia, there live the blind texts.
								Separated they live in Bookmarksgrove right at the coast of the
								Semantics, a large language ocean.</p>
						</div>

						<div class="mb-5" data-aos="fade-up" data-aos-delay="100">
							<h3 class="text-black h4 mb-4">What available is refund
								period?</h3>
							<p>Far far away, behind the word mountains, far from the
								countries Vokalia and Consonantia, there live the blind texts.
								Separated they live in Bookmarksgrove right at the coast of the
								Semantics, a large language ocean.</p>
						</div>

						<div class="mb-5" data-aos="fade-up" data-aos-delay="100">
							<h3 class="text-black h4 mb-4">Can I accept both Paypal and
								Stripe?</h3>
							<p>Far far away, behind the word mountains, far from the
								countries Vokalia and Consonantia, there live the blind texts.
								Separated they live in Bookmarksgrove right at the coast of the
								Semantics, a large language ocean.</p>
						</div>

						<div class="mb-5" data-aos="fade-up" data-aos-delay="100">
							<h3 class="text-black h4 mb-4">What available is refund
								period?</h3>
							<p>Far far away, behind the word mountains, far from the
								countries Vokalia and Consonantia, there live the blind texts.
								Separated they live in Bookmarksgrove right at the coast of the
								Semantics, a large language ocean.</p>
						</div>
					</div>
					<div class="col-lg-6">

						<div class="mb-5" data-aos="fade-up" data-aos-delay="100">
							<h3 class="text-black h4 mb-4">Where are you from?</h3>
							<p>Voluptatum nobis obcaecati perferendis dolor totam unde
								dolores quod maxime corporis officia et. Distinctio assumenda
								minima maiores.</p>
						</div>

						<div class="mb-5" data-aos="fade-up" data-aos-delay="100">
							<h3 class="text-black h4 mb-4">What is your opening time?</h3>
							<p>Far far away, behind the word mountains, far from the
								countries Vokalia and Consonantia, there live the blind texts.
								Separated they live in Bookmarksgrove right at the coast of the
								Semantics, a large language ocean.</p>
						</div>

						<div class="mb-5" data-aos="fade-up" data-aos-delay="100">
							<h3 class="text-black h4 mb-4">Can I accept both Paypal and
								Stripe?</h3>
							<p>Far far away, behind the word mountains, far from the
								countries Vokalia and Consonantia, there live the blind texts.
								Separated they live in Bookmarksgrove right at the coast of the
								Semantics, a large language ocean.</p>
						</div>

						<div class="mb-5" data-aos="fade-up" data-aos-delay="100">
							<h3 class="text-black h4 mb-4">What available is refund
								period?</h3>
							<p>Far far away, behind the word mountains, far from the
								countries Vokalia and Consonantia, there live the blind texts.
								Separated they live in Bookmarksgrove right at the coast of the
								Semantics, a large language ocean.</p>
						</div>
					</div>
				</div>
			</div>
	

		<jsp:include page="../master/footer/footer3.jsp"></jsp:include>
	</div>
	<h1>거래내역</h1>
	<hr>
	<h2></h2>
	<input type="radio" name="bank_account" value="전체거래내역"
		onclick='test(this.value);' checked>전체거래내역
	<input type="radio" name="bank_account" value="입금내역"
		onclick="window.location.href='tran1.do'">입금내역
	<input type="radio" name="bank_account" value="출금내역"
		onclick="window.location.href='tran.jsp?value='+(this.value);">출금내역



	<br>
	<br>

	<table id="table1">
		<tr>
			<td>순서</td>
			<td>ACCOUNT_ID</td>
			<td>MEMBER_ID</td>
			<td>ACCOUNTTYPE</td>
			<td>ACC_NUMBER</td>
			<td>BALANCE</td>
			<td>ACC_PASS</td>
			<td>MAKEDATE</td>
			<td>TRANS_ID</td>
			<td>PAST_ACC</td>
			<td>LOCATION</td>
			<td>TRANS_ACC</td>
			<td>TRANS_DATE</td>
			<td>TRANS_KIND</td>
			<td>TRANS_NAME</td>
			<td></td>

		</tr>
		<c:forEach items="${acclist }" var="acclist" varStatus="status">

			<c:if test="${status.first }">
				<tr class="color2">
			</c:if>
			<c:if test="${status.last }">
				<tr class="color2">
			</c:if>
			<c:if
				test="${(status.last==false ) &&status.first!=true && status.count%2==0}">
				<tr class="color3">
			</c:if>
			<c:if
				test="${(status.last==false ) &&status.first!=true && status.count%2==1}">
				<tr class="color4">
			</c:if>

			<td>${status.count }</td>
			<td>${acclist.account_id }</td>
			<%--contains는 대소문자 구분함 --%>
			<td>${acclist.member_id }</td>
			<td>${acclist.accounttype}</td>
			<td>${acclist.acc_number}</td>
			<td>${acclist.balance}</td>
			<td>${acclist.acc_pass }</td>
			<td>${acclist.makedate }</td>
			<td>${acclist.trans_id }</td>
			<td>${acclist.past_acc }</td>
			<td>${acclist.location}</td>

			<td>${acclist.trans_acc }</td>
			<td>${acclist.trans_date }</td>
			<td>${acclist.trans_kind }</td>
			<td>${acclist.trans_name }</td>
			<td><input type="button" value="계좌상세보기"
				class="accDetailView btn btn-primary" data-toggle="modal"
				data-target="#myModal" data-location="${acclist.location}"
				data-id="${acclist.trans_id}"></td>

		</c:forEach>

	</table>
	<p style="margin-top: -12px"></p>
	<div id="map" style="width: 50%; height: 780px; margin: auto;"></div>

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
			var map = new kakao.maps.Map(mapContainer, mapOption);
			var mapTypeControl = new kakao.maps.MapTypeControl();
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
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



</body>
</html>