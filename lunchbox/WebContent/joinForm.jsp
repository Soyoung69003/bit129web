<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head><title>?�원가?? ?�이지</title></head>
<body>
<form name="joinform" action="${contextPath }./MemberJoinAction.me" method="post">
	<table align="center" border=1>
		<tr>
			<td colspan="2" align=center><b><font size=5> ?�원가?? ?�이지</font></b></td>			
		</tr>
		<tr><td>?�이??</td><td><input type="text" name="MEMBER_ID"></td></tr>
		<tr><td>비�?번호</td><td><input type="text" name="MEMBER_PW"></td></tr>
		<tr><td>?�름</td><td><input type="text" name="MEMBER_NAME"></td></tr>
		<tr><td>?�메?? 주소:</td><td><input type="text" name="MEMBER_EMAIL" size=30></td></tr>
		<tr>
			<td colspan="2" align=center>
				<a href="javascript:joinform.submit()">?�원가??</a> &nbsp;&nbsp;
				<a href="javascript:joinform.reset()">?�시?�성</a>				
			</td>
		</tr>								
	</table>

</form>
</body>
</html>