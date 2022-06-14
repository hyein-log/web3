<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	
<form action="myqnaUpdate.do" method="post">
글번호 : ${myqna.qa_id} 
<input type="hidden" name="qaid" value="${myqna.qa_id}"><br>
제목 : <input type="text" name="title"  value="${myqna.qa_title }">
 <span style="margin-left: 30px;">질문일 : ${myqna.qa_date}</span>
<br>
내용 : <input type="text" name="content"  value="${myqna.qa_content }">
<br>


<input type="button"   class="btnList" value="목록"> 
<input type="submit" id="updateBtn" value="수정">
<input type="button" class="deleteBtn" data-qaid="${myqna.qa_id}" value="삭제">
</form>

	<script type="text/javascript">
		//목록가기

		$(function() {
			$(".btnList").click(function() {
				location.href = "../myqna/myqnalist.do";
			});
			//수정가기
			/* $("#updateBtn").click(function() {
				location.href = "../myqna/myqnaUpdate.do?qaid=" + ${myqna.qa_id};
			}); */

			//삭제하기
			$(".deleteBtn").click(function() {
				var qaid = $(this).attr("data-qaid");
				if (confirm(qaid + "번을 정말 삭제하시겠습니까?")) {
					location.href = "../myqna/myqnaDelete.do?qaid=" + qaid;
				}
			});

		});
	</script>
</body>

</html>