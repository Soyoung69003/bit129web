<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head><title>?μ›κ°€?? ?μ΄μ§€</title></head>
<body>
<form name="joinform" action="${contextPath }./MemberJoinAction.me" method="post">
	<table align="center" border=1>
		<tr>
			<td colspan="2" align=center><b><font size=5> ?μ›κ°€?? ?μ΄μ§€</font></b></td>			
		</tr>
		<tr><td>?„μ΄??</td><td><input type="text" name="MEMBER_ID"></td></tr>
		<tr><td>λΉ„λ?λ²νΈ</td><td><input type="text" name="MEMBER_PW"></td></tr>
		<tr><td>?΄λ¦„</td><td><input type="text" name="MEMBER_NAME"></td></tr>
		<tr><td>?΄λ©”?? μ£Όμ†:</td><td><input type="text" name="MEMBER_EMAIL" size=30></td></tr>
		<tr>
			<td colspan="2" align=center>
				<a href="javascript:joinform.submit()">?μ›κ°€??</a> &nbsp;&nbsp;
				<a href="javascript:joinform.reset()">?¤μ‹?‘μ„±</a>				
			</td>
		</tr>								
	</table>

</form>
</body>
</html>