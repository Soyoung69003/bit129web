<%@page import="lunchbox.model.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%BoardVO board = (BoardVO)request.getAttribute("boarddata"); %>
<html>
<head>
<title>MVC�Խ���</title>
</head>
<body>
 <!-- �Խ��� ���� -->
 <table cellpadding="0" cellspacein="0">
	<tr align="center" valign="middle">
		<td colspan="5">MVC�Խ���</td>
	</tr> 
	<tr>
		<td style="font-family:����;font-size:12" height="16">
			<div align="center">���� &nbsp;&nbsp;</div>
		</td>		
		<td style="font-family:����; font-size:12"> 
			<%=board.getBOARD_TITLE() %> 
		</td>		
	</tr>
	<tr bgcolor="ccccc">
		<td colspan="2" style="height:1px"></td>
	</tr>
	<tr>
		<td style="font-family:���� ; font-size:12">
			<div align="center">�� ��</div>
		</td>
		<td style="font-family:����; font-size:12">
			<table border=0 width=490 height=250 style="table-layout:fixed">
				<tr>
					<td valign=top style="font-family:����; font-size:12">
						<%=board.getBOARD_CONTENT() %>
					</td>
				</tr>
			</table>	
		</td>
	</tr>
	<tr bgcolor="cccccc"> <td colspan="2" style="height:1px;"></td> </tr>
	<tr> <td colspan="2">&nbsp;</td>	</tr>
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size=2>
				<a href="./BoardModify.bo?num=<%=board.getBOARD_NUM() %>">[����]</a>				
				<a href="./BoardDelete.bo?num=<%=board.getBOARD_NUM() %>">[����]</a>
				<a href="./BoardList.bo">[���]</a>				
			</font>
		</td>
	</tr>
 </table>
</body>
</html>