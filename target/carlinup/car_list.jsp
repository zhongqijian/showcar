<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.tswl.ts_car_info"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>排队车辆列表</title>
</head>
<body>
	<script language="JavaScript">
		function check(form) {
			with (form) {
				if (load_time.value == "") {
					alert("请输入更新数量！");
					return false;
				}
				return true;
				;
			}
		}
		function del(){
			return confirm("确认删除");
		}
		
	</script>
	<%
		Date date = new Date();
		SimpleDateFormat dfload = new SimpleDateFormat("YYYY-MM-dd HH:mm");
		String todayload = dfload.format(date);
	%>
	<table align="center" width="100%" border="1"  bgcolor="black" cellpadding="1">
		<tr bgcolor="white">
			<td align="center" colspan="8">
				<h2>所有车辆信息</h2>
			</td>
		</tr>
		<tr align="center" bgcolor="#e1ffc1">
			<td><b>车牌号码</b></td>
			<td><b>登记时间</b></td>
			<td><b>预计装货</b></td>
			<td><b>修改装货时间</b></td>
			<td><b>装运完成</b></td>
		</tr>
		<%
			// 获取车辆信息集合
			List<ts_car_info> list = (List<ts_car_info>) request.getAttribute("list");
			// 判断集合是否有效
			if (list == null || list.size() < 1) {
				out.print("无排队车辆！");
			} else {
				// 遍历车辆集合中的数据
				for (ts_car_info car : list) {
		%>
		<tr align="center" bgcolor="white">
			<td><%=car.getCar_name()%></td>
			<td><%=car.getReg_time()%></td>
			<td><%=car.getLoad_time()%></td>
			<td>
				<form action="UpdateServlet" method="post"
					onsubmit="return check(this);">
					<input type="hidden" name="car_name" value="<%=car.getCar_name()%>">
					<input type="text" name="load_time" value="<%=todayload%>"
						size="18"> <input type="submit" value="修  改">
				</form>
			</td>
			<td><a href="DeleteServlet?car_name=<%=car.getCar_name()%>" onclick="return del(),this">删除</a></td>
		</tr>
		<%
			}
			}
		%>
	</table>
	<table>
		<tr>
			<td><a href="index.jsp">返回主页面</a></td>
		</tr>
	</table>
</body>
</html>