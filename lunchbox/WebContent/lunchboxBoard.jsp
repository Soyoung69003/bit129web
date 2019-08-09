<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="lunchbox.model.board.*"%>
<%@ page import="lunchbox.board.action.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="id" value="${id }" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content=Type" content="text/html; charset = UTF-8">
<meta name="viewport" content="width=device-width , initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
	var request = new XMLHttpRequest();
	function searchFunction() {
		request.open("Post", "./BoardSearchServlet.aj?boardTitle=" + encodeURIComponent(document.getElementById("boardTitle").value), true);
		request.onreadystatechange = searchProcess;
		request.send(null);
	}
	
	function searchProcess() {
		var table = document.getElementById("ajaxTable");
		table.innerHTML = "";
		if(request.readyState == 4 && request.status == 200) {
			var object = eval('(' + request.responseText + ')');
			var result = object.result;
			console.log(object);
			console.log(result);
			for (var i = 0; i < result.length; i++) {
				var row = table.insertRow(0);
				for (var j = 0; j < result[i].length; j++) {
					var cell = row.insertCell(j); 
					cell.innerHTML  = result[i][j].value
			
				}
			}
		}
	}
	
</script>
<title>LunchboxBoard</title>
</head>
<c:if test="${empty id }">
</c:if>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-hearder">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle=collapse data-taget="#bs-example-navbar-collapse-1"
				aria-expanded="false"></button>
			<a class="navbar-brand" href="main.jsp"> LUNCHBOX </a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="RestoListAction.bo"> Launch </a>
				<li class="active"><a href="./BoardListAction.bo"> Bus </a></li>
			</ul>
			<c:choose>
				<c:when test="${empty id }">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Connect<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="loginForm.jsp">Sign in</a></li>
								<li><a href="joinForm.jsp">Sign up</a></li>
							</ul></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Member<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="./MemberLogoutAction.me">Sign out</a></li>

							</ul></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="form-group row pull-right">
				<div class="col-xs-8">
					<input class="form-control" id="boardTitle" onkeyup="searchFunction()" type="text" size="20">
				</div>
				<div class="col-xs-2">
					<button class="btn btn-primary" onclick="searchFunction();" type="button">검색</button>
				</div>
			</div>
			<table class="table table-striped" style="text-align: center;">
				<thread>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">번호</th>
					<th style="background-color: #eeeeee; text-align: center;">가게이름</th>
					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center;">현황</th>
				</tr>
				</thread>
				<tbody id="ajaxTable">
					<c:forEach items="${ boardlist }" var="vo">
						<tr>
							<td>${ vo.BOARD_NUM }</td>
							<td><a
								href="BoardDetailAction.bo?boardNum=${ vo.BOARD_NUM }&myPage=${ page }">
									${ vo.BOARD_TITLE }</a></td>
							<td>${ vo.BOARD_ID }</td>
							<td>${ vo.BOARD_PRESENT }/ ${ vo.BOARD_MAXPRESENT }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${ page <= 1}">
				<div class="btn btn-primary">이전</div>
			</c:if>
			<c:if test="${ page > 1}">
				<a href="BoardListAction.bo?page=${ page - 1 }"
					class="btn btn-primary">이전</a>
			</c:if>
			<c:forEach var="i" begin="${ startpage }" end="${ endpage }">
				<c:choose>
					<c:when test="${ i == page }">
                  ${ i }
               </c:when>
					<c:otherwise>
						<a href="./BoardListAction.bo?page=${ i }">${ i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${ page >= maxpage }">
				<div class="btn btn-primary">다음</div>
			</c:if>
			<c:if test="${ page < maxpage }">
				<a href="BoardListAction.bo?page=${ page + 1 }"
					class="btn btn-primary">다음</a>
			</c:if>

			<%-- <c:if test="${empty id }">
         <a href="loginForm.jsp" class="btn btn-primary pull-right">글쓰기</a>
         </c:if>
         <c:if test="${not empty id }">
         <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
         </c:if> --%>
		</div>
		<marquee scrollamount="80" style="margin-top: 50px">
		<img alt="부르릉" src="images/bus.jpg" height="150" width="300">
		</marquee>
	</div>
</body>
</html>