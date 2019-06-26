package com.tswl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String car_name=String.valueOf(request.getParameter("car_name"));
		String load_time=String.valueOf(request.getParameter("load_time"));
		
		try {
			//数据库连接
			Connection conn = null;
			conn = DBconnection.getConnection(conn);
			// 添加图书信息的SQL语句
			String sql = "update reg_car set load_time=? where car_name=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, load_time);
			ps.setString(2, car_name);
			ps.executeUpdate();
			ps.close();
			DBconnection.close(conn, null, null);
		}catch(Exception e) {
			System.out.print("更新失败");
			e.printStackTrace();
		}
		response.sendRedirect("FinServlet");
	}
}