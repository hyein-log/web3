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
	margin-left: 350px
}

h3{
	padding-left: 250px;
}


.btnWrite{
	margin-left:  1000px;
}

a:hover{
	color: black;
	text-decoration: none;
	font-weight: bold;
}

</style>
	
</head>
<body>
<jsp:include page="../finances-master/header/mainHeader.jsp"></jsp:include>

<div class="container">
	<h3>Q & A</h3>
	<br><br>
	<table class="table table-hover" style="width: 750px;">
	<thead >
		<tr align="center">
			<th align="center">no</th>
			<th align="center">title</th>
			<th align="center">date</th>
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