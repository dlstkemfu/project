<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/jstlHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<meta charset="UTF-8">
<title>게시판 수정</title>
<script type="text/javascript">

function boardUpdateCheck(){
	
	var title = $("#title").val();
	var content = $("#content").val();
	var id =$("#id").val();
	
	if(!title){
		alert("제목 입력은 필수입니다.");
		$("#title").focus();
		return false;
	}else if(!content){
		alert("내용 입력은 필수 입니다.");
		$("#content").focus();
		return false;
	}else if(${sessionScope.userId != result.users}){
		alert("작성자만 삭제할수있습니다");
	}else{
		boardUpdate(title,content,id);
	}
		
		
	
	
}

function boardUpdate(title,content,id){
	
	$.ajax({
		
		url : "/jquery/boardUpdate",
		type:'POST',
		data : {
			title : title,
			content : content,
			id :id
			
			
			
			
			
		},
		success:function(data){
			
			if(data == 1){
				alert("글 수정이 완료되었습니다.");
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
	<form>
		<table>
			<caption>게시판 수정</caption>
			<tbody>


				<tr>
					<th>제목:</th>
					<td><input type="text" value="${result.title} " id="title" /></td>
				</tr>
				<tr>
					<th>내용:</th>
					<td><input type="text" value="${result.content} "  	id="content"></textarea></td>
				</tr>
				<tr>
					<th>글번호:</th>
					<td><input type="text" value="${result.id} " id="id" /></td>
				</tr>


				<!--  <tr>
                <th>첨부파일: </th>
                <td><input type="text" placeholder="파일을 선택하세요. " name="filename"/></td>
            </tr> -->
				<tr>
					<td colspan="2"><input type="button" value="수정"
						onclick="boardUpdateCheck()" /> <input type="button" value="뒤로"
						onclick="javascript:location.href='boardDetail?id=${result.id}'" /></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>