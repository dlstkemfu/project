<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jstlHeader.jsp" %>    
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

				
<p>환영합니다 ${sessionScope.loginUser.userId }님 <input type="button" value="로그아웃" onclick="javascript:location.href='/jquery/logout'"  />
<input type="button" value="회원정보수정"
						onclick="javascript:location.href='membersUpdateView?userId=${sessionScope.loginUser.userId }'" />

 <input type="button" value="메인으로" onclick="javascript:location.href='dashboard'" />				

</p>
<p>알뜰시장</p>
<div>게시글 리스트</div>
<table>
<thead><tr>
<td>제목</td>
<td>카테고리</td>
<td>내용</td>
</tr></thead>

<c:forEach var="b" items="${result }">

<tr>
<td><a href="/view/boardDetail?id=${b.id }">${b.title }</a></td>

<td>${b.category }</td>
<td>${b.content }</td>
<td><input type="button" value="찜 취소" 	onclick="KeepDelete(${b.bno})"></td>


</tr>
</c:forEach>
</table>
<li>
 <a href="/view/boardpage?num=1">글 목록(페이징)</a> 
 
 <script type="text/javascript">
 
 function KeepDelete(bno) {
		
		var chk = confirm("정말 삭제하시겠습니까?");
		
		if(chk){
			
			
			location.href='KeepDelete?bno='+bno;
		}else{
			alert("작성자만 삭제할수있습니다");
		}
		}
	
 
 function memberUpdate(){
	
	
	 location.href="/user/membersUpdateView?userId=${sessionScope.loginUser.userId }";
}

 function comments(){
	
	
	 location.href="/view/categoryboard?num=1&category=1";
}
</script>
 
 <form name="form" method="get" action="/view/categoryboard"	autocomplete="off">
					<div>
						
						<input type="hidden" name="category" id="category" value="1">
						
						
					</div>


					
				</form>
				<input type="button" value="카테고리:가구" onclick="comments()" />
 
 
 
 
 
 
 <a href="/view/categoryboard?num=1&category=1">카테고리:가구</a>
 <a href="/view/categoryboard?num=1&category=2">카테고리:의류</a>
 <a href="/view/categoryboard?num=1&category=3">카테고리:전자제품</a>
 <a href="/view/categoryboard?num=1&category=4">카테고리:스포츠</a>
</li>

<div>
  <select name="searchType">
      <option value="title">제목</option>
         <option value="content">내용</option>
      <option value="title_content">제목+내용</option>
      <option value="users">작성자</option>
  </select>
  
  <input type="text" name="keyword" />
  
  <button type="button">검색</button>
 </div>
<div> <a href="/view/boardwrite">글 작성하기</a></div>


</body>
</html>