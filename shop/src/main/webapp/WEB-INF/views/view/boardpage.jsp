<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jstlHeader.jsp" %>   
<!DOCTYPE html>
<html lang="ko">
  <head>
  
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>알뜰시장</title>

   

    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <nav class="navbar navbar-default  navbar-fixed-top">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
     
      <ul class="nav navbar-nav">
      <li class="active"><a href="/view/dashboard?num=1">알뜰시장</a></li></ul>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    
      <ul class="nav navbar-nav navbar-right">
        
      <li class="navbar-brand">  환영합니다 ${sessionScope.loginUser.userId }님</li>
       <li class="active"><a href="/jquery/logout">로그아웃</a></li>
       <li class="active"><a href="membersUpdateView?userId=${sessionScope.loginUser.userId }">회원정보 수정 </a></li>
       <li class="active"><a href='KeepListView?userId=${sessionScope.loginUser.userId }'>찜목록</a></li>
       
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
  </head>
 
  <body>
  
  <style >
  body { padding-top: 50px;   }
  </style>
  <style>
  /* 사이드바 래퍼 스타일 */
  
  #page-wrapper {
    padding-left: 250px;
  }
  
  #sidebar-wrapper {
    position: fixed;
    width: 200px;
    height: 60%;
    margin-left: -250px;
    background: #caffbf;
    overflow-x: hidden;
    overflow-y: auto;
  }
  
  #page-content-wrapper {
    width: 100%;
    padding: 20px;
  }
  /* 사이드바 스타일 */
  
  .sidebar-nav {
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
  .sidebar-nav li {
    text-indent: 1.5em;
    line-height: 2.8em;
  }
  
  .sidebar-nav li a {
    display: block;
    text-decoration: none;
    color: #999;
  }
  
  .sidebar-nav li a:hover {
    color: #000;
    background: rgba(255, 255, 255, 0.2);
  }
  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
  }

</style>

<div id="page-wrapper">
  <!-- 사이드바 -->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a>카테고리</a>
      </li>
      <li><a href="/view/categoryboard?num=1&category=1">가구</a></li>
      <li><a href="/view/categoryboard?num=1&category=2">의류</a></li>
      <li><a href="/view/categoryboard?num=1&category=3">전자제품</a></li>
      <li><a href="/view/categoryboard?num=1&category=4">스포츠</a></li>
     
    </ul>
  </div>
  <!-- /사이드바 -->

  <!-- 본문 -->
  
    
  </body>
</html>