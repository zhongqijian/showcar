package com.tswl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MacList_feiqi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MacList_feiqi() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			//数据库连接
			Connection conn = null;
			conn = DBconnection.getConnection(conn);
			//获取Statement对象
			Statement stmt = conn.createStatement();
			//执行查询语句
			String sql = "select mac from ts_mac";
			//执行查询
			ResultSet rs = stmt.executeQuery(sql);
			//实例化一个集合
			List<MacAddress> mdlist = new ArrayList<MacAddress>();
			//将读取到的MacAddress存放到集合中
			while(rs.next()) {
				//实例化MacAddress对象
				MacAddress macaddress = new MacAddress();
				//对属性赋值
				macaddress.setMac(rs.getString("mac"));
				//macaddress.setUser(rs.getString("user"));
				mdlist.add(macaddress);	
			}
			//将mac的集合放到request中
			request.setAttribute("mdlist", mdlist);
			//关闭打开的内容
			rs.close();
			stmt.close();
			DBconnection.close(conn, null, null);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);;
	}
}