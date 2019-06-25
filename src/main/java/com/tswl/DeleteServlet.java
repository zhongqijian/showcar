package com.tswl;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String car_name = String.valueOf(request.getParameter("car_name"));
		try {
			//数据库连接
			Connection conn = null;
			conn = DBconnection.getConnection(conn);
			// 添加图书信息的SQL语句
			String sql = "delete from reg_car where car_name=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, car_name);
			ps.executeUpdate();
			ps.close();
			DBconnection.close(conn, null, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("FinServlet");
	}
}