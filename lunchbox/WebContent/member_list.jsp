<%@page import="lunchbox.model.member.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	List memberlist=(List)request.getAttribute("memberlist");
%>
<html>
<head><title>회원관리 시스템 관리자모드(회원 목록 보기)</title></head>
<body>

<table align="center" border=1 width=300>
	<tr align=center><td colspan=4>회원목록</td></tr>
	<%
	for(int i=0 ; i<memberlist.size() ; i++){ 
		MemberVO member=(MemberVO)memberlist.get(i);
	%>
	<tr align=center> 
		<td><a href="MemberViewAction.me?id=<%=member.getMEMBER_ID() %>">
					<%=member.getMEMBER_ID() %></a></td>
		<td><a href="MemberViewAction.me?id=<%=member.getMEMBER_NAME() %>">
					<%=member.getMEMBER_NAME() %></a></td>
		<td><a href="MemberViewAction.me?id=<%=member.getMEMBER_EMAIL() %>">
					<%=member.getMEMBER_EMAIL() %></a></td>
		<td><a href="MemberDeleteAction.me?id=<%=member.getMEMBER_ID() %>">
				삭제</a></td>		
	</tr>
	<%} %>
	
	<tr align = center>
		<td colspan="4"> <!-- <a href="./BoardList.bo"> --><a href="#">[게시판 이동]</a> </td>
	</tr>
</table>
</body>
</html>