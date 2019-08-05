<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content=Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">

<title> 랜 덤 박 스 ! </title>
</head>
<body>
	<!-- choose 액션으로 가서 id값을 대조하고 id값을 가져오지 않은 상태면 로그인하라고 알려주고 메인화면으로 돌려보낸다 -->
	<% // 여기서는 세션에 userid값이 존재하면 불러온다
		String userID = null;
		if(session.getAttribute("userID") != null){
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
		
			
			
			
			
			<!-- 여기는 if로 id 값이 있으면 발동하게 한다 -->
	
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
      <div class="col-lg-4"></div>
      <div class="col-lg-4">
         <div class="jumbotron" style="margin: 100px 25px 15px 0px">
            <form method="post" action="joinAction.jsp">
               <h3 style="text-align: center;">Sign in</h3>
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="아이디를 입력하세요" name="userID" minlength="6" maxlength="20">
               </div>
               <div class="form-group">
                  <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="userPassword" minlength="6" maxlength="20">
               </div>
               <input type="submit" class="btn btn-primary form-control" value="Sign in" />
      
            </form>
         </div>
      </div>
   </div>




	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>


