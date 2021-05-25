<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jstlHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>글 작성</title>
<script type="text/javascript">
	function boardValidation() {

		var title = $("#title").val();
		var content = $("#content").val();
		var Img =$("#Img").val();
		if (!title) {
			alert("제목 입력은 필수입니다.");
			$("#title").focus();
			return false;
		} else if (!content) {
			alert("내용 입력은 필수 입니다.");
			$("#content").focus();
			return false;
		} else {

			boardWrite(title, content,Img);
				
		}

	}

	function boardWrite(title, content,Img) {

		$.ajax({

			url : "/jquery/boardwrite",
			type : 'POST',
			
			
			data : {
				title : title,
				content : content,
				Img : Img
			},

			success : function(data) {
				if (data == 1) {

					alert("글 등록이 완료되었습니다.");
					location.href = "/view/dashboard";
				} else {
					alert("글 등록 실패");
				}
			},
			error : function() {
				console.log("error");
			}

		})

	}
</script>
</head>
<body>
	<form>


		<table>
			<caption>게시판 글쓰기</caption>
			<tbody>


				<tr>
					<th>제목:</th>
					<td><input type="text" placeholder="제목을 입력하세요. " id="title" /></td>
				</tr>
				<tr>
					<th>내용:</th>
					<td><textarea cols="30" rows="10" placeholder="내용을 입력하세요. "
							id="content"></textarea></td>
				</tr>
				<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
				<div class="inputArea">
					<label for="Img">이미지</label> <input type="file" id="Img"
						name="file" />
					<div class="select_img">
						<img src="" />
					</div>
					<script>
						$("#Img").change(
								function() {
									if (this.files && this.files[0]) {
										var reader = new FileReader;
										reader.onload = function(data) {
											$(".select_img img").attr("src",
													data.target.result).width(
													200);
										}
										reader.readAsDataURL(this.files[0]);
									}
								});
					</script>

				</div>
				<%=request.getRealPath("/")%>
				</form>


				<tr>	
					<td colspan="2"><input type="button" value="등록"
						onclick="boardValidation()" /> <input type="button" value="뒤로"
						onclick="javascript:location.href='dashboard'" /></td>
				</tr>
			</tbody>
		</table>
	</form>

</body>
</html>