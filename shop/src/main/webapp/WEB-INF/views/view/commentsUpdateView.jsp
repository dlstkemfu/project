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

function commentsUpdateCheck(){
	
	
	var comtCon = $("#comtCon").val();
	var cno =$("#cno").val();
	
	if(!comtCon){
		alert("내용 입력은 필수입니다.");
		$("#comtCon").focus();
		return false;
	
	}else{
		commentsUpdate(comtCon,cno);
	}
		
		
	
	
}

function commentsUpdate(comtCon,cno){
	
	$.ajax({
		
		url : "/jquery/commentsUpdate",
		type:'POST',
		data : {
			
			comtCon : comtCon,
			cno : cno,
			
			
			
			
			
		},
		success:function(data){
			
			if(data == 1){
				alert("댓글 수정이 완료되었습니다.");
				location.href="/view/boardDetail?id=${result.id}";
			}else {
				
				alert("글 수정 실패");
				
			}
		},error:function(){
			console.log("error");
		}
		
	})
	
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



						<li>
							<div>
								<p>작성자 :${comments.writer}</p>
								<p>내용 :<input type="text" placeholder="${comments.comtCon }" id="comtCon" name="comtCon" />
								<input type="button" value="수정" onclick="commentsUpdateCheck()"/ >
								<input type="hidden" name="cno" id="cno" value="${comments.cno}">
									
								</p>
							</div>
						</li>
					
					
				</ul>
				
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