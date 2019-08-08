<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "lunchbox.controller.*" %>
<html>
<head>
<meta http-equiv="Content=Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<c:set var="id" value="${id}"/>

<title> 랜 덤 박 스 ! </title>
</head>
<body>
<!-- 로그인 상태면 메인으로 강제 이동 -->
<c:if test="${not empty id }">
	<c:redirect url = "/main.jsp" context = "/lunchbox/"/>
</c:if>
<!-- 비회원에게 보이는 상단메뉴-->
	<nav class="navbar navbar-default">
		<div class="navbar-hearder">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-taget="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				</button>
				<a class="navbar-brand" href="main.jsp"> LUNCH BOX </a>
		</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"> Connect <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="loginForm.jsp"> Sign in </a></li>
						<li><a href="joinForm.jsp"> Sign up </a></li>
					</ul>
				</li>
			</ul>
			</div>
	</nav>

<!-- 회원가입 폼-->
<div class="container">
<div style=" margin: 100px 25px 15px 0px">
      <div class="col-lg-4"></div>
      <div class="col-lg-4">
         <div class="jumbotron" style="padding-top: 20px;">
            <form name="joinform" action="${contextPath }./MemberJoinAction.me" method="post">
               <h3 style="text-align: center;">Sign up</h3>
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="아이디를 입력하세요" name="MEMBER_ID">
               </div>
               <div class="form-group">
                  <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="MEMBER_PWD" >
               </div>
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="이름을 입력하세요" name="MEMBER_NAME" >
               </div>
               <div class="form-group">
                  <input type="email" class="form-control" placeholder="이메일을 입력하세요" name="MEMBER_EMAIL" maxlength="20">
               </div>
               <input type="submit" class="btn btn-primary form-control" value="Sign up" >
   			   </form>
         </div>
      </div>
      </div>
   </div>
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>