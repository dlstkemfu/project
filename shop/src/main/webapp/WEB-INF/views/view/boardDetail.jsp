<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jstlHeader.jsp"%>
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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

function Keep(){

	forms.submit();
	alert("찜하였습니다");
	

	
}




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
		
			<caption>게시판 글 내용</caption>
			
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
					<th>가격:</th>
					<td>${result.price}</td>

				</tr>

				<tr>
					<th>조회수:</th>
					<td>${result.views}</td>
				</tr>
				<tr>
					<th>작성자:</th>
					<td>${result.users}</td>
				</tr>
				
				<tr>
					<td colspan="2"><input type="button" value="수정"
						onclick="javascript:location.href='boardUpdateView?id=${result.id}'" />

						<input type="button" value="삭제"
						onclick="boardDelete(${result.id})">
						 <input type="button" value="목록보기" onclick="javascript:location.href='dashboard'" />
						 <input type="button" value="찜하기" onclick="Keep()" /></td>
				</tr>
			
	</table>
	<form name="forms" method="post" action= "/jquery/Keep" autocomplete="off" >
	<input type="hidden" name="title" id="title"
			value="${result.title}">
			<input type="hidden" name="category" id="category"
			value="${result.category}">
			<input type="hidden" name="content" id="content"
			value="${result.content}">
			<input type="hidden" name="users" id="users"
			value="${result.users}">
			<input type="hidden" name="price" id="price"
			value="${result.price}">
			<input type="hidden" name="id" id="id"
			value="${result.id}">
			</form>
	
				

				<!-- 댓글 -->
				댓글
				<hr />
				

					
					<c:forEach items="${comments}" var="comments">
<div>
						<li>
							
								<p>작성자 :${comments.writer}</p>
								<p>
									내용 :${comments.comtCon }<input type="button" value="댓글삭제"
										onclick="commentsDelete(${comments.cno})"  />
										<input type="button" value="댓글수정"
										onclick="javascript:location.href='commentsUpdateView?id=${comments.id}&&cno=${comments.cno }'"  />
								</p>
							</div>
						</li>
					</c:forEach>
				
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
				
			











				

</body>
</html>