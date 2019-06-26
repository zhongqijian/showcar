package com.tswl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class DBconnection {
	private static Properties prop;
	static {
		prop = new Properties();
		try {
			prop.load(DBconnection.class.getClassLoader().getResourceAsStream("db.properties"));
			Class.forName(prop.getProperty("driver"));
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	//
	public static Connection getConnection(Connection conn) {
		if (conn == null) {
			try {
				conn = DriverManager.getConnection(prop.getProperty("url"), prop.getProperty("username"),
						prop.getProperty("password"));
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
		return conn;
	}

	//
	public static void close(Connection conn, PreparedStatement prep, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				rs = null;
			}
		}
		if (prep != null) {
			try {
				prep.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				prep = null;
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				conn = null;
			}
		}
	}
	// 定义数据库连接的方法
	/**
	public static void main(String[] args) {
		Connection conn = null;
		conn = DBconnection.getConnection(conn);
		System.out.println(conn);
		DBconnection.close(conn, null, null);
	}
	*/
}