package com.tswl;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CheckLogin {
	
	private String mac;
	private boolean result;
	/**
	 * 默认无参的构造方法
	 */
	public CheckLogin(){
		
	}
	/**
	 * 构造方法
	 */
	public CheckLogin(String mac) {
		this.mac = mac;
	}
	
	/**
	 * 获取数据库的连接，读取mac信息仅对比 return true or false
	 * @return 
	 */
	
	//定义一个方法，与读取的数据库集合有进行判断
	public boolean CheckLogin() {
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
			for (MacAddress macaddress : mdlist) {
				//Contrast result
				boolean contrast = macaddress.getMac().toString().contains(mac);
				if (contrast) {
					result = true;
					break;
				} else {
					result = false;
				}
			}
			//关闭打开的内容
			rs.close();
			stmt.close();
			DBconnection.close(conn, null, null);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	//
	public String getMac() {
		return mac;
	}
	public void setMac(String mac) {
		this.mac=mac;
	}
}
