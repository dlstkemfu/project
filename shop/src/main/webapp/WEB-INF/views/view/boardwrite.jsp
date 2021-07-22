<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jstlHeader.jsp"%>
<%@ include file="/WEB-INF/views/view/boardpage.jsp"%> 
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
		
		if (!title) {
			alert("제목 입력은 필수입니다.");
			$("#title").focus();
			return false;
		} else if (!content) {
			alert("내용 입력은 필수 입니다.");
			$("#content").focus();
			return false;
		} else {
			
			form.submit();
			
		}
	}
	
	
</script>
</head>
<body>
	<form name="form" method="post" action= "/jquery/boardwrite" autocomplete="off" enctype="multipart/form-data">


		<table>
			<caption><h2>게시판 글쓰기</h2></caption>
			<tbody>


				<tr>
					<th>제목:</th>
					<td><input type="text" placeholder="제목을 입력하세요. " id="title" name="title" /></td>
				</tr>
				
				<tr>
					<th>카테고리:</th>
					<td><select class="category" name="category" >
						<option value="2">의류</option>
						<option value="3">전자제품</option>
						<option value="1">가구</option>
						<option value="4">스포츠</option>
						</select>
					</td>
				</tr>
				<tr>	
					<th>내용:</th>
					<td><textarea cols="30" rows="10" placeholder="내용을 입력하세요. "
							id="content" name="content"></textarea></td>
				</tr>
				
				<tr>	
					<th>가격:</th>
					<td><input type="text" placeholder="가격을 입력하세요. " id="price" name="price" />원</td>
				</tr>
				<tr>
				<div class="inputArea">
					<td><label for="Img">이미지</label></td>
					<td> <input type="file" id="Img"
						name="file" /></td>
					<td><div class="select_img">
						<img src="" /></td>
					</div>
					</tr>
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
				
				


				<tr>	
					<td colspan="2"><input type="button" value="등록" onclick="boardValidation()"
						 /> <input type="button" value="뒤로"
						onclick="javascript:location.href='dashboard?num=1'" /></td>
				</tr>
			</tbody>
		</table>
	</form>

</body>
</html>