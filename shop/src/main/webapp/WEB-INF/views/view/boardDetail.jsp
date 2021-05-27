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
<script>
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
				
				
				<div id="comments">

					<c:if test="${sessionScope.userId == null }">
						<p>
							댓글을 남기시려면 <a href="/user/login">로그인</a>해주세요
						</p>
					</c:if>

					<c:if test="${sessionScope.userId != null}">
						<section class="commentsForm">
							<form name="form"  method="post" autocomplete="off">
							
							<input type="hidden" name="boardid" value="${result.id}" id="boardid">
								<input type="text" placeholder="댓글을 입력하세요. " id="comtCon" name="comtCon" />
		
								<div class="input_area">
									<button type="submit" id="comments_btn" >댓글남기기</button>
								</div>

							</form>
						</section>
					</c:if>

					<section class="replyList">
						<ol>
							<li>댓글 목록</li>
						</ol>
					</section>
				</div>

				





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