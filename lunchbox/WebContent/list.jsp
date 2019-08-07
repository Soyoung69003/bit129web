<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content=Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">

<title> list </title>
</head>
<body>

<div align="right">
    <!-- Login 검증 -->
    <!-- jstl의 if문은 else가 없어서 따로 검증해야함. -->
    <c:if test="${id != null}">
      <%-- <%@include file="loginOk.jsp" %> --%>
    </c:if>
    <c:if test="${id == null}">
      <%-- <%@include file="login.jsp" %> --%>
    </c:if>
  </div>

	<!-- choose 액션으로 가서 id값을 대조하고 id값을 가져오지 않은 상태면 로그인하라고 알려주고 메인화면으로 돌려보낸다 -->
	
	
	<nav class="navbar navbar-default">
		<div class="navbar-hearder">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-taget="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				</button>
				<a class="navbar-brand" href="main.jsp"> LUNCH BOX </a>
		</div>
		
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="main.jsp"> Main </a></li>
					<li><a href="result.jsp"> Result </a></li>
					<li class = "active"><a href="list.jsp"> List </a></li>
					
					
			</ul>
			
			
			
			
			
			
	
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Disconnect<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp"> Log out </a></li>
						
					</ul>
				</li>
			</ul>
		</div>
	</nav>


   <div class="container">
      <div class="row">
         <table class="table table-striped" style="text-align: center; border; 1px solid #dddddd">
               <tr>
                  <th style="background-color: #eeeeee; text-align: center;">번호</th>
                  <th style="background-color: #eeeeee; text-align: center;">제목</th>
                  <th style="background-color: #eeeeee; text-align: center;">작성자</th>
                  <th style="background-color: #eeeeee; text-align: center;">작성일</th>
               </tr>
               
            <tbody>
               <tr>
                  <td>$"{ 3 }"</td>
                  <td>$"{ Board.BOARD_TITLE }"</td>    
                  <td>$"{ 4 }"</td>
                  <td>$"{ 5 }"</td>    
               </tr>
               <!-- <tr>
                  <td>9999</td>
                  <td>안녕하세요.</td>
                  <td>홍길동</td>
                  <td>2017-05-04</td>
               </tr> -->
            </tbody>
         </table>
         
            <a href="BBS.jsp?myPage=" class = "btn btn-primary">이전</a>
         
            <a href = "BBS.jsp?myPage=" class = "btn btn-primary"> <!-- 1페이지 -->
               <span style= "text-decoration: underline;"></span>
            </a>
         
            <a href = "BBS.jsp?myPage=" class = "btn btn-primary"></a> <!-- 나머지페이지 -->
            <a href = "BBS.jsp?myPage=" class = "btn btn-primary"> 다음 </a>
         
         
         <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
      </div>
   </div>



	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>


