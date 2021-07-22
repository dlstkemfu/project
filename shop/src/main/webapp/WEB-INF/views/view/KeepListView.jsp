<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jstlHeader.jsp"%>
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

				
				

</p>
<p><h3>알뜰시장</h3></p>
<div>찜목록</div>
<table>
<thead><tr>
<td>제목</td>
<td>카테고리</td>
<td>내용</td>
<td>취소</td>
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
				
 
 
 
 
 
 
 





</body>
</html>