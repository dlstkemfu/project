<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jstlHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>글 내용</title>
<style>
table {
	width: 100%;
	border: 1px solid #444444;
}

th, td {
	border: 1px solid #444444;
}
</style>
<script type="text/javascript">


function boardDelete(id) {
	
	var chk = confirm("정말 삭제하시겠습니까?");
	
	if(chk){
		
		if(${sessionScope.userId == result.users}){
		location.href='boardDelete?id='+id;
	}else{
		alert("작성자만 삭제할수있습니다");
	}
	}
}
</script>
</head>
<body>
	<form>
		<table>
<div>
			<caption>게시판 글 내용</caption>
			<tbody>
				<tr>
					<th>제목:</th>
					<td>${result.title}</td>
				</tr>
				<tr>
					<th>내용:</th>
					<td>${result.content}</td>
				</tr>

				<tr>
					<th>이미지:</th>
					<td><img src="${result.img}"></td>

				</tr>

				<tr>
					<th>조회수:</th>
					<td>${result.views}</td>
				</tr>
				<tr>
					<th>작성자:</th>
					<td>${result.users}</td>
				</tr>
				
				
				<!-- 댓글 -->
				<hr />

<ul>
	<li>
		<div>
			<p>첫번째 댓글 작성자</p>
			<p>첫번째 댓글</p>
		</div>
	</li>
	<li>
		<div>
			<p>두번째 댓글 작성자</p>
			<p>두번째 댓글</p>
		</div>
	</li>
	<li>
		<div>
			<p>세번째 댓글 작성자</p>
			<p>세번째 댓글</p>
		</div>
	</li>
	
	<c:forEach items="${comments}" var="comments">
<li>
	<div>
		<p>${comments.writer} / ${comments.regDate}</p>
		<p>${comments.comtCon }</p>
	</div>
</li>	
</c:forEach>
</ul>
<form name="form" method="post" action= "/Comments/commentswrite">
<div>
	<p>
		<label>댓글 작성</label> 
	</p>
	<input type="hidden" name="id" value="${result.id}">
	<p>
		<textarea rows="5" cols="50"></textarea>
	</p>
	<p>
		<button type="submit">댓글 작성</button>
	</p>
</div>
				
				
				<!-- 댓글 끝-->
	</form>			
				
				

					
				

				





				<tr>
					<td colspan="2"><input type="button" value="수정"
						onclick="javascript:location.href='boardUpdateView?id=${result.id}'" />

						<input type="button" value="삭제"
						onclick="boardDelete(${result.id})"> <input type="button"
						value="목록보기" onclick="javascript:location.href='dashboard'" /></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>