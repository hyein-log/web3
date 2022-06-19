<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<html>
<head>
<title>COS BANK 공지사항</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
<style type="text/css">
.wrap{
		width: 1000px;
		margin: auto;
		font-family: 'Nanum Gothic', sans-serif;
	}
th, .td1 {
	text-align: center;
	padding-top: 1%;
	padding-bottom: 1%;
	border-collapse: collapse;
}
.quaTitle {
	color: #007bff;
	font-weight: 900;
	font-size: 30px;
	margin-left: 310px;
	margin-top: 150px;
	margin-bottom: 3%;
	font-family: 'Nanum Gothic', sans-serif;

}

.trTitle{
	font-weight: bold;
	font-size: 17px;
}

.td2{
	padding-left: 90px;
}

.td3{
	/* padding-left: 200px; */
	text-align: center;
	padding-left: 50px;
}

a{
	text-decoration: none;
	color: black;
	font-weight: normal;
}

a:hover{
	text-decoration: none;
}



.btnDel{
	/* margin-top: 50px;
	margin-left: 1155px; */
	cursor: pointer;
	background-color: white;
    border: 1px solid #007bff;
    color: #007bff;
    font-size: 12px;
    border-radius: 15px;
    padding: 10px 10px;
    font-weight: bold;
}

#notice_insert_btn{
	margin-top: 50px;
	margin-left: 1155px;
	cursor: pointer;
	background-color: #007bff;
    border: 1px solid #007bff;
    color: white;
    font-size: 15px;
    border-radius: 15px;
    padding: 10px 10px;
    font-weight: bold;
}
#notice_insert_btn:hover{
	margin-top: 50px;
	margin-left: 1155px;
	cursor: pointer;
	background-color: white;
    border: 1px solid #007bff;
    color: #007bff;
    font-size: 15px;
    border-radius: 15px;
    padding: 10px 10px;
    font-weight: bold;
}



</style>
</head>
<body>
<h2 class="quaTitle">공지사항 목록</h2>
<div class="wrap">
<table class="table table-hover">
    <tr class="trTitle">
        <td class="td1">번호</td>
        <td class="td3">제목</td>
       <!--  <td>내용</td> -->
        <td class="td1">작성일</td>
        <td class="td1">삭제여부</td>
    </tr>
    <c:forEach items="${notiList}" var="notice"  varStatus="status">
        <tr>
            <td class="td1"><a href="noticeDetail.do?noticeid=${notice.notice_id}">${status.count }</a></td>
            <td class="td2"><a href="noticeDetail.do?noticeid=${notice.notice_id}">${notice.notice_title}</a></td>
           <%--  <td>${notice.notice_content}</td> --%>
            <td class="td1">${notice.notice_date}</td>
            <td class="td1"><button class="btnDel" data-nno="${notice.notice_id}">삭제하기</button></td>
        </tr>
    </c:forEach>
</table>

</div>

<input type="button" id="notice_insert_btn" value="공지사항 등록"><br>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function (){
    $(".btnDel").click(function (){
        var nno = $(this).attr("data-nno");
        if(confirm(nno + "번을 삭제 하겠습니까?")){
            location.href = "noticeDelete.do?nno=" + nno;
        }
    });
});
$(function(){
	$("#notice_insert_btn").click(function(){
		location.href = "../notice/noticeInsert.do";
	});
});
</script>
</body>
</html>
