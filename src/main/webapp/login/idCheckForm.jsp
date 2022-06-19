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
<c:set var="user_id" value="${param.id}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복 확인</title>

<style type="text/css">

#userId{
	width: 190px;
    height: 30px;
    display: inline;
    border-radius: 20px;
    border: 1px solid #ced4da;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
     margin-top: 3%; 
  	margin-left: 10px;
  	
}

#userId:active, #userId:focus {
    outline: 1px solid #007bff;
}

.sendbtnDiv{
   margin-left: 10px;
}

.btnSubmit,.btnCancel {
	background-color: #007bff;
    border: 1px solid #007bff;
    color: white;
    font-size: 15px;
    border-radius: 8px;
    padding: 10px 30px;
    font-weight: 400;
    height: 40px;
    cursor: pointer;

}

</style>


<script type="text/javascript">
	function sendCheckValue() {
		var openJoinfrm = opener.document.joinForm;
		if (document.checkIdForm.chResult.value=="N") {
			alert("다른 아이디를 입력해주세요.");
			openJoinfrm.id.focus();
			window.close();
		}else {
			// 중복체크 결과인 idCheck 값을 전달
			opener.document.joinForm.idDuplication.value="idCheck";
			opener.document.joinForm.dbCheckId.disabled=true;
			opener.document.joinForm.dbCheckId.style.opacity=0.6;
			opener.document.joinForm.dbCheckId.style.cursor="default";
			window.close();
		}
	}
</script>


</head>
<body>
	<b><font size="4" color="gray" style="margin-left: 12px;margin-top: 20px;">아이디 중복 확인</font></b>
	<br>
	<form name="checkIdForm">
		<input type="text" name="id" value="${user_id}" id="userId" disabled="disabled">
		<c:choose>
		<c:when test="${result==1}">
			<p style="color: red;margin-left: 12px;">이미 사용 중인 아이디입니다.</p>
			<input type="hidden" name="chResult" value="N"/>
		</c:when>
		<c:when test="${result==0 }">
			<p style="color: red;margin-left: 12px;">사용가능한 아이디입니다.</p>
			<input type="hidden" name="chResult" value="Y"/>
		</c:when>
		<c:otherwise>
			<p>오류 발생(-1)</p>
			<input type="hidden" name="chResult" value="N"/>
		</c:otherwise>
		</c:choose>
		
		<span class="sendbtnDiv">
		<input type="button" onclick="window.close()" class="btnCancel" value="취소"/>
		<input type="button" onclick="sendCheckValue()" class="btnSubmit" value="사용하기"/>
		</span>
</form>
</body>
</html>