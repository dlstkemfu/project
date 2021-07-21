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

</head>
<body>

<div class="table-responsive">
	<p>환영합니다 ${sessionScope.loginUser.userId }님 <input type="button" value="로그아웃" onclick="javascript:location.href='/jquery/logout'"  />
	</p>
	<p>알뜰시장</p>
	<div>게시글 리스트</div>
	
	<ul class="nav nav-pills nav-stacked">메뉴 안녕</ul>
	
	
	<table class="table table-condensed table-hover table-striped"  style="width:70%; margin:auto;">
		<thead>
			<tr class="warning">
				<th>제목</th>
				<th>조회수</th>
				<th>내용</th>
				<th>상품사진</th>
				<th>글 작성 날짜</th>
			</tr>
		</thead>

		<c:forEach var="b" items="${result }">
			<fmt:formatDate value="${b.createtime}" pattern="yyyy년MM월dd일"	var="dateFormat_cr" />
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
<div>
	
	<c:if test="${page.prev and category == 1}">
	<ul class="pagination">
		<li><span><a href="/view/categoryboard?num=${page.startPageNum - 1}&category=1${page.searchTypeKeyword}">이전</a></span></li>
			
		
	</c:if>
	<c:if test="${page.prev and category == 2}">
	
		<li><span><a href="/view/categoryboard?num=${page.startPageNum - 1}&category=2${page.searchTypeKeyword}">이전</a></span></li>
			
		
	</c:if>
	
	<c:if test="${page.prev and category == 3}">
	
		<li><span><a href="/view/categoryboard?num=${page.startPageNum - 1}&category=3${page.searchTypeKeyword}">이전</a></span></li>
			
		
	</c:if>
	
	<c:if test="${page.prev and category == 4}">
	
		<li><span><a href="/view/categoryboard?num=${page.startPageNum - 1}&category=4${page.searchTypeKeyword}">이전</a></span></li>
			
		</ul>
	</c:if>
	
	

	<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
		var="num">
	
		
		
		<c:if test="${select != num and category == 1}">
		<ul class="pagination">
		<li><a href="/view/categoryboard?num=${num}&category=1${page.searchTypeKeyword}">${num}</a></li>
		</ul>
 		</c:if>
 		
 		
 		<c:if test="${select != num and category == 2}">
		<ul class="pagination">
		<li><a href="/view/categoryboard?num=${num}&category=2${page.searchTypeKeyword}">${num}</a></li>
		</ul>
 		</c:if>
 		
 		<c:if test="${select != num and category == 3}">
		<ul class="pagination">
		<li><a href="/view/categoryboard?num=${num}&category=3${page.searchTypeKeyword}">${num}</a></li>
		</ul>
 		</c:if>
 		
 		<c:if test="${select != num and category == 4}">
		<ul class="pagination">
		<li><a href="/view/categoryboard?num=${num}&category=4${page.searchTypeKeyword}">${num}</a></li>
		</ul>
 		</c:if>
 		<ul class="pagination">
  <c:if test="${select == num}">
   <li class="page-item active"><a><b>${num}</b></a></li>
   
  </c:if>
  </ul>
		
	</c:forEach>
	
<ul class="pagination">
	<c:if test="${page.next and category == 1}">
		<li><span> <a href="/view/categoryboard?num=${page.endPageNum + 1}&category=1${page.searchTypeKeyword}">다음</a>
			
		</span></li>
	</c:if>
	<c:if test="${page.next and category == 2}">
		<li><span> <a href="/view/categoryboard?num=${page.endPageNum + 1}&category=2${page.searchTypeKeyword}">다음</a>
			
		</span></li>
	</c:if>
	<c:if test="${page.next and category == 3}">
		<li><span> <a href="/view/categoryboard?num=${page.endPageNum + 1}&category=3${page.searchTypeKeyword}">다음</a>
			
		</span></li>
	</c:if>
	<c:if test="${page.next and category == 4}">
		<li><span> <a href="/view/categoryboard?num=${page.endPageNum + 1}&category=4${page.searchTypeKeyword}">다음</a>
			
		</span></li>
	</c:if>
	</ul>
</div>
	

	<script>
		document.getElementById("searchBtn").onclick = function() {
			let searchType = document.getElementsByName("searchType")[0].value;
			let keyword = document.getElementsByName("keyword")[0].value;
			location.href = "/view/categoryboard?num=1&category=2" + "&searchType="
					+ searchType + "&keyword=" + keyword;
		};
	</script>
	<div>
		<a href="/view/boardwrite">글 작성하기</a>
	</div>

</div>
</body>
</html>