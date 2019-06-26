<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tswl.GetLocalMac"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>授权信息获取</title>
</head>
<body>
	<%
		GetLocalMac getmacaddress = new GetLocalMac();
		String macaddress = getmacaddress.getMACAddr();
	%>
	<table>
		<tr>
			<td>请将以下信息发送给管理员</td>
		</tr>
		<tr>
			<td><%=macaddress%></td>
		</tr>
	</table>
</body>
</html>