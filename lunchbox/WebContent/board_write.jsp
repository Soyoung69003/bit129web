<%@page import="lunchbox.model.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
	String id=(String)session.getAttribute("id");
	BoardVO board=(BoardVO)request.getAttribute("boarddata");
%>
<html>
<head>
	<title>MVC�Խ���</title>

</head>
<body>
<!-- �Խ��� ��� -->
<form  name="boardform" action="./BoardAddAction.bo" method="post" enctype="multipart/form-data">
<input type="hidden" name="BOARD_ID" value="<%=id %>">
<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5"> MVC�Խ���</td>
	</tr>
	<tr>
		<td style="font-family:����; font-size:12" height="16">
			<div align="center">�۾���</div>
		</td>
		<td>
			<%=id %>
		</td>
	</tr>
		<tr>
		<td style="font-family:����; font-size:12" height="16">
			<div align="center">�� ��</div>
		</td>
		<td>
			<input name="BOARD_SUBJECT" type="text" size="50" maxlength="100" value=""/>
		</td>		
	</tr>
	<tr>
		<td style="font-family:����; font-size:12" height="16">
			<div align="center">�� ��</div>
		</td>
		<td>
			<textarea name="BOARD_CONTENT" cols="67" rows="15"></textarea>			
		</td>		
	</tr>
	<tr>
		<td style="font-family:���� ; font-size:12">
			<div align="center">����÷��</div>
		</td>
		<td style="font-family:���� ; font-size:12">
			<input name="BOARD_FILE" type="file"/>
		</td>	
	</tr>
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;"></td>
	</tr>
	
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr align="center" valign="middle">
		<td colspan="5">
			<a href="javascript:boardform.submit()">[���]</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[�ڷ�]</a>			
		</td>
	</tr>
</table>
</form>
</body>
</html>