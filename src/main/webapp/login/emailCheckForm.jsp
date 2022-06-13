<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"
 isELIgnored="false"
 %>
<%
	request.setCharacterEncoding("UTF-8");
	Integer result = (Integer) session.getAttribute("result");
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="user_email" value="${param.email}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMAIL 중복 확인</title>
<script type="text/javascript">
	function sendCheckValue() {
		var openJoinfrm = opener.document.joinForm;
		if (document.checkEmailForm.chResult.value=="N") {
			alert("다른 아이디를 입력해주세요.");
			openJoinfrm.email.focus();
			window.close();
		}else {
			// 중복체크 결과인 idCheck 값을 전달
			opener.document.joinForm.emailDuplication.value="emailCheck";
			opener.document.joinForm.dbCheckEmail.disabled=true;
			opener.document.joinForm.dbCheckEmail.style.opacity=0.6;
			opener.document.joinForm.dbCheckEmail.style.cursor="default";
			window.close();
		}
	}
</script>
</head>
<body>
	<b><font size="4" color="gray">EMAIL 중복 확인</font></b>
	<br>
	<form name="checkEmailForm">
		<input type="text" name="email" value="${user_email}" id="userEmail" disabled="disabled">
		<c:choose>
		<c:when test="${result==1}">
			<p style="color: red">이미 사용 중인 메일입니다.</p>
			<input type="hidden" name="chResult" value="N"/>
		</c:when>
		<c:when test="${result==0 }">
			<p style="color: red">사용가능한 메일입니다.</p>
			<input type="hidden" name="chResult" value="Y"/>
		</c:when>
		<c:otherwise>
			<p>오류 발생(-1)</p>
			<input type="hidden" name="chResult" value="N"/>
		</c:otherwise>
		</c:choose>
		<input type="button" onclick="window.close()" value="취소"/><br>
		<input type="button" onclick="sendCheckValue()" value="사용하기"/>
</form>
</body>
</html>