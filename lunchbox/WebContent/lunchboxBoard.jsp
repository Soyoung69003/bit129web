<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="lunchbox.model.board.*"%>
<%@ page import="lunchbox.board.action.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="id" value="${id }" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content=Type" content="text/html; charset = UTF-8">
<meta name="viewport" content="width=device-width , initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">

<title>LunchboxBoard</title>
</head>
<body>
   <nav class="navbar navbar-default">
      <div class="navbar-hearder">
         <button type="button" class="navbar-toggle collapsed"
            data-toggle=collapse data-taget="#bs-example-navbar-collapse-1"
            aria-expanded="false"></button>
         <a class="navbar-brand" href="main.jsp"> LUNCHBOX </a>
      </div>
      <div class="collapse navbar-collapse"
         id="bs-example-navbar-collapse-1">
         <ul class="nav navbar-nav">
            <li><a href="main.jsp"> LUNCHBOX  </a>
            <li class="active"><a href="./BoardListAction.bo"> 게 시 판 </a></li>
         </ul>
         <c:choose>
            <c:when test="${empty id }">
               <ul class="nav navbar-nav navbar-right">
                  <li class="dropdown"><a href="#" class="dropdown-toggle"
                     data-toggle="dropdown" role="button" aria-haspopup="true"
                     aria-expanded="false">접속하기<span class="caret"></span></a>
                     <ul class="dropdown-menu">
                        <li><a href="loginForm.jsp">로그인</a></li>
                        <li><a href="joinForm.jsp">회원가입</a></li>
                     </ul></li>
               </ul>
            </c:when>
            <c:otherwise>
               <ul class="nav navbar-nav navbar-right">
                  <li class="dropdown"><a href="#" class="dropdown-toggle"
                     data-toggle="dropdown" role="button" aria-haspopup="true"
                     aria-expanded="false">회원메뉴<span class="caret"></span></a>
                     <ul class="dropdown-menu">
                        <li><a href="./MemberLogoutAction.me">로그아웃</a></li>

                     </ul></li>
               </ul>
            </c:otherwise>
         </c:choose>
      </div>
   </nav>
   <div class="container">
      <div class="row">
         <table class="table table-striped" style="text-align: center;">
            <thread>
            <tr>
               <th style="background-color: #eeeeee; text-align: center;">번호</th>
               <th style="background-color: #eeeeee; text-align: center;">제목</th>
               <th style="background-color: #eeeeee; text-align: center;">작성자</th>
               <th style="background-color: #eeeeee; text-align: center;">현황</th>
            </tr>
            </thread>
            <tbody>
               <c:forEach items="${ boardlist }" var="vo">
                  <tr>
                     <td>${ vo.BOARD_NUM }</td>
                     <td><a
                        href="view.jsp?boardNum=${ vo.BOARD_NUM }&myPage=${ page }">
                           ${ vo.BOARD_TITLE }</a></td>
                     <td>${ vo.BOARD_ID }</td>
                     <td>${ vo.BOARD_PRESENT }/ ${ vo.BOARD_MAXPRESENT }</td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>
         <c:if test="${ page <= 1}">
            <div class="btn btn-primary">이전</div>
         </c:if>
         <c:if test="${ page > 1}">
            <a href="BoardListAction.bo?page=${ page - 1 }"
               class="btn btn-primary">이전</a>
         </c:if>
         <c:forEach var="i" begin="${ startpage }" end="${ endpage }">
            <c:choose>
               <c:when test="${ i == page }">
                  ${ i }
               </c:when>
               <c:otherwise>
                  <a href="./BoardListAction.bo?page=${ i }">${ i }</a>
               </c:otherwise>
            </c:choose>
         </c:forEach>
         <c:if test="${ page >= maxpage }">
            <div class="btn btn-primary">다음</div>
         </c:if>
         <c:if test="${ page < maxpage }">
            <a href="BoardListAction.bo?page=${ page + 1 }"
               class="btn btn-primary">다음</a>
         </c:if>
         
         <c:if test="${empty id }">
         <a href="loginForm.jsp" class="btn btn-primary pull-right">글쓰기</a>
         </c:if>
         <c:if test="${not empty id }">
         <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
         </c:if>
      </div>
   </div>
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="js/bootstrap.js"></script>
</body>
</html>