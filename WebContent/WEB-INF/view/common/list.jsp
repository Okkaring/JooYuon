<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>index.jsp</title>
	<style>
		table{border-collapse: collapse;}
		#table{border: 1px solid black; width: 80%;margin: 0 auto;}
		#table tr{border: 1px solid black;}
		#table th{text-align: center;height: 30px;background-color: yellow;}
		#table tr td{height: 30px;}
		#register_btn{width: 200px; height:50px;margin-left:550px;}
	</style>
</head>

<body>
<div>
	<h3>총 아이템 수 : ${requestScope.count} </h3>
</div>
<table id="table" >
	<tr>
		<th style = "width: 50px;"> </th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>수정/삭제</th>
	</tr>
	<c:forEach var="i" items="${requestScope.list}">
	<tr> 
		<td>${i.itemSeq}</td>
		<td><a onclick="move('detail')">${i.title}</a></td>
		<td>${i.writer}</td>
		<td>${i.regdate}</td>
		<td>
		<a onclick="move('update')">수정</a>
		/
		<a onclick="move('delete')">삭제</a>
		</td>
	</tr>
	</c:forEach>
		<tr>
		<td colspan="5">
			<div style="margin: 0 auto;width:250px;">
			<c:if test="${requestScope.prevBlock gt 0}">
			<span>
			<a onclick="list('${requestScope.startPage-1}')"> ◀ </a>&nbsp;
			</span>
			</c:if>

			<c:forEach varStatus="i" begin="${requestScope.startPage}" end="${requestScope.endPage}" step="1">
				<a onclick="list('${i.index}')">${i.index}</a> &nbsp;&nbsp;&nbsp;
			</c:forEach>
			
			<c:if test="${requestScope.nextBlock le requestScope.totalPages}">
			<span><a onclick="list('${requestScope.endPage+1}')">▶  </a></span>
			</c:if>
			</div>
		</td>
	</tr>
	
	<tr>
		<td colspan="5">
		<input id="register_btn" onclick="move('register')" type="button" value="상품 추가"/>
		</td>
	</tr>
</table> 


</body>
<script>
	alert( '${requestScope.nextBlock}'+'/'+'${requestScope.totalPages}');
	function move(cmd){
		alert('cmd'+cmd);
		location.href="${ctx}/item.action?cmd="+cmd;
	}
	function list(pageNo){
		location.href="${ctx}/item.action?cmd=list&pageNumber="+pageNo;
	}
</script>
</html>

