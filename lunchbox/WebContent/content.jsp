<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content=Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">

<title>?? ?? ë°? ?? !</title>

<!-- ì§€?? ?„í¬?? ?€ ?¬ê¸°ì¡°ì ˆ -->
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
	<!-- choose ?¡ì…˜?¼ë¡œ ê°€?? idê°’ì„ ?€ì¡°í•˜ê³? idê°’ì„ ê°€?¸ì˜¤ì§€ ?Šì? ?íƒœë©? ë¡œê·¸?¸í•˜?¼ê³  ?Œë ¤ì£¼ê³  ë©”ì¸?”ë©´?¼ë¡œ ?Œë ¤ë³´ë‚¸?? -->
	<%
		// ?¬ê¸°?œëŠ” ?¸ì…˜?? useridê°’ì´ ì¡´ì¬?˜ë©´ ë¶ˆëŸ¬?¨ë‹¤
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



			<!-- ?¬ê¸°?? ifë¡? id ê°’ì´ ?ˆìœ¼ë©? ë°œë™?˜ê²Œ ?œë‹¤ -->

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
				<!-- ì§€??+?´ë?ì§€+ê°€ê²©í‘œ ?„ì¹˜ ì¡°ì • -->
			<table style="float: right; margin: 0px 50px 0px 0px ;" >
				<tr class="align-top">
					<td> 
							<!-- ì§€?„ì˜ ?„ì¹˜ë¥? ì§€?•í•´ì£¼ëŠ” div -->
						<div id="map_ma" style="display: inline-block;"></div>
					</td>
				</tr>
					<tr  class="align-bottom">
						<td> 
							<textarea rows="12" cols="55" disabled="disabled" >
									ê¸€?´ì´ ê¸€ ë°›ì•„?¤ê¸°
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
									128.558612); // ?„ì¹˜ê°? ?„ë„ ê²½ë„
							var Y_point = 35.837143; // Y ì¢Œí‘œ
							var X_point = 128.558612; // X ì¢Œí‘œ
							var zoomLevel = 18; // ì§€?„ì˜ ?•ë? ?ˆë²¨ : ?«ìê°€ ?´ìˆ˜ë¡? ?•ë??•ë„ê°€ ??
							var markerTitle = "?€êµ¬ê´‘??‹œ"; // ?„ì¬ ?„ì¹˜ ë§ˆì»¤?? ë§ˆìš°?¤ë? ?¤ë²„?„ë•Œ ?˜í??˜ëŠ” ?•ë³´
							var markerMaxWidth = 300; // ë§ˆì»¤ë¥? ?´ë¦­?ˆì„?? ?˜í??˜ëŠ” ë§í’? ì˜ ìµœë? ?¬ê¸°

							// ë§í’?? ?´ìš©  ?ìš©?? ?ˆë˜?”ë“¯?? ë¶€ë¶? ì¶”í›„ ?? œ ?ˆì •
							var contentString = '<div>' + '<h2>?€êµ¬ë‚¨êµ?</h2>'
									+ '<p>?ˆë…•?˜ì„¸??. êµ¬ê?ì§€?„ì…?ˆë‹¤.</p>' +

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
	<!-- ?¬ê¸° ?? ê¹Œì?ê°€ ì§€?? ì¶”í›„ ?¤í¬ë¦½íŠ¸ë¡? ??¸°ê¸? ?„ìš”?†ëŠ”ì½”ë“œ ?? œ ?ˆì •-->


	<div class="container">
		<div style="margin: 30px 25px 15px 0px">
			<div class="jumbotron">
				<div class="maximum" style="margin: -20px 25px 15px 0px">?¬ê¸°??
				
					ì°¸ê??? ?´ë?ì§€
				
				</div>
				<div class="input-group" role="group" aria-label="..." style="margin-top: 10px; width: 100%;">


					<!-- <textarea cols="88" rows="3" class="form-control"  id="commentContent" placeholder="?“ê??? ?…ë ¥?˜ì„¸??."> -->
					<textarea cols="88" rows="3" placeholder="?“ê??? ?…ë ¥?˜ì„¸??.">
					
					<%
					request.getParameter("memo");
					%>
					
    				</textarea>
    				
					<div class="btn-group btn-group-lg" role="group" aria-label="..." a>
						 <c:if test="${id == null}">
            <input type="button" class="btn btn-default" value="?“ê? ?°ê¸°" disabled="disabled"onclick="getComment(1, event)">
        </c:if>
        <c:if test="${id != null}">
						<input type="button" class="btn btn-warning" value="?“ê? ?°ê¸°"
							id="commentWrite" onclick="getComment(1, event)"
							style="margin: -25px 25px 15px 0px">
						</c:if>
						 <input type="button" class="btn btn-default" value="?“ê? ?½ê¸°(${article.commentCount})" 
                onclick="getComment(1, event)" id="commentRead">
					</div>






					<!-- Comment ?œê·¸ ì¶”ê? -->
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


