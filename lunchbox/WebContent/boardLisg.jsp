<%@page import="sun.java2d.loops.Blit"%>
<%@page import="lunchbox.model.board.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@page import="lunchbox.model.member.MemberVO"%>
<%@page import="java.util.List"%>

<%
String id=null;
if(session.getAttribute("id")!=null){
	id=(String)session.getAttribute("id");
}
List boardList =(List)request.getAttribute("boardlist");
%>
<html>
<head><title>MVC게시판</title></head>
<body>
<h2>로그인 성공~ </h2>
<!-- 게시판 리스트 -->
<table width=570 border="0" cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="4">MVC게시판</td>
		<td align=right> <font size=2>글 개수 :${listcount}</font></td>
	</tr>
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt" width="8%" height="26">
			<div align="center"> 번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt" width="50%">
			<div align="center"> 제목</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt" width="14%">
			<div align="center"> 작성자</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt" width="17%">
			<div align="center"> 날짜</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt" width="11%">
			<div align="center"> 조회수</div>
		</td>				
	</tr>	
	<%
		for(int i=0 ; i<boardList.size() ; i++){
			BoardVO bl=(BoardVO)boardList.get(i);					
	%>
	<tr align="center" valign="middle" bordercolor="#333333" 
		onmouseover="this.style.backgroundColor='f8f8f8'" onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt"><%=bl.getBOARD_NUM() %></td>
		<td style="font-family:tahoma;font-size:10pt">
			<div align="left">
			<a href="./BoardDetailAction.bo?num=<%=bl.getBOARD_NUM() %>">
				<%=bl.getBOARD_TITLE() %></a></div>				
		</td>		
		<td style="font-family:Tahoma;font-size:10pt">
			<div align="center"><%=bl.getBOARD_ID() %></div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt">
			<div align="center"><%=bl.getBOARD_DATE() %></div>
		</td>
	</tr>
	<%} %>
	<%-- <tr align=center height=20>
		<td colspan=7 style=font-family.Tahoma, font-size:10pt>
			<%if(nowpage<=1){ %>	[이전] &nbsp;		
			<%}else{ %>
				<a href ="./BoardList.no?page=<%=nowpage-1%>">[이전]</a>&nbsp;
			<%} %>
			
			<%for(int a=startpage ; a<=endpage ; a++){ 
					if(a==nowpage){ %> 
						[<%=a %>]	
			   <%}else{ %>
			    <a href="./BoardList.bo?page=<%=a %>">[<%=a%>]</a>&nbsp;
			    <%} %>
			 <%} %> 
			 
			 <%if(nowpage>=maxpage){ %> [다음]
			<%}else{ %>
				<a href ="./BoardList.bo?page=<%=nowpage+1%>">[다음]</a>
			<%} %>		 
	    </td>
	</tr> --%>
	<tr align="right">
		<td colspan="5">
			<%if(id!=null && id.equals("admin")){ %>
				<a href="./MemberListAction.me">[회원관리]</a>
			<%} %>
				<a href="./BoardWrite.bo">[글쓰기]</a>
		</td>
	</tr>
</table>
</body>
</html>