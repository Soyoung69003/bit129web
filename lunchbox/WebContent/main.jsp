<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="lunchbox.model.member.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
		<c:when test="${session.id!=null }">
			<c:set var="id" value="session.getAttribute('id')"/>
		</c:when>
	</c:choose>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content=Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="css/bootstrap.css"> -->

<title>?? ?? �? ?? !</title>
</head>
<body>

	<!--  ?�기?�는 ?�션?? userid값이 존재?�면 불러?�다-->
	<!-- soyoung ?�작 -->
	

	<!-- soyoung ?? -->
	<nav class="navbar navbar-default">
		<div class="navbar-hearder">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-taget="#bs-example-navbar-collapse-1"
				aria-expanded="false"></button>
			<a class="navbar-brand" href="main.jsp"> </a>
		</div>

		<!-- ?�기 if�? id값이 null?�면 발동 -->
		<!-- soyoung ?�작 -->
		
		<c:choose>
			<c:when test="${empty sessionScope.userId}">
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> Connect <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="login.jsp"> Sign in </a></li>
								<li><a href="join.jsp"> Sign up </a></li>
							</ul></li>
					</ul>
				</div> 
			</c:when>
		</c:choose>
		<!-- soyoung ?? -->
		<!-- ?�기?? if�? id 값이 ?�으�? 발동?�게 ?�다 -->
		<!-- soyoung ?�작 -->
		<c:choose>
			<c:when test='${session.id!=null }'>
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">?�원관�?<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="logoutAction.jsp">로그?�웃</a></li>
							</ul></li>
					</ul>
				</div>
			</c:when>
		</c:choose>
		<!-- soyoung ?? -->
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
				<!-- choose one ?�나 all random?? ?�르�? 바로 각각?? ?�션?�로 가?? 로그?�여부�? ?�인?�고
						비회?�이�? ?�려보낸?? -->
				<div class="dropdown">
					<a class="btn btn-default btn-lg dropdown-toggle pull-left"
						href="Choose.jsp" role="button"> Choose one</a>
					<div class="container">
						<a class="btn btn-default btn-lg pull-right" href="result.jsp"
							role="button">All random</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>