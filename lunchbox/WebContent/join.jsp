<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content=Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">

<title> ?? ?? ë°? ?? ! </title>
</head>
<body>
<!-- choose ?¡ì…˜?¼ë¡œ ê°€?? idê°’ì„ ?€ì¡°í•˜ê³? idê°’ì„ ê°€?¸ì˜¤ì§€ ?Šì? ?íƒœë©? ë¡œê·¸?¸í•˜?¼ê³  ?Œë ¤ì£¼ê³  ë©”ì¸?”ë©´?¼ë¡œ ?Œë ¤ë³´ë‚¸?? -->
	<%-- <% // ?¬ê¸°?œëŠ” ?¸ì…˜?? useridê°’ì´ ì¡´ìž¬?˜ë©´ ë¶ˆëŸ¬?¨ë‹¤
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
	
	%> --%>
	   <!-- soyoung ?œìž‘ -->
<c:choose>
   <c:when test='${session.id!=null }'>
      <c:set var="id" value="${session.id }"/>
   </c:when>
</c:choose>
   <!-- soyoung ?? -->
	
	
	
	
	
	<nav class="navbar navbar-default">
		<div class="navbar-hearder">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-taget="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				</button>
				<a class="navbar-brand" href="main.jsp"> LUNCH BOX </a>
		</div>
		
			
			
			
			
			
			
			<!-- ?¬ê¸°?? ifë¡? id ê°’ì´ ?ˆìœ¼ë©? ë°œë™?˜ê²Œ ?œë‹¤ -->
	
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"> Connect <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp"> Sign in </a></li>
						<li><a href="join.jsp"> Sign up </a></li>
					</ul>
				</li>
			</ul>
			</div>
	</nav>


<div class="container">
<div style=" margin: 100px 25px 15px 0px">
      <div class="col-lg-4"></div>
      <div class="col-lg-4">
         <div class="jumbotron" style="padding-top: 20px;">
            <form method="post" action="./MemberJoinAction.do">
               <h3 style="text-align: center;">Sign up</h3>
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="?„ì´?”ë? ?…ë ¥?˜ì„¸??" name="MEMBER_ID">
               </div>
               <div class="form-group">
                  <input type="password" class="form-control" placeholder="ë¹„ë?ë²ˆí˜¸ë¥? ?…ë ¥?˜ì„¸??" name="MEMBER_PWD" >
               </div>
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="?´ë¦„?? ?…ë ¥?˜ì„¸??" name="MEMBER_NAME" >
               </div>
               <div class="form-group">
                  <input type="email" class="form-control" placeholder="?´ë©”?¼ì„ ?…ë ¥?˜ì„¸??" name="MEMBER_EMAIL" maxlength="20">
               </div>
               <input type="submit" class="btn btn-primary form-control" value="Sign up" >
            
            </form>
      
      
      
         </div>
      </div>
      </div>
   </div>
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
   
</body>
</html>