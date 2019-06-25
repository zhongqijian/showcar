<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.net.*"%>
<%@ page import="com.tswl.GetMac"%>
<%@ page import="com.tswl.DBconnection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.List"%>
<%@ page import="com.tswl.MacAddress"%>
<%@ page import="com.tswl.CheckLogin"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="https://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<title>排队信息登记</title>
</head>
<body>
	<%
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		String today = df.format(date);
	%>
	<%
		//获取IP地址
		//GetMac aa = new GetMac();
		//String client_mac = aa.getmac(null);
	%>
	
	<div data-role="page">
		<div data-role="header">
			<h1>车辆信息登记</h1>
		</div>
		<table align="center" width="100%" cellpadding="1">
			<tr align="center" bgcolor="#e1ffc1">
				<td><a href="addcar.jsp">新增排队车辆</a></td>
			</tr>
			<tr align="center" bgcolor="#e1ffc1">
				<td height="20"></td>
			</tr>
			<tr align="center" bgcolor="#e1ffc1">
				<td height="20"></td>
			</tr>
			<tr align="center" bgcolor="#e1ffc1">
				<td height="20"></td>
			</tr>
			<tr align="center" bgcolor="#e1ffc1">
				<td height="20"></td>
			</tr>
		<%
			//获取IP地址
			GetMac aa = new GetMac();
			String client_mac = aa.getmac(null);
			String resulturl = null;
			CheckLogin mac = new CheckLogin(client_mac);
			//判断返回值
			if(mac.CheckLogin()){
				resulturl="addcar.jsp";
			}else{
				resulturl="warning.jsp";
			}
		%>
			<tr align="center" bgcolor="#e1ffc1">
				<td><a href=<%=resulturl%>>修改装货时间</a></td>
			</tr>
		</table>
		<div data-role="footer">
			<h1>合庆仓库车辆登记</h1>
			<h2>
			<td><a href="index.jsp">返回主页</a></td>
		</div>
	</div>
</body>
</html>
