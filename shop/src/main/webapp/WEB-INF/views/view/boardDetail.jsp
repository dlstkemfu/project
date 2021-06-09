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
function comments(){
	var comtCon = $("#comtCon").val();
	if(!comtCon){
		alert("댓글 입력은 필수입니다.");
		$("#comtCon").focus();
		return false;
	}
	else{
	form.submit();
	}
}
function commentsDelete(cno) {
	<c:forEach items="${comments}" var="comments">
	var chk = confirm("정말 삭제하시겠습니까?");
	
	if(chk){
		
		if(${sessionScope.userId == comments.writer}){
			
			location.href='commentsDelete?cno='+cno;
		                
		          
		
			
			
			
			
	}else{
		alert("작성자만 삭제할수있습니다");
	}
		
	}
	</c:forEach>	
}
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
				댓글
				<ul>


					<c:forEach items="${comments}" var="comments">

						<li>
							<div>
								<p>작성자 :${comments.writer}</p>
								<p>
									내용 :${comments.comtCon }<input type="button" value="댓글삭제"
										onclick="commentsDelete(${comments.cno})"  /><input type="button" value="댓글수정"
										onclick="javascript:location.href='commentsUpdateView?id=${comments.id}&&cno=${comments.cno }'"  />
								</p>
							</div>
						</li>
					</c:forEach>
				</ul>
				<form name="form" method="post" action="/jquery/commentswrite"	autocomplete="off">
					<div>
						<p>
							<label>댓글 작성</label>
						</p>
						<input type="hidden" name="id" id="id" value="${result.id}">
						<p>
							<input type="text" id="comtCon" name="comtCon" />
						</p>
						<p></p>
					</div>


					<!-- 댓글 끝-->
				</form>
				<input type="button" value="댓글작성" onclick="comments()" />













				<tr>
					<td colspan="2"><input type="button" value="수정"
						onclick="javascript:location.href='boardUpdateView?id=${result.id}'" />

						<input type="button" value="삭제"
						onclick="boardDelete(${result.id})"> <input type="button"
						value="목록보기" onclick="javascript:location.href='dashboard'" /></td>
				</tr>
			</tbody>
	</table>

</body>
</html>