<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lunchbox.model.member.MemberVO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql_rt" %>

<c:choose>
	<c:when test='${session.id!=null }'>
		<c:set var="id" value="session.getAttribute('id')"/>
	</c:when>
</c:choose>

<%-- <%
	String id=null;
	if(session.getAttribute("id")!=null){
		id=(String)session.getAttribute("id");
	}
%>
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인 성공~ </h2>
<table>
<tr align="right">
		<td colspan="5">
				<c:out value= "${id }"/>
		<c:choose>
			<c:when test='${id!=null && id.equals("admin") }'>
				<a href="./MemberListAction.me">[회원관리]</a>
				</c:when>
		</c:choose>
			<%-- <%if(id!=null && id.equals("admin")){%>
				<a href="./MemberListAction.me">[회원관리]</a>
			<%}%> --%>
	   		<a href="./BoardWrite.bo">[글쓰기]</a>
	   		<a href="./BoardListAction.bo">게시판</a>
	   		
		</td>
	</tr>
</table>
</body>
</html>