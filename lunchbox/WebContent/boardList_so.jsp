<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="lunchbox.model.member.MemberVO"%>
<%@page import="java.util.List"%>
<%
	String id=null;
	if(session.getAttribute("id")!=null){
		id=(String)session.getAttribute("id");
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>�α��� ����~ </h2>
<table>
<tr align="right">
		<td colspan="5">
			<%if(id!=null && id.equals("admin")){%>
				<a href="./MemberListAction.me">[ȸ������]</a>
			<%}%>
	   		<a href="./BoardWrite.me">[�۾���]</a>
	   		<a href="./BoardListAction.do">[�Խ��� �׽�Ʈ]</a>
		</td>
	</tr>
</table>
</body>
</html>