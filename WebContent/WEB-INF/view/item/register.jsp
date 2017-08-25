<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>register</title>
	<style>
		table{border-collapse: collapse;}
		#table{border: 1px solid black; width: 80%;margin: 0 auto;}
		#table tr{border: 1px solid yellow; }
		#table tr td{border: 1px solid red;}
		#wrapper{width: 100%;}
		#register_form{width: 30%;margin: 0 auto;}
		#page_name{width: 30%;margin: 0 auto;}
		#blank{height:50px;}
	</style>
</head>
<body>
<div id="wrapper">

	<h1 id="page_name">상품 등록 페이지</h1>
	<div id ="blank"></div>
	<form id="register_form">
	<span> TITLE </span><input type="text" name= "title" id="title"  /><br />
	<span> WRITER </span><input type="text" name= "writer" id="writer"  /><br />
	<span> CONTENT </span><input type="text" name= "content" id="content"  /><br />
	
	<input type="checkbox" name="category" value="used" checked="checked"/> 중고 <br />
	<input type="checkbox" name="category" value="clothes" />의류<br />
	<input type="checkbox" name="category" value="book" />도서<br />
	<input type="checkbox" name="category" value="electronic" />전자 제품<br />
	
	<input type="hidden" name="cmd" value="add" />
	<input id="register_btn" onclick="register()" type="submit" value="상품 추가"/>
	</form>
</div>
	<div id ="blank"></div>
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
	
	
</body>
<script>
	function register(){
	var title = document.getElementById('title').value;
	var writer = document.getElementById('writer').value;
	var content = document.getElementById('content').value;
	
	if(title===""){
		alert('title을 입력하세요');
		return false;		
	}
	if(writer===""){
		alert('writer를 입력하세요');
		return false;		
	}
	if(content===""){
		alert('content를 입력하세요');
		return false;		
	}

	var form = document.getElementById('register_form');
	form.action="${ctx}/item.action";
	form.method = "get";
	return true;
	}
</script>
</html>