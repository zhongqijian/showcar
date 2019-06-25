<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 导入java.sql包 --%>
<%@ page import="java.sql.*"%>
<%@ page import="com.tswl.DBconnection"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta http-equiv="refresh" content="10">
<title>备货信息</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<style>
.page-head {
	text-align: center;
}

.content {
	display: flex;
}

.table-box {
	position: relative;
	flex: 1;
	height: 100%;
}

.table-content {
	overflow: auto;
	height: 100%;
}

.table-content .table {
	margin-bottom: 0;
}

.table-content::-webkit-scrollbar {
	display: none;
}

.table-head {
	overflow: hidden;
	position: absolute;
	top: 0;
	left: 0;
	background: #fff;
	width: 100%;
}

.table-title {
	text-align: center;
}

.table-box .table th, .table-box .table td {
	vertical-align: middle;
	white-space: nowrap;
}

.complete-table {
	margin: 0 5px;
}
</style>
</head>

<body>
	<!-- 连接数据库 -->
	<%
	//数据库连接
	Connection conn = null;
	conn = DBconnection.getConnection(conn);
	%>
	<h1 class="page-head">仓库排队情况</h1>
	<div class="content">
		<!-- 排队车辆顺序表 start -->
		<div class="table-box">
			<div class="table-content">
				<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th class="table-title" colspan="4">排队车辆顺序表</th>
						</tr>
						<tr>
							<th car_name="title">车牌号</th>
							<th reg_time="title">登记时间</th>
							<th load_time="title">预计装货</th>
							<th remarks="title">备注</th>
						</tr>
					</thead>
					<tbody>
						<!-- 获取列表信息 -->
						<%
							//登记信息部分的连接信息，带1的为登陆表的连接信息
							Statement stmt = null;
							ResultSet rs = null;
							String sql = "SELECT * FROM reg_car ORDER BY reg_time;"; //查询语句
							stmt = conn.createStatement();
							rs = stmt.executeQuery(sql);
							while (rs.next()) {
						%>
						<tr>
							<td><%=rs.getString("car_name")%></td>
							<td><%=rs.getString("reg_time")%></td>
							<td><%=rs.getString("load_time")%></td>
							<td><%=rs.getString("remarks")%></td>
						</tr>
						<%
							}
							rs.close();
							stmt.close();
							DBconnection.close(conn, null, null);
						%>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 排队车辆顺序表 end -->
	</div>
<script>
    var docEl = document.documentElement;
    var tableBoxes = docEl.querySelectorAll('.table-box');
    var clientHeight = docEl.clientHeight;
    var content = docEl.querySelector('.content');
    var offsetTop = content.offsetTop;
    tableBoxes.forEach(function (tableBox) {
      var tableContent = tableBox.querySelector('.table-content');
      var table = tableContent.querySelector('table');
      var clone = table.cloneNode(true);
      var headHeight = table.querySelector('thead').clientHeight;
      var tableHead = document.createElement('div');
      var tBody = table.querySelector('tbody');
      var bodyClone = tBody.cloneNode(true);
      tableBox.style.height = clientHeight - offsetTop + 'px';
      var contentHeight = tableContent.clientHeight;
      var tableHeight = table.clientHeight;
      var clonetrs = bodyClone.querySelectorAll('tr');
      var trs = tBody.querySelectorAll('tr');
      var lasttr = trs[trs.length - 1];
      if (tableHeight > contentHeight) {
        clonetrs.forEach(function (tr) {
          tBody.appendChild(tr);
        });
      }
      tableHead.className = 'table-head';
      tableHead.style.height = headHeight + 'px';
      tableHead.appendChild(clone);
      tableBox.insertBefore(tableHead, tableBox.firstElementChild);
      var hBottom = tableHead.getBoundingClientRect().bottom;
      scroll(tableContent, lasttr, hBottom);
    });

    function scroll(content, tr, hBottom, flag) {
      // debugger;
      if (!flag) {
        var react = tr.getBoundingClientRect();
        if (react.bottom <= hBottom) {
          content.scrollTop = hBottom - react.bottom;
        }
        content.scrollTop += 1;
      }
      flag = !flag;
      requestAnimationFrame(function () {
        scroll(content, tr, hBottom, flag);
      });
    }
  </script>
</body>

</html>