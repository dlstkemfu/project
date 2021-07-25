<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jstlHeader.jsp" %>  
<%@ include file="/WEB-INF/views/view/boardpage.jsp"%>   
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

<div class="table-responsive">
	
	
	
	<table class="table table-condensed table-hover table-striped"  style="width:80%; margin:auto;">
	
		<thead>
			<tr>
				<th>상품</th>
				<th>제목</th>
				<th>조회수</th>
				<th>내용</th>
				<th>글 작성 날짜</th>
			</tr>
		</thead>

		<c:forEach var="b" items="${result }">
			<fmt:formatDate value="${b.createtime}" pattern="yyyy년MM월dd일"	var="dateFormat_cr" />
			<tr>
			<td><div class="row">
  <div class="col-xs-3 col-md-3">
    <a  class="thumbnail">
      <img src="${b.img }" alt="사진없음">
    </a>
  </div>
</div></td>
			
				<td><a href="/view/boardDetail?id=${b.id }">${b.title }</a></td>
				<td>${b.views }</td>
				<td>${b.content }</td>
				<td>${dateFormat_cr }</td>
			</tr>
		</c:forEach>
	</table>
	
	

<div>
		<select name="searchType">
			<option value="title"
				<c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
			<option value="content"
				<c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
			<option value="users"
				<c:if test="${page.searchType eq 'users'}">selected</c:if>>작성자</option>
		</select> 
		<input type="text" name="keyword" value="${page.keyword}" />

		<button type="button" id="searchBtn">검색</button>
	</div>
	
<div>
	<c:if test="${page.prev}">
	<ul class="pagination">
		<li><span><a href="/view/dashboard?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a></span></li>
			</ul>
		
	</c:if>

	<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
		var="num">
		
		
		<c:if test="${select != num}">
		<ul class="pagination">
		<li><a href="/view/dashboard?num=${num}${page.searchTypeKeyword}">${num}</a></li>
		</ul>
		</c:if>    
  
  <c:if test="${select == num}">
  <ul class="pagination">
  <li class="page-item active"><a><b>${num}</b></a></li>
  </ul>
  </c:if>
		
	</c:forEach>

	<ul class="pagination">
	<c:if test="${page.next}">
		<li><span> <a href="/view/dashboard?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a>
			
		</span></li>
	</c:if>
	
	</ul>
</div>
	

	<script>
		document.getElementById("searchBtn").onclick = function() {
			let searchType = document.getElementsByName("searchType")[0].value;
			let keyword = document.getElementsByName("keyword")[0].value;
			location.href = "/view/dashboard?num=1" + "&searchType="
					+ searchType + "&keyword=" + keyword;
		};
	</script>
	<div>
		<a href="/view/boardwrite">글 작성하기</a>
	</div>

</div>
</body>
</html>