<%@page import="java.util.List"%>
<%@page import="dto.MemberVO"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
<head>
<title>Hello 'COS BANK';</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://unpkg.com/typeit@8.3.3/dist/index.umd.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com/%22%3E">
<link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700"
	rel="stylesheet">
<link rel="stylesheet" href="fonts/icomoon/style.css">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">

<link rel="stylesheet" href="css/jquery.fancybox.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">

<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Fjalla+One|Libre+Baskerville">
<style type="text/css">
html {
	position: relative;
	min-height: 100%;
	margin: 0;
}

body {
	min-height: 100%;
}

.a img {
	transition: all 0.2s linear;
}

.a:hover img {
	transform: scale(1.1);
}

.visual {
	/* 마우스 커서를 포인터 모양으로 변경 */
	cursor: pointer;
}
</style>

</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300" style="font-family: 'Nanum Gothic', sans-serif;">

	<jsp:include page="../finances-master/header/mainHeader.jsp"></jsp:include>

	<div id="overlayer"></div>
	<div class="loader">
		<div class="spinner-border text-primary" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>
				<%
				int id = 0;
				MemberVO member = (MemberVO) session.getAttribute("member");
				System.out.println("1" + member);
				String m = "";
				if (member != null) {
					id = member.getMember_id();
					m = member.getId();
					if (id == 0) {
						System.out.println("lk");
					}
				}
				%>
	<div class="site-wrap">




		<div class="site-blocks-cover overlay"
			style="background-image: url(images/bank_back.jpg);" data-aos="fade"
			id="home-section">

			<div class="container ">
				<div class="row align-items-center justify-content-center">


					<div class="col-md-10 mt-lg-5 text-center">
						<div class="single-text owl-carousel">
							<div>
								<h1 data-aos="fade-up"
									style="font-family: Georgia, serif; font-size: 80px; color: white;">Hello
									"COS"</h1>
								<br>
								<div>
									<p style="font-size: 46px; font-weight: bold;">모두를 위한, 새로운
										금융을 만들고자 합니다.</p>
									<p style="font-size: 30px;">한 사람, 한 사람이 작성한 코드가 모여 마침내 코스가
										되었습니다.</p>
								</div>
								<br> <br>
								<div data-aos="fade-up" data-aos-delay="100">
								<%if(member == null) {%>
									<a href="../login/login.jsp" class="btn  btn-primary mr-2 mb-2">Login</a>
									<%} else { %>
									<a href="../login/logout.do" class="btn  btn-primary mr-2 mb-2">Logout</a>
									<%} %>
								</div>
							</div>
							<!-- 							<div class="slide"> -->
							<!-- 								<h1 class="text-uppercase" data-aos="fade-up">Financing -->
							<!-- 									Solutions</h1> -->
							<!-- 								<p class="mb-5 desc" data-aos="fade-up" data-aos-delay="100">Lorem -->
							<!-- 									ipsum dolor sit amet consectetur adipisicing elit. Repudiandae -->
							<!-- 									minima delectus accusamus accusantium deleniti libero excepturi -->
							<!-- 									porro illo.</p> -->
							<!-- 								<div data-aos="fade-up" data-aos-delay="100"> -->
							<!-- 									<a href="#" target="_blank" class="btn  btn-primary mr-2 mb-2">Get -->
							<!-- 										In Touch</a> -->
							<!-- 								</div> -->
							<!-- 							</div> -->

							<!-- 							<div class="slide"> -->
							<!-- 								<h1 class="text-uppercase" data-aos="fade-up">Savings -->
							<!-- 									Accounts</h1> -->
							<!-- 								<p class="mb-5 desc" data-aos="fade-up" data-aos-delay="100">Lorem -->
							<!-- 									ipsum dolor sit amet consectetur adipisicing elit. Repudiandae -->
							<!-- 									minima delectus accusamus accusantium deleniti libero excepturi -->
							<!-- 									porro illo.</p> -->
							<!-- 								<div data-aos="fade-up" data-aos-delay="100"> -->
							<!-- 									<a href="#" target="_blank" class="btn  btn-primary mr-2 mb-2">Get -->
							<!-- 										In Touch</a> -->
							<!-- 								</div> -->
							<!-- 							</div> -->

						</div>
					</div>

				</div>
			</div>

			<a href="#next" class="mouse smoothscroll"> <span
				class="mouse-icon"> <span class="mouse-wheel"></span>
			</span>
			</a>
		</div>

		<section class="site-section border-bottom" id="team-section" >
			<div class="container">
				<div class="row mb-5 justify-content-center">
					<div class="col-md-8 text-center">
						<h2 class="section-title mb-3" data-aos="fade-up"
							data-aos-delay=""></h2>
						<p class="lead" data-aos="fade-up" data-aos-delay="100"
							style="font-weight: bold; font-size: 30px; color: black;">
							<br>이제껏 경험 못 했던 쉽고 편리한 금융 서비스, <br>코스와 함께라면 당신의 일상이
							새로워질 거예요.
						</p>
					</div>
				</div>
				
				<div class="row">


					<div class="col-md-6 col-lg-4 mb-4" data-aos="fade-up"
						data-aos-delay="">
						<div class="team-member a">
							<c:if test="${not empty member }">
								<form action="../trans/trans.do" method="post">
									<input type="hidden" name="memberid" value="<%=id%>"><br>
									<input type="image" src="images/list.png"
										style="border-radius: 20px 20px; box-shadow: 5px 5px 10px grey;"
										class="img-fluid mb-4 bg-white visual" alt="제출버튼">
								</form>
							</c:if>
							<c:if test="${empty member }">
								<input type="image" src="images/list.png"
									style="border-radius: 20px 20px; box-shadow: 5px 5px 10px grey;"
									class="img-fluid mb-4 bg-white visual" alt="제출버튼"
									onclick="empty();">
							</c:if>

						</div>

					</div>
					<div class="col-md-6 col-lg-4 mb-4" data-aos="fade-up"
						data-aos-delay="">
						<div class="team-member a">
							<c:if test="${not empty member }">
								<form action="../account/acc_create.jsp" method="post">
									<input type="hidden" name="memberid" value="<%=id%>"><br>
									<input type="image" src="images/account.png"
										style="border-radius: 20px 20px; box-shadow: 5px 5px 10px grey;"
										class="img-fluid mb-4 bg-white visual" alt="제출버튼">
								</form>
							</c:if>
							<c:if test="${empty member }">
								<input type="image" src="images/account.png"
									style="border-radius: 20px 20px; box-shadow: 5px 5px 10px grey;"
									class="img-fluid mb-4 bg-white visual" alt="제출버튼"
									onclick="empty();">
							</c:if>
						</div>
					</div>


					<div class="col-md-6 col-lg-4 mb-4" data-aos="fade-up"
						data-aos-delay="200">
						<div class="team-member a">
							<c:if test="${not empty member }">
								<form action="../account/accSendList.do" method="post">
									<input type="hidden" name="memberid" value="<%=id%>"><br>
									<input type="image" src="images/money.png"
										style="border-radius: 20px 20px; box-shadow: 5px 5px 10px grey;"
										class="img-fluid mb-4 bg-white visual" alt="제출버튼">
								</form>
							</c:if>
							<c:if test="${empty member }">
								<input type="image" src="images/money.png"
									style="border-radius: 20px 20px; box-shadow: 5px 5px 10px grey;"
									class="img-fluid mb-4 bg-white visual" alt="제출버튼"
									onclick="empty();">
							</c:if>
						</div>
					</div>



				</div>
			</div>
			<div class="container">

				<div class="row">


					<div class="col-md-6 col-lg-4 mb-4" data-aos="fade-up"
						data-aos-delay="100">
						<div class="team-member a">
							<c:if test="${not empty member }">
								<form action="../mypage/mypage.do" method="post">
									<input type="hidden" name="memberid" value="<%=id%>"><br>
									<input type="image" src="images/mypage.png"
										style="border-radius: 20px 20px; box-shadow: 5px 5px 10px grey;"
										class="img-fluid mb-4 bg-white visual" alt="제출버튼">
								</form>
							</c:if>
							<c:if test="${empty member }">
								<input type="image" src="images/mypage.png"
									style="border-radius: 20px 20px; box-shadow: 5px 5px 10px grey;"
									class="img-fluid mb-4 bg-white visual" alt="제출버튼"
									onclick="empty();">
							</c:if>
						</div>
					</div>
					<div class="col-md-6 col-lg-4 mb-4" data-aos="fade-up"
						data-aos-delay="100">
						<div class="team-member a">
						<form action="../notice/NoticeUserList.do">
								<input type="hidden"name="memberid" value="<%=id%>" ><br>
								<input type="image" src="images/notice.png" style="border-radius: 20px 20px; box-shadow: 5px 5px 10px grey;"
								class="img-fluid mb-4 bg-white visual"
									alt="제출버튼">
							</form>
						</div>
					</div>

					<div class="col-md-6 col-lg-4 mb-4" data-aos="fade-up"
						data-aos-delay="200">
						<div class="team-member a">
							<c:if test="${not empty member }">
								<form action="../membership/membershipMain.jsp">
									<input type="hidden" name="memberid" value="<%=id%>"><br>
									<input type="image" src="images/membership.png"
										style="border-radius: 20px 20px; box-shadow: 5px 5px 10px grey;"
										class="img-fluid mb-4 bg-white visual" alt="제출버튼">
								</form>
							</c:if>
							<c:if test="${empty member }">
								<input type="image" src="images/membership.png"
									style="border-radius: 20px 20px; box-shadow: 5px 5px 10px grey;"
									class="img-fluid mb-4 bg-white visual" alt="제출버튼"
									onclick="empty();">
							</c:if>
						</div>
					</div>



				</div>
			</div>
		</section>

		<div class="site-section cta-big-image" id="next">
			<div class="container">
				<div class="row mb-5 justify-content-center">
					<div class="col-md-8 text-center">
						<h2 class="section-title mb-3" data-aos="fade-up"
							data-aos-delay="" style="font-size: 50px">About COS</h2>
						<p class="lead" data-aos="fade-up" data-aos-delay="100"
							style="font-size: 30px; color: black; font-weight: bold;">Coin
							- Confidence - Convenient</p>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6 mb-5" data-aos="fade-up" data-aos-delay="">
						<figure class="circle-bg">
							<img src="images/img_2.jpg"
								alt="Free Website Template by Free-Template.co"
								class="img-fluid">
						</figure>
					</div>
					<div class="col-lg-5 ml-auto" data-aos="fade-up"
						data-aos-delay="100">

						<h3 class="text-black mb-4"></h3>

						<p>cos는 가상 은행 서비스의 브랜드 네임이며, co로 시작하는 세 단어를 가리키는 co-three의
							축약어입니다.</p>
						<p>신뢰성있는 금융 거래과 간편하고 직관적인 금융 서비스 제공을 개발 방향성으로 추구했습니다.</p>
						<p>회원 관리, 입금, 출금, 자동이체, 거래내역, 마이페이지 등의 기능이 담긴 은행 페이지입니다. 추가적으로
							지도를 통해 거래내역 정보를 볼 수 있습니다.</p>

					</div>
				</div>

			</div>
		</div>


		<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>

	</div>
	<!-- .site-wrap -->

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.countdown.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.fancybox.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/isotope.pkgd.min.js"></script>


	<script src="js/main.js"></script>
	<script>
		function empty() {
			alert('로그인을 해주세요.');
			location.href = 'main.jsp';
		}
	</script>

</body>
</html>

