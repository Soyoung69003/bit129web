<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content=Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">

<title>랜 덤 박 스 !</title>
</head>
<body>
	<!-- choose 액션으로 가서 id값을 대조하고 id값을 가져오지 않은 상태면 로그인하라고 알려주고 메인화면으로 돌려보낸다 -->
	<%
		// 여기서는 세션에 userid값이 존재하면 불러온다
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>


	<nav class="navbar navbar-default">
		<div class="navbar-hearder">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-taget="#bs-example-navbar-collapse-1"
				aria-expanded="false"></button>
			<a class="navbar-brand" href="main.jsp"> LUNCH BOX </a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="choose.jsp"> Choose </a></li>
				<li class="active"><a href="result.jsp"> Result </a></li>
				<li><a href="list.jsp"> list </a></li>




			</ul>






			<!-- 여기는 if로 id 값이 있으면 발동하게 한다 -->

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Disconnect<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp"> Log out </a></li>

					</ul></li>
			</ul>
		</div>
	</nav>

	<div class="container">
		<div style="margin: 100px 25px 15px 0px">
			<div class="jumbotron">
				<div id="myCarousel" class="carousel slide" data-ride="carousel"
					data-interval="false">
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active">
							<a href="content.jsp"> <img src="images/1.jpg"
								alt="첫번째 식당입니다">
							</a>
							<div class="carousel-caption">
								<h3>여기는 맛집입니다</h3>
								<p>강추</p>
							</div>
						</div>
						<div class="item">
						<a href="content.jsp">
							<img src="images/2.jpg" alt="두번째 식당입니다">
							</a>
							<div class="carousel-caption">
								<h3>여기는 평범한집입니다</h3>
								<p>걍추</p>
							</div>
						</div>
						<div class="item">
						<a href="content.jsp">
							<img src="images/3.jpg" alt="두번째 식당입니다">
							</a>
							<div class="carousel-caption">
								<h3>여기는 평범한집입니다</h3>
								<p>걍추</p>
							</div>
						</div>
						<div class="item">
						<a href="content.jsp">
							<img src="images/4.jpg" alt="두번째 식당입니다">
							</a>
							<div class="carousel-caption">
								<h3>여기는 평범한집입니다</h3>
								<p>걍추</p>
							</div>
						</div>
					</div>

					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
				<p class="text-center" style="margin: 50px 0px 0px 0px">원하는 이미지를 눌러주세요</p>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>


