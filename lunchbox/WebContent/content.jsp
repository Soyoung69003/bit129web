<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="lunchbox.model.resto.*"%>
<%@ page import="lunchbox.model.board.*"%>
<%@ page import="lunchbox.board.action.*"%>
<%@ page import="lunchbox.action.ajax.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="id" value="${id }" />
<c:set var="listSize" value="${listSize}" />
<!DOCTYPE html>
<html>
<head>
<!-- 댓글 -->
<script type="text/javascript">
	function check() {
		if (!reply.reply_content.value) {
			alert("내용을 입력하세요");
			reply.reply_content.focus();
			return;
		}
		if (!reply.reply_pwd.value) {
			alert("비밀번호를 입력하세요");
			reply.reply_pwd.focus();
			return;
		}
		if (!reply.reply_writer.value) {
			alert("이름을 입력하세요");
			reply.reply_writer.focus();
			return;
		}
		document.reply.submit();
	}

	var request = new XMLHttpRequest();

	var getParam = function(key) {
		var _parammap = {};
		document.location.search.replace(/\??(?:([^=]+)=([^&]*)&?)/g,
				function() {
					function decode(s) {
						return decodeURIComponent(s.split("+").join(" "));
					}

					_parammap[decode(arguments[1])] = decode(arguments[2]);
				});

		return _parammap[key];
	};


	function writeFunction() {
		var request = new XMLHttpRequest();
		request.open("Post",
				"./ContentAddAction.bo?userContent="
						+ encodeURIComponent(document
								.getElementById("userContent").value)
						+ "&boardNum="
						+ encodeURIComponent(getParam("boardNum")), true);
		request.onreadystatechange = function() {
			/*  var table = document.getElementById("ajaxTable");
			var size = ${listSize};
			table.innerHTML = "";
			if (request.readyState == 4 && request.status == 200) {
				
				
				for (var i = 0; i < size; i++) {
					
					table.innerHTML = "<tr>";
					table.innerHTML = "<td>"+ ${listSize.COMMENT_CONTENT} +"</td>";
					table.innerHTML = "<td>"+ ${listSize.COMMENT_NUM}+"</td>";
					table.innerHTML = "</tr>";
				}
			
			}  */
		};
		request.send(null);
	}

	function selectFunction() {
		var request = new XMLHttpRequest();
		request.open("Post", "./ContentSelectAction.bo?boardNum="
				+ encodeURIComponent(getParam("boardNum")), true);
		request.onreadystatechange = function() {
		/* 	var table = document.getElementById("ajaxTable");

			table.innerHTML = "";
			if (request.readyState == 4 && request.status == 200) {

				var object = eval('(' + request2.responseText + ')');
				var result = object.result;
				for (var i = 0; i < result.length; i++) {
					var row = table.insertRow(0);
					for (var j = 0; j < result[i].length; j++) {
						var cell = row.insertCell(j);
						cell.innerHTML = result[i][j].value

					}
				}
			}*/
		}; 
		request.send(null);
	}
</script>
<!-- 댓글 끝-->
<meta http-equiv="Content=Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">

<title>랜 덤 박 스 !</title>

<!-- 지도 임포트 와 크기조절 -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?key=AIzaSyAbpTyWwMkZjIUQYnT0PkgzIRP60_XcqtM"></script>

</head>
<body onload="selectFunction()">
	<!-- choose 액션으로 가서 id값을 대조하고 id값을 가져오지 않은 상태면 로그인하라고 알려주고 메인화면으로 돌려보낸다 -->
	<nav class="navbar navbar-default">
		<div class="navbar-hearder">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-taget="#bs-example-navbar-collapse-1"
				aria-expanded="false"></button>
			<a class="navbar-brand" href="main.jsp"> LUNCHBOX </a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="RestoListAction.bo"> Launch </a></li>
				<li class="active"><a href="content.jsp"> Content </a></li>
				<li><a href="./BoardListAction.bo"> Bus </a></li>
			</ul>

			<c:if test="${not empty id }">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Member<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="./MemberLogoutAction.me"> Sign out </a></li>
						</ul></li>
				</ul>
			</c:if>

			<c:if test="${empty id }">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Connect<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="loginForm.jsp"> Sign in </a></li>
							<li><a href="joinForm.jsp"> Sign up </a></li>
						</ul></li>
				</ul>
			</c:if>
		</div>
	</nav>
	<h2>Target</h2>

	<div class="jumbotron">
		<div class="container" style="padding: 0px 0px 0px 0px;">
			<img src="images/${ imageNum }.jpg" class="img-rounded"
				alt="Cinque Terre" width="700" height="500">
			<!-- 지도+이미지+가격표 위치 조정 -->
			<table style="float: right; margin: 0px 50px 0px 0px;">
				<tr class="align-top">
					<td>
						<!-- 지도의 위치를 지정해주는 div --> <!-- <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.520866056872!2d126
                  .97759591563705!3d37.56635083189579!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2e8d6068629%3A0xc4dfeae11354dca5!2z7Iut7JuQ7KeRIOyiheqwgeygkA!5e0!3m2!1sko!2skr!4v1565312068135!5m2!1sko!2skr" width="600" height="450" ></iframe> -->
						<iframe src="${ADDRESS0}" width="410" height="250" frameborder="2"></iframe>
					</td>
				</tr>
				<tr class="align-bottom">
					<td><textarea rows="12" cols="55" disabled="disabled">
                     ${ boardvo.BOARD_CONTENT }
                     </textarea></td>
				</tr>
			</table>
			<input type="button" id="btn" class="btn btn-primary form-control"
				value="참석">
		</div>
	</div>

	<table class="table talbe-striped" style="text-align: center;">
		<tbody id="ajaxTable">

		</tbody>
	</table>
	<div class="container">
		<input type="hidden" name="idx" value="${board.BOARD_NUM }">
		<div style="margin: 30px 25px 15px 0px">
			<div class="jumbotron">
				<textarea cols="88" rows="3" placeholder="댓글을 입력하세요."
					id="userContent"></textarea>
				<div class="btn-group btn-group-lg" role="group" aria-label="...">
					<c:if test="${empty id}">
						<input type="button" class="btn btn-default" value="댓글 쓰기"
							disabled="disabled" onclick="writeFunction()">
					</c:if>
					<c:if test="${not empty id}">
						<input type="button" class="btn btn-warning" value="댓글 쓰기"
							id="commentWrite" onclick="writeFunction();"
							style="margin: -25px 25px 15px 0px">
					</c:if>
				</div>

				<div class="row">

					<table class="table table-striped" style="text-align: center;">
						<thread>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">글</th>
							<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						</tr>
						</thread>
						<tbody id="ajaxTable">
							<c:forEach items="${commentList}" var="vo">
								<tr>
									<td>${ vo.COMMENT_CONTENT }</td>
									<td>${ vo.COMMENT_NAME }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- Comment 태그 추가 -->

				<div class="input-group" role="group" aria-label="..."
					style="margin-top: 10px; width: 100%;">
					<div id="showComment" style="text-align: center;"></div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>