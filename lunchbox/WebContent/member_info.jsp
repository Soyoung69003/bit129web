<%@page import="lunchbox.model.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8 %>
<%MemberVO member=(MemberVO)request.getAttribute("member"); %>
<html>
<head><title>회원관리 시스템 관리자 모드(회원 정보 보기)</title></head>
<body>
<table align="center" border=1>
	<tr align=center> <td>아이디 :</td> <td><%=member.getMEMBER_ID() %></td> </tr>
	<tr align=center> <td>비밀번호 :</td><td><%=member.getMEMBER_PWD() %></td> </tr>
	<tr align=center> <td>이름 :</td><td><%=member.getMEMBER_NAME() %></td> </tr>
	<tr align=center> <td>이메일 주소 :</td><td><%=member.getMEMBER_EMAIL() %></td> </tr>
	<tr align=center> <td colspan=2><a href="MemberListAction.me">리스트로 돌아가기</a></td> </tr>	
</table>
</body>
</html>