<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<html>
<head>
    <title>공지사항</title>
</head>
<body>
<h1>게시판 목록</h1>
<table>
    <tr>
        <td>번호</td>
        <td>제목</td>
        <td>내용</td>
        <td>작성일</td>
        <td></td>
    </tr>
    <c:forEach items="${noticeDatas}" var="notice">
        <tr>
            <td><a href="noticeDetail.do?noticeid=${notice.notice_id}">${notice.notice_id}</a></td>
            <td><a href="noticeDetail.do?noticeid=${notice.notice_id}">${notice.notice_title}</a></td>
            <td>${notice.notice_content}</td>
            <td>${notice.notice_date}</td>
            <td><button class="btnDel" data-nno="${notice.notice_id}">삭제하기</button></td>
        </tr>
    </c:forEach>
</table>
<input type="button" id="notice_insert_btn" value="공지사항 등록"><br>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function (){
    $(".btnDel").click(function (){
        var nno = $(this).attr("data-nno");
        if(confirm(nno + "삭제?")){
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
