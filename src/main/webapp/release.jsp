<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%-- 导入java.sql包 --%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="com.tswl.DBconnection"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="https://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<title>排队号码</title>
<body>
	<%request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="car_info" class="com.tswl.ts_car_info"></jsp:useBean>
	<jsp:setProperty property="*" name="car_info"/>
	<%
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("YYYY-MM-dd HH:mm");
		String today_now = df.format(date);
	%>
	<!-- 连接数据库 -->
	<%
		try{
			Connection conn = null;
			conn = DBconnection.getConnection(conn);
			String sql="insert into reg_car(car_name,car_Driver,car_phone,reg_time)values(?,?,?,?)";
			//获取PreparedStatement
			PreparedStatement ps = conn.prepareStatement(sql);
			//设置车牌号
			ps.setString(1, car_info.getCar_name());
			//设置司机姓名
			ps.setString(2, car_info.getCar_Driver());
			//设置司机电话
			ps.setString(3, car_info.getCar_phone());
			//设置登记时间
			ps.setString(4, today_now);
			//执行更新操作，返货受影响的行数
			int row = ps.executeUpdate();
			//判断更新是否成功
			if(row >0){
				//更新信息输出
				out.print("车辆信息登记成功");
			}
			//关闭PreparedStatement,释放资源
			ps.close();
			//关闭Connection,释放资源
			DBconnection.close(conn, null, null);
		}catch(Exception e){
			out.print("信息添加失败，请核查信息重新添加");
			e.printStackTrace();
		}
	%>
	<div data-role="page">
		<div data-role="header">
			<h1>合庆仓库车辆信息入场登记</h1>
		</div>
		<table>
			<tr><td>你的车牌：<%=request.getParameter("car_name")%></td></tr>
			<tr><td>你的姓名：<%=request.getParameter("car_Driver")%></td></tr>
			<tr><td>你的电话：<%=request.getParameter("car_phone")%></td></tr>		
		</table>
		<div data-role="footer">
			<h1><a href="addcar.jsp">返回主页面</a></h1>
		</div>
	</div>
</body>
</html>