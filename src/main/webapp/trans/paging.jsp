<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id = "paging">
<c:url var="action" value="transIn.do" />
		<c:if test="${param.prev }">
		<a href="${action}?page=${param.beginPage-1}&kind=${param.kind}&accNum=${param.accNum}&sel=${param.sel}&searchStartDate=${param.searchStartDate}&searchEndDate=${param.searchEndDate}">이전</a>
		</c:if>
		<c:forEach begin="${param.beginPage }" end="${param.endPage }" step="1" var="index">
		<c:choose>
		<c:when test="${param.page==index}">
		${index}
		</c:when>
		<c:otherwise>
		<a href="${action }?page=${index}&kind=${param.kind}&accNum=${param.accNum}&sel=${param.sel}&searchStartDate=${param.searchStartDate}&searchEndDate=${param.searchEndDate}">${index}</a>
		</c:otherwise>
		</c:choose>
		</c:forEach>
		<c:if test="${param.next}">
		<a href="${action}?page=${param.endPage+1}&kind=${param.kind}&accNum=${param.accNum}&sel=${param.sel}&searchStartDate=${param.searchStartDate}&searchEndDate=${param.searchEndDate}">다음</a>
		</c:if>
</div>
</body>
</html>