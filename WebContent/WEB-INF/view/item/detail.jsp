<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>detail</title>
	<style>
		table{border-collapse: collapse;}
		#table{border: 1px solid black; width: 80%;margin: 0 auto;}
		#table tr{border: 1px solid yellow; }
		#table tr td{border: 1px solid red;}
		
	</style>
</head>
<body>
	<h1>상품 상세 페이지</h1>
	<table id="table">
		<tr>
			<td rowspan="4"> image </td>
			<td>제목</td>
			<td>제목을 넣을 것 입니다.</td>
		</tr>
		<tr>
			
			<td>판매자</td>
			<td>눈누난나</td>
		</tr>
		<tr>
			
			<td>등록일</td>
			<td>2010-05-18</td>
		</tr>
		<tr>
			
			<td>내용</td>
			<td>급팜급팜</td>
		</tr>
	</table>
	
	<input id="register_btn" onclick="move('list')" type="button" value="상품 리스트로 이동"/>
</body>
<script>
	function move(cmd){
		alert('cmd'+cmd);
		location.href="${ctx}/item.action?cmd="+cmd;
	}
</script>
</html>