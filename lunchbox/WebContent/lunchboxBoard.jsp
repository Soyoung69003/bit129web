<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="lunchbox.model.board.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content=Type" content="text/html; charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">

<title>LunchboxBoard</title>
</head>
<body>

	<nav class="navbar navbar-default">
		<div class="navbar-hearder">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle=collapse " data-taget="#bs-example-navbar-collapse-1"
				aria-expanded="false"></button>
			<a class="navbar-brand" href="main.jsp"> 3 조 </a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp"> 3 조 메 인 </a>
				<li class="active"><a href="BBS.jsp"> 게 시 판 </a></li>
			</ul>
			<c:choose>
				<c:when test="${ userID == null }">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">접속하기<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="login.jsp">로그인</a></li>
								<!-- <li><a href="join.jsp">회원가입</a></li> -->
							</ul></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">회원관리<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="logoutAction.jsp">로그아웃</a></li>

							</ul></li>
					</ul>
				</c:otherwise>
			</c:choose>

		</div>
	</nav>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center;">
				<thread>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">번호</th>
					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center;">작성일</th>
				</tr>
				</thread>
				<tbody>
					<c:forEach items="${ BoardList }" var="vo">
						<tr>
							<td><c:out value="${ vo.getBOARD_NUM }" /></td>
							<td><a
								href="view.jsp?boardNum=${ vo.getBOARD_NUM }&myPage=${ page }"><c:out
										value="${ vo.getBOARD_TITLE }" /></a></td>
							<td><c:out value="${ vo.getBOARD_ID }" /><</td>
							<td><c:out value="${ vo.getBOARD_PRESENT }" /> / <c:out
									value="${ vo.getBOARD_MAXPRESENT }" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


			<c:choose>
				<c:when test=" ${ page <= 1}">
					<a href="#" class="btn btn-primary">이전</a>
				</c:when>
				<c:otherwise>
					<a href="BoardList.do?page=${ page - 1 }" class="btn btn-primary">이전</a>
				</c:otherwise>
			</c:choose>

			<c:forEach var="i" begin="${ startpage }" end="${ endpage }">
				<c:choose>
					<c:when test="${ i == page }">
						i 
					</c:when>
					<c:otherwise>
						<a href="./BoardList.do?page=${ i }">i</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:choose>
				<c:when test=" ${ page >= maxpage }">
					<a href="#" class="btn btn-primary">다음</a>
				</c:when>
				<c:otherwise>
					<a href="BoardList.do?page=${ page + 1 }" class="btn btn-primary">다음</a>
				</c:otherwise>
			</c:choose>

	

			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>