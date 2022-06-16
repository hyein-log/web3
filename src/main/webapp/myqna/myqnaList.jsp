<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
.container{
	/* border: 1px solid black; */
	margin-top: 100px;
	margin-left: 400px;

}

h2{
	padding-left: 260px;
	color: #007bff;
	font-weight: 900;
}

.btnWrite{
 	background-color: #007bff;
    border: 1px solid #007bff;
    color: white;
    font-size: 14px;
     border-radius: 5px;
    padding: 10px 20px;
    font-weight: 300;
    height: 44px;
    margin-left: 1080px;
}

/* .btnWrite:hover{
 	background-color: #424242;
    border: 1px solid #424242;
    color: white;
    font-size: 14px;
    border-radius: 10px;
    padding: 10px 20px;
    font-weight: 300;
    height: 44px;
    margin-left: 1060px;
} */



a:hover{
	color: black;
	text-decoration: none;
	font-weight: bold;
}

th, td {
  text-align: center;
}

th{
	font-size: 16px;
	font-weight: bold;
}

.txt{
	width: 800px;
	/* text-align: center; */
	padding: 50px 80px 20px 80px;
	/* border: 10px solid rgba(007bff, 0, 0, .3); */
	border: 10px solid #B6D9FF;
	margin-top: 100px;
	margin-left: 380px;
}

.txt1{
	font-weight: bold;
	color: #007bff;
	font-size: 16px;
	text-align: center;
	
}
.txt2{
	font-weight: bold;
	color: gray;
	font-size: 13px;
	text-align: center;
	
}


.img1{
	width: 26px;
}

.img2{
	width: 36px;
}

.img3{
	width: 31px;
}
</style>
	
</head>
<body>
<jsp:include page="../finances-master/header/mainHeader.jsp"></jsp:include>

<div class="txt">
<div class="txt1">궁금하신 사항이 있으시다면 언제든지 문의해주시기 바랍니다.</div>
<br>
<div class="txt2">고객센터 연결이 힘드신 경우 1:1문의를 이용하시면 빠르게 답변드리겠습니다.</div>
<br><br><br>
<p>
<span class="map" style="margin-left: 55px;"><img class="img1" alt="" src="../finances-master/images/map.jpg"></span>
<span class="phone" style="margin-left: 200px;"><img class="img2" alt="" src="../finances-master/images/phone.jpg"></span>
<span class="email" style="margin-left: 200px;"><img class="img3"alt="" src="../finances-master/images/email.jpg"></span>
</p>

<span class="map" style="margin-left: 5px;color: gray;">제주특별자치도 제주시 </span>
<span class="phone2" style="margin-left: 100px;color:#007bff ">+82 234 2247 354 
<span class="email2" style="font-size: 16px;margin-left: 90px;"> yourmail@naver.com</span></span><br>
<!-- <span class="email2" style="margin-left: 500px;">yourmail@naver.com</span> -->
<span class="map2" style="margin-left: 10px;color: gray;"> 광양9길 10 코스은행</span>
</div>


<div class="container">
	<h2>1:1 문의 내역</h2>
	<br><br>
	<table class="table table-hover" style="width: 750px;">
	<thead >
		<tr align="center">
			<th align="center">글번호</th>
			<th align="center">제목</th>
			<th align="center">작성일</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${myqnaDatas}" var="myqna">
			<tr>
				<td>${myqna.qa_id}</td>
				<td><a href="myqnaDetail.do?qaid=${myqna.qa_id}">${myqna.qa_title}</a></td>
				<td>${myqna.qa_date}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	</div>
	<button type="button" onclick="hrefLink()" class="btnWrite" >글쓰기</button>
	
	<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>
<script>
link = '../myqna/myqnaInsert.jsp';

function hrefLink() {
	location.href = link;
}
</script>


</body>

</html>