<%@page import="lunchbox.model.member.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	List memberlist=(List)request.getAttribute("memberlist");
%>
<html>
<head><title>?μκ΄λ¦? ?μ€?? κ΄λ¦¬μλͺ¨λ(?μ λͺ©λ‘ λ³΄κΈ°)</title></head>
<body>

<table align="center" border=1 width=300>
	<tr align=center><td colspan=4>?μλͺ©λ‘</td></tr>
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
				?? </a></td>		
	</tr>
	<%} %>
	
	<tr align = center>
		<td colspan="4"> <!-- <a href="./BoardList.bo"> --><a href="#">[κ²μ?? ?΄λ]</a> </td>
	</tr>
</table>
</body>
</html>