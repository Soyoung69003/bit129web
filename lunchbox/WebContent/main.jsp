<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="lunchbox.model.member.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<c:set var="id" value="${session.getAttribute('id')}"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content=Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>랜 덤 박 스 !</title>
</head>
<body>
	<!--  여기서는 세션에 userid값이 존재하면 불러온다-->
	<!-- soyoung 시작 -->
	<!-- soyoung 끝 -->
	<nav class="navbar navbar-default">
		<div class="navbar-hearder">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-taget="#bs-example-navbar-collapse-1"
				aria-expanded="false"></button>
			<a class="navbar-brand" href="main.jsp"> </a>
		</div>
		<!-- 여기 if로 id값이 null이면 발동 -->
		<!-- soyoung 시작 -->
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
								<li>${id }</li>
							</ul></li>
					</ul>
				</div> 
			</c:when>
		</c:choose>
		<!-- soyoung 끝 -->
		<!-- 여기는 if로 id 값이 있으면 발동하게 한다 -->
		<!-- soyoung 시작 -->
		<c:choose>
			<c:when test='${not empty id }'>
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">회원관리<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="logoutAction.jsp">로그아웃</a></li>
								<li>${id }</li>
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
				<p>
				<h1>L U N C H B O X !</h1>
				<br>
				<br>
				<p class="text-center">Average taste! Random menu!</p>
				<p class="text-center">You can</p>
				<p class="text-center">Create LUNCH BUS or Get on it!</p>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<!-- choose one 이나 all random을 누르면 바로 각각의 액션으로 가서 로그인여부를 확인하고
						비회원이면 돌려보낸다 -->
					<div class="container" style="text-align:center;">
						<a class="btn btn-default btn-lg btn-warning" href="result.jsp"
							role="button">Launch</a>
					</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>