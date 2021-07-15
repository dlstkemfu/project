<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jstlHeader.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>알뜰시장</title>
<style>
table {
	width: 100%;
	border: 1px solid #444444;
}
th, td {
	border: 1px solid #444444;
}
</style>
</head>
<body>


	<p>
		환영합니다 ${sessionScope.loginUser.userId }님 <a href="/jquery/logout">로그아웃</a>
	</p>
	<p>알뜰시장</p>
	<div>게시글 리스트</div>
	<table>
		<thead>
			<tr>
				<td>제목</td>
				<td>조회수</td>
				<td>내용</td>
				<td>상품사진</td>
				<td>글 작성 날짜</td>
			</tr>
		</thead>

		<c:forEach var="b" items="${result }">
			<fmt:formatDate value="${b.createtime}" pattern="yyyy-MM-dd HH:MM:ss"
				var="dateFormat_cr" />
			<tr>
				<td><a href="/view/boardDetail?id=${b.id }">${b.title }</a></td>
				<td>${b.views }</td>
				<td>${b.content }</td>
				<td><img src="${b.img}"></td>
				<td>${dateFormat_cr }</td>
			</tr>
		</c:forEach>
	</table>
	
	 <a href="/view/categoryboard?num=1&category=1">카테고리:가구</a>
 <a href="/view/categoryboard?num=1&category=2">카테고리:의류</a>
 <a href="/view/categoryboard?num=1&category=3">카테고리:전자제품</a>
 <a href="/view/categoryboard?num=1&category=4">카테고리:스포츠</a>

<div>
	<c:set var="b" value="${result }"/>
	<c:if test="${page.prev}">
		<span>[ <a href="/view/categoryboard?num=${page.startPageNum - 1}&category=${category}${page.searchTypeKeyword}">이전</a>
			]
		</span>
	</c:if>

	<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
		var="num">
	
		<span> 
		
		<c:if test="${select != num}">
		
		<a href="/view/categoryboard?num=${num}&category=${category}${page.searchTypeKeyword}">${num}</a>
		
		</c:if>    
 
  <c:if test="${select == num}">
   <b>${num}</b>
  </c:if>
		</span>
	</c:forEach>
	

	<c:if test="${page.next}">
		<span>[ <a href="/view/categoryboard?num=${page.endPageNum + 1}&category=${category}${page.searchTypeKeyword}">다음</a>
			]
		</span>
	</c:if>
</div>
	<div>
		<select name="searchType">
			<option value="title"
				<c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
			<option value="content"
				<c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
			<option value="title_content"
				<c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
			<option value="users"
				<c:if test="${page.searchType eq 'users'}">selected</c:if>>작성자</option>
		</select> 
		<input type="text" name="keyword" value="${page.keyword}" />

		<button type="button" id="searchBtn">검색</button>
	</div>

	<script>
		document.getElementById("searchBtn").onclick = function() {
			let searchType = document.getElementsByName("searchType")[0].value;
			let keyword = document.getElementsByName("keyword")[0].value;
			location.href = "/view/boardpage?num=1" + "&searchType="
					+ searchType + "&keyword=" + keyword;
		};
	</script>
	<div>
		<a href="/view/boardwrite">글 작성하기</a>
	</div>


</body>
</html>