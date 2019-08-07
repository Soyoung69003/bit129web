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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyAbpTyWwMkZjIUQYnT0PkgzIRP60_XcqtM" ></script>
<style>
#map_ma {width:300px; height:300px; clear:both; border:solid 1px red;}
</style>
</head>
<body>
	수정1
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
				<li><a href="Choose.jsp"> Choose </a></li>
				<li><a href="result.jsp"> result </a></li>
				<li class="active"><a href="content.jsp"> Content </a></li>





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
		<h2>Target</h2>
		<img src="images/1.jpg" class="img-rounded" alt="Cinque Terre"
			width="700" height="500">
	</div>
	
	<div id="map_ma"></div>
<script type="text/javascript">
		$(document).ready(function() {
			var myLatlng = new google.maps.LatLng(35.837143,128.558612); // 위치값 위도 경도
	var Y_point			= 35.837143;		// Y 좌표
	var X_point			= 128.558612;		// X 좌표
	var zoomLevel		= 18;				// 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
	var markerTitle		= "대구광역시";		// 현재 위치 마커에 마우스를 오버을때 나타나는 정보
	var markerMaxWidth	= 300;				// 마커를 클릭했을때 나타나는 말풍선의 최대 크기

// 말풍선 내용
	var contentString	= '<div>' +
	'<h2>대구남구</h2>'+
	'<p>안녕하세요. 구글지도입니다.</p>' +
	
	'</div>';
	var myLatlng = new google.maps.LatLng(Y_point, X_point);
	var mapOptions = {
						zoom: zoomLevel,
						center: myLatlng,
						mapTypeId: google.maps.MapTypeId.ROADMAP
					}
	var map = new google.maps.Map(document.getElementById('map_ma'), mapOptions);
	var marker = new google.maps.Marker({
											position: myLatlng,
											map: map,
											title: markerTitle
	});
	var infowindow = new google.maps.InfoWindow(
												{
													content: contentString,
													maxWizzzdth: markerMaxWidth
												}
			);
	google.maps.event.addListener(marker, 'click', function() {
		infowindow.open(map, marker);
	});
});
		</script>

	<div class="container">
		<div style="margin: 30px 25px 15px 0px">
			<div class="jumbotron">
				<div class="maximum" style="margin: -20px 25px 15px 0px">여기는
					참가자 이미지</div>
				<div class="input-group" role="group" aria-label="..." style="margin-top: 10px; width: 100%;">
				
				
				
				
    <!-- <textarea cols="88" rows="3" class="form-control"  id="commentContent" placeholder="댓글을 입력하세요."> -->
   <textarea cols="88" rows="3" placeholder="댓글을 입력하세요.">
    </textarea>
    <div class="btn-group btn-group-lg" role="group" aria-label="..."  a>
       <%--  <c:if test="${id == null}">
            <input type="button" class="btn btn-default" value="댓글 쓰기" disabled="disabled"onclick="getComment(1, event)">
        </c:if>
        <c:if test="${id != null}"> --%>
            <input type="button" class="btn btn-warning" value="댓글 쓰기" id="commentWrite"onclick="getComment(1, event)"
            style="margin: -25px 25px 15px 0px">
        <%-- </c:if> --%>
       <%--  <input type="button" class="btn btn-default" value="댓글 읽기(${article.commentCount})" 
                onclick="getComment(1, event)" id="commentRead"> --%>
    </div>
    
    
    
    
    
 
<!-- Comment 태그 추가 -->
<div class="input-group" role="group" aria-label="..." style="margin-top: 10px; width: 100%;">
    <div id="showComment" style="text-align: center;"></div>
</div>
			</div>
		</div>
	</div>




	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>


