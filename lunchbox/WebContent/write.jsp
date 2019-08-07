<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content=Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">

<title> ?? ?? �? ?? ! </title>
</head>
<body>
	<!-- choose ?�션?�로 가?? id값을 ?�조하�? id값을 가?�오지 ?��? ?�태�? 로그?�하?�고 ?�려주고 메인?�면?�로 ?�려보낸?? -->
	<% // ?�기?�는 ?�션?? userid값이 존재?�면 불러?�다
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
		
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="Choose.jsp"> Choose </a></li>
					<li><a href="random.jsp"> All random </a></li>
					<li><a href="result.jsp"> Result </a></li>
					<li class = "active"><a href="write.jsp"> Bus making </a></li>
					
				
					
					
					
			</ul>
			
			
			
			
			
			
			<!-- ?�기?? if�? id 값이 ?�으�? 발동?�게 ?�다 -->
	
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
      <div class="col-lg-4"></div>
      <div class="col-lg-4">
         <div class="jumbotron" style="padding-top: 20px;">
            <form method="post" action="joinAction.jsp">
               <h2 style="text-align: center;">Bus making</h2>
            
               <div class="form-group">
                  Name <input type="text" class="form-control"  name="userID"  readonly>
               </div>
               <div class="form-group">
                  Bus stop<input type="text" class="form-control" name="Busstop"  readonly>
               </div>
               <div class="form-group">
                 Main menu<input type="text" class="form-control" name="Mainmenu"readonly>
               </div>
               <div class="form-group" style="text-align: center;">
               </div>
               <div class="form-group">
                  <textarea name="memo" cols="30" rows="8">
                  </textarea>
               </div>
               <input type="submit" class="btn btn-primary form-control" value="submit"  onclick="return confirm('부릉�?�??')" >
              
            </form>
      
      
         </div>
      </div>
   </div>

	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>


