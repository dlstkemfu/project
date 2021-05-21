<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jstlHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
   
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

        <caption>게시판 글 내용 </caption>
    <tbody>
            <tr>
                <th>제목: </th>
                <td>${result.title}</td>
            </tr>
            <tr>
                <th>내용: </th>
                <td>${result.content}</td>
            </tr>
            
            <tr>
                <th>조회수: </th>
                <td>${result.views}</td>
            </tr>
            <tr>
                <th>작성자: </th>
                <td>${result.users}</td>
            </tr>
            
         	
            <tr>
                <td colspan="2">
                    <input type="button" value="삭제" onclick="javascript:location.href='boardDelete?id=${result.id}'"/>
                    
                    <input type="button" value="삭제" onclick="boardDelete(${result.id})">
                    <input type="button" value="목록보기" onclick="javascript:location.href='dashboard'"/>
                </td>
            </tr>
    </tbody>
</table>
</form>
</body>
</html>