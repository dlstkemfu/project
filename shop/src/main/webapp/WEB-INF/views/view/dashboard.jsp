<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jstlHeader.jsp" %>  
<%@ include file="/WEB-INF/views/view/boardpage.jsp"%>   
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>알뜰시장</title>



</head>
<body>
<input type="button" value="조회순"	onclick="javascript:location.href='viewlist?num=1'"/>
<input type="button" value="취소" onclick="javascript:location.href='/view/boardDetail?id=${result.id}'"/ >
반가워요

<select name="searchType">
			<option value="title"
				<c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
				</select>
</body>
</html>