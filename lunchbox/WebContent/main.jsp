<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="lunchbox.model.member.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<c:set var="id" value="${id }"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content=Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>랜 덤 박 스 !</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-hearder">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-taget="#bs-example-navbar-collapse-1"
				aria-expanded="false"></button>
			<a class="navbar-brand" href="main.jsp"> </a>
		</div>
		<c:choose>
			<c:when test="${empty id}">
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> Connect <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="loginForm.jsp"> Sign in </a></li>
								<li><a href="joinForm.jsp"> Sign up </a></li>
							</ul></li>
					</ul>
				</div> 
			</c:when>
		</c:choose>

		<c:choose>
			<c:when test='${not empty id }'>
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					${id }님 로그인 중
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">회원메뉴 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="./MemberLogoutAction.me">로그아웃</a></li>
								<li><a href="./BoardListAction.bo">게시판</a></li>
								<c:choose>
									<c:when test='${id!=null && id.equals("admin") }'>
										<li><a href="./MemberListAction.me">회원목록조회</a></li>
									</c:when>
								</c:choose>
							</ul></li>
					</ul>
				</div>
			</c:when>
		</c:choose>
		<!-- soyoung 끝 -->
	</nav>
   <div class="container">
      <div class="jumbotron">
         <div class="container">
            <p><h1>L U N C H B O X !</h1></p>
            <br>
            <br>
            <p class="text-center">Average taste! Random menu!</p>
            <p class="text-center">Create LUNCH BUS or Get on it!</p>
			<div class="container" style="text-align: left; margin-top: 50px;" >
                  <a class="btn btn-default btn-lg" href="RestoListAction.bo"
                     role="button">Launch</a>
					</div>
			<div class="container" style="text-align: right; margin-top: 50px;" >
			<c:if test="${empty id }">
			<a class="btn btn-default btn-lg" href="./loginForm.jsp"
                     role="button">게시판가기</a></c:if>
             <c:if test="${not empty id }">
                  <a class="btn btn-default btn-lg" href="./BoardListAction.bo"
                     role="button">게시판가기</a></c:if>
					</div>
				</div>
			</div>
		</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>