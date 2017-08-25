<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<img src="${img}/loading.gif" alt="" />
<script>
	alert('Index Start');
	location.href="${ctx}/item.action?cmd=list&pageNumber=1";
</script>