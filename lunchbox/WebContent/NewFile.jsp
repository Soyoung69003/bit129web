<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Core Tag Library, prefix(접두사), jstl jar를 추가해줘야 한다. -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BBS List</title>
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
 
  <div align="center">
    <b>글목록(전체 글:${totalCount})</b>
    <table width="700">
      <tr>
        <td align="right" >
           <a href="/bbs/writeForm.bbs">글쓰기</a>
           <%-- <a href="/bbs/writeForm.bbs?pageNum=${pageNum}">글쓰기</a> --%>
        </td>
      </tr>
    </table>
   
    <table border="2" width="700">
      <tr>
        <th width="50">번호</th>
        <th width="250">제목</th>
        <th width="100">작성자</th>
        <th width="150">작성일</th>
        <th width="50">조회</th>
      </tr>
      <c:forEach var="article" items="${articles}" varStatus="status">
        <tr align="center" height="30">
          <td>${article.articleNumber}</td>
          <td align="left">
            <c:if test="${article.depth > 0}">
              &nbsp;&nbsp;
              <!-- 공백 이미지 -->
              <%-- <img src="" width="${10 * article.depth}" height="16"> --%>
            </c:if>
            <%-- <c:if test="${article.depth == 0}">
              <img src="" width="0" height="16">
            </c:if> --%>
            <a href="">${article.title}</a>
            <!-- URL query의 파라미터들은 request에 자동으로 심어지는 듯 하다. -->
            <%-- <a href="/bbs/content.bbs?articleNumer=${article.articleNumber}&pageNum=${pageNum}">${article.title}</a> --%>
            <c:if test="${article.hit >= 20}">
              hit!
              <!-- 조회수 이미지 -->
              <!-- <img src="" border="0" height="16"> -->
            </c:if>
          </td>
          <td>${article.id}</td>
          <td>${article.writeDate}</td>
          <td>${article.hit}</td>
        <tr>
      </c:forEach>
       
      <!-- Paging 처리 -->
      <tr>
        <td colspan="5" align="center" height="40">
          <%-- ${pageCode} --%>
        </td>
      </tr>
    </table>
  </div>
</body>
</html>


