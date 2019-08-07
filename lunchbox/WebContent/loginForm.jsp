<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content=Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">

<title> ?? ?? �? ?? ! </title>
</head>
<body>
   <!-- choose ?�션?�로 가?? id값을 ?�조하�? id값을 가?�오지 ?��? ?�태�? 로그?�하?�고 ?�려주고 메인?�면?�로 ?�려보낸?? -->
  <!--  ?�기?�는 ?�션?? userid값이 존재?�면 불러?�다 -->
  
   <!-- soyoung ?�작 -->
<c:choose>
	<c:when test="${session.id!=null }">
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

         <!-- ?�기?? if�? id 값이 ?�으�? 발동?�게 ?�다 -->
         <!-- soyoung ?�작 -->
<c:choose>
	<c:when test="${session.id!=null }">
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
</c:when>
</c:choose>   
<!-- soyoung ?? -->
   </nav>
   
   <div class="container">
      <div class="col-lg-4"></div>
      <div class="col-lg-4">
         <div class="jumbotron" style="margin: 100px 25px 15px 0px">
          <form name="loginform" action="./MemberLoginAction.me" method="post">
               <h3 style="text-align: center;">Sign in</h3>
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="?�이?��? ?�력?�세??" name="MEMBER_ID" >
               </div>
               <div class="form-group">
                  <input type="password" class="form-control" placeholder="비�?번호�? ?�력?�세??" name="MEMBER_PWD" >
               </div>
               <input type="submit" class="btn btn-primary form-control" value="Sign in"/>
            </form>
         </div>
      </div>
   </div>
   
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="js/bootstrap.js"></script>
</body>
</html>

