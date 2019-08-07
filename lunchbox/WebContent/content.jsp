<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content=Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">

<title>?? ?? ๋ฐ? ?? !</title>

<!-- ์ง?? ?ํฌ?? ? ?ฌ๊ธฐ์กฐ์  -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?key=AIzaSyAbpTyWwMkZjIUQYnT0PkgzIRP60_XcqtM"></script>
		<style>
				#map_ma {
					width: 400px;
					height: 250px;
					clear: both;
					border: solid 1px red;
				}
		</style>

</head>

<body>
	<!-- choose ?ก์?ผ๋ก ๊ฐ?? id๊ฐ์ ?์กฐํ๊ณ? id๊ฐ์ ๊ฐ?ธ์ค์ง ?์? ?ํ๋ฉ? ๋ก๊ทธ?ธํ?ผ๊ณ  ?๋ ค์ฃผ๊ณ  ๋ฉ์ธ?๋ฉด?ผ๋ก ?๋ ค๋ณด๋ธ?? -->
	<%
		// ?ฌ๊ธฐ?๋ ?ธ์?? userid๊ฐ์ด ์กด์ฌ?๋ฉด ๋ถ๋ฌ?จ๋ค
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>


	<nav class="navbar navbar-default">
		<div class="navbar-hearder">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-taget="#bs-example-navbar-collapse-1"
				aria-expanded="false">
			</button>
			<a class="navbar-brand" href="main.jsp"> LUNCH BOX </a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="Choose.jsp"> Choose </a></li>
				<li><a href="result.jsp"> result </a></li>
				<li class="active"><a href="content.jsp"> Content </a></li>
				<li><a href="list.jsp"> list </a></li>
			</ul>



			<!-- ?ฌ๊ธฐ?? if๋ก? id ๊ฐ์ด ?์ผ๋ฉ? ๋ฐ๋?๊ฒ ?๋ค -->

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
				<h2>Target</h2>
				
		<div class= "jumbotron">
	<div class="container"  style="padding:0px 0px 0px 0px;">
		<img src="images/1.jpg" class="img-rounded" alt="Cinque Terre"
			width="700" height="500">
				<!-- ์ง??+?ด๋?์ง+๊ฐ๊ฒฉํ ?์น ์กฐ์  -->
			<table style="float: right; margin: 0px 50px 0px 0px ;" >
				<tr class="align-top">
					<td> 
							<!-- ์ง?์ ?์น๋ฅ? ์ง?ํด์ฃผ๋ div -->
						<div id="map_ma" style="display: inline-block;"></div>
					</td>
				</tr>
					<tr  class="align-bottom">
						<td> 
							<textarea rows="12" cols="55" disabled="disabled" >
									๊ธ?ด์ด ๊ธ ๋ฐ์?ค๊ธฐ
							</textarea>
						</td>
					</tr>
			</table>
</div>
	</div>


	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var myLatlng = new google.maps.LatLng(35.837143,
									128.558612); // ?์น๊ฐ? ?๋ ๊ฒฝ๋
							var Y_point = 35.837143; // Y ์ขํ
							var X_point = 128.558612; // X ์ขํ
							var zoomLevel = 18; // ์ง?์ ?๋? ?๋ฒจ : ?ซ์๊ฐ ?ด์๋ก? ?๋??๋๊ฐ ??
							var markerTitle = "?๊ตฌ๊ด??"; // ?์ฌ ?์น ๋ง์ปค?? ๋ง์ฐ?ค๋? ?ค๋ฒ?๋ ?ํ??๋ ?๋ณด
							var markerMaxWidth = 300; // ๋ง์ปค๋ฅ? ?ด๋ฆญ?์?? ?ํ??๋ ๋งํ? ์ ์ต๋? ?ฌ๊ธฐ

							// ๋งํ?? ?ด์ฉ  ?์ฉ?? ?๋?๋ฏ?? ๋ถ๋ถ? ์ถํ ??  ?์ 
							var contentString = '<div>' + '<h2>?๊ตฌ๋จ๊ต?</h2>'
									+ '<p>?๋?์ธ??. ๊ตฌ๊?์ง?์?๋ค.</p>' +

									'</div>';
							var myLatlng = new google.maps.LatLng(Y_point,
									X_point);
							var mapOptions = {
								zoom : zoomLevel,
								center : myLatlng,
								mapTypeId : google.maps.MapTypeId.ROADMAP
							}
							var map = new google.maps.Map(document
									.getElementById('map_ma'), mapOptions);
							var marker = new google.maps.Marker({
								position : myLatlng,
								map : map,
								title : markerTitle
							});
							var infowindow = new google.maps.InfoWindow({
								content : contentString,
								maxWizzzdth : markerMaxWidth
							});
							google.maps.event.addListener(marker, 'click',
									function() {
										infowindow.open(map, marker);
									});
						});
	</script>
	<!-- ?ฌ๊ธฐ ?? ๊น์?๊ฐ ์ง?? ์ถํ ?คํฌ๋ฆฝํธ๋ก? ??ธฐ๊ธ? ?์?๋์ฝ๋ ??  ?์ -->


	<div class="container">
		<div style="margin: 30px 25px 15px 0px">
			<div class="jumbotron">
				<div class="maximum" style="margin: -20px 25px 15px 0px">?ฌ๊ธฐ??
				
					์ฐธ๊??? ?ด๋?์ง
				
				</div>
				<div class="input-group" role="group" aria-label="..." style="margin-top: 10px; width: 100%;">


					<!-- <textarea cols="88" rows="3" class="form-control"  id="commentContent" placeholder="?๊??? ?๋ ฅ?์ธ??."> -->
					<textarea cols="88" rows="3" placeholder="?๊??? ?๋ ฅ?์ธ??.">
					
					<%
					request.getParameter("memo");
					%>
					
    				</textarea>
    				
					<div class="btn-group btn-group-lg" role="group" aria-label="..." a>
						 <c:if test="${id == null}">
            <input type="button" class="btn btn-default" value="?๊? ?ฐ๊ธฐ" disabled="disabled"onclick="getComment(1, event)">
        </c:if>
        <c:if test="${id != null}">
						<input type="button" class="btn btn-warning" value="?๊? ?ฐ๊ธฐ"
							id="commentWrite" onclick="getComment(1, event)"
							style="margin: -25px 25px 15px 0px">
						</c:if>
						 <input type="button" class="btn btn-default" value="?๊? ?ฝ๊ธฐ(${article.commentCount})" 
                onclick="getComment(1, event)" id="commentRead">
					</div>






					<!-- Comment ?๊ทธ ์ถ๊? -->
					<div class="input-group" role="group" aria-label="..."
						style="margin-top: 10px; width: 100%;">
						<div id="showComment" style="text-align: center;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>


