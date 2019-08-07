<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content=Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">

<title>?? ?? �? ?? !</title>

<!-- 지?? ?�포?? ?� ?�기조절 -->
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
	<!-- choose ?�션?�로 가?? id값을 ?�조하�? id값을 가?�오지 ?��? ?�태�? 로그?�하?�고 ?�려주고 메인?�면?�로 ?�려보낸?? -->
	<%
		// ?�기?�는 ?�션?? userid값이 존재?�면 불러?�다
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



			<!-- ?�기?? if�? id 값이 ?�으�? 발동?�게 ?�다 -->

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
				<!-- 지??+?��?지+가격표 ?�치 조정 -->
			<table style="float: right; margin: 0px 50px 0px 0px ;" >
				<tr class="align-top">
					<td> 
							<!-- 지?�의 ?�치�? 지?�해주는 div -->
						<div id="map_ma" style="display: inline-block;"></div>
					</td>
				</tr>
					<tr  class="align-bottom">
						<td> 
							<textarea rows="12" cols="55" disabled="disabled" >
									글?�이 글 받아?�기
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
									128.558612); // ?�치�? ?�도 경도
							var Y_point = 35.837143; // Y 좌표
							var X_point = 128.558612; // X 좌표
							var zoomLevel = 18; // 지?�의 ?��? ?�벨 : ?�자가 ?�수�? ?��??�도가 ??
							var markerTitle = "?�구광??��"; // ?�재 ?�치 마커?? 마우?��? ?�버?�때 ?��??�는 ?�보
							var markerMaxWidth = 300; // 마커�? ?�릭?�을?? ?��??�는 말풍?�의 최�? ?�기

							// 말풍?? ?�용  ?�용?? ?�되?�듯?? 부�? 추후 ??�� ?�정
							var contentString = '<div>' + '<h2>?�구남�?</h2>'
									+ '<p>?�녕?�세??. 구�?지?�입?�다.</p>' +

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
	<!-- ?�기 ?? 까�?가 지?? 추후 ?�크립트�? ??���? ?�요?�는코드 ??�� ?�정-->


	<div class="container">
		<div style="margin: 30px 25px 15px 0px">
			<div class="jumbotron">
				<div class="maximum" style="margin: -20px 25px 15px 0px">?�기??
				
					참�??? ?��?지
				
				</div>
				<div class="input-group" role="group" aria-label="..." style="margin-top: 10px; width: 100%;">


					<!-- <textarea cols="88" rows="3" class="form-control"  id="commentContent" placeholder="?��??? ?�력?�세??."> -->
					<textarea cols="88" rows="3" placeholder="?��??? ?�력?�세??.">
					
					<%
					request.getParameter("memo");
					%>
					
    				</textarea>
    				
					<div class="btn-group btn-group-lg" role="group" aria-label="..." a>
						 <c:if test="${id == null}">
            <input type="button" class="btn btn-default" value="?��? ?�기" disabled="disabled"onclick="getComment(1, event)">
        </c:if>
        <c:if test="${id != null}">
						<input type="button" class="btn btn-warning" value="?��? ?�기"
							id="commentWrite" onclick="getComment(1, event)"
							style="margin: -25px 25px 15px 0px">
						</c:if>
						 <input type="button" class="btn btn-default" value="?��? ?�기(${article.commentCount})" 
                onclick="getComment(1, event)" id="commentRead">
					</div>






					<!-- Comment ?�그 추�? -->
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


