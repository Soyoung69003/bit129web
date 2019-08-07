<%@page import="lunchbox.model.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8 %>
<%MemberVO member=(MemberVO)request.getAttribute("member"); %>
<html>
<head><title>?�원관�? ?�스?? 관리자 모드(?�원 ?�보 보기)</title></head>
<body>
<table align="center" border=1>
	<tr align=center> <td>?�이?? :</td> <td><%=member.getMEMBER_ID() %></td> </tr>
	<tr align=center> <td>비�?번호 :</td><td><%=member.getMEMBER_PWD() %></td> </tr>
	<tr align=center> <td>?�름 :</td><td><%=member.getMEMBER_NAME() %></td> </tr>
	<tr align=center> <td>?�메?? 주소 :</td><td><%=member.getMEMBER_EMAIL() %></td> </tr>
	<tr align=center> <td colspan=2><a href="MemberListAction.me">리스?�로 ?�아가�?</a></td> </tr>	
</table>
</body>
</html>