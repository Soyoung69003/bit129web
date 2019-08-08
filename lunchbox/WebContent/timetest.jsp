<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head><title>테스트</title></head>
<body>
<div><b>실시간 정보</b></div>
<div><p>현재 시간 : <span></span></p></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script>
$(document).ready(
		function(){
			setInterval ("updateTime()", 1000);
		});
		
function updateTime(){
	$.ajax({
		url: "/ajax/time.jsp",
		type: "get", 
		cache: false,
		success: function(data){
			$("span").html(data);
		}
	});
}
</script>
</body>
</html>