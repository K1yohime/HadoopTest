package com.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.demo.entity.User;
import com.demo.util.MySqlUtil;

public class UserDaoImpl implements UserDao {
	Connection con = null;
	PreparedStatement pre = null;
	ResultSet rs = null;
	User user = null;
	boolean flag = false;

	public boolean addUser(User user) {
		flag = false;
		con = MySqlUtil.getConnection();
		String sql = "insert into user(name, pwd) values(?,?)";

		try {
			pre = con.prepareStatement(sql);
			pre.setString(1, user.getUsername());
			pre.setString(2, user.getPassword());
			int row = pre.executeUpdate();
			if (row > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MySqlUtil.closeResource(null, pre, con);
		}
		return flag;
	}

	public boolean checkLogin(String username, String password) {
		flag = false;
		con = MySqlUtil.getConnection();
		String sql = "select * from user where name = '" + username + "'";

		try {
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery(sql);
			while (rs.next()) {
//				String str1 = rs.getString("name");
//				String str2 = rs.getString("pwd");
//				System.out.println(str1);
//				System.out.println(str2);
				
//				if(str2 == null) {
//					System.out.println("判断条件为null");
//				}	
				
				if (rs.getString("pwd").equals(password)) {
					flag = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MySqlUtil.closeResource(rs, pre, con);
		}
		return flag;
	}
}
