package com.demo.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.demo.entity.LINE;
import com.demo.util.MySqlUtil;

public class LineDaoImpl implements LineDao{
	Connection con = null;
	LINE line = null;
	PreparedStatement pre = null;
	ResultSet rs = null;
	@Override
	public List<LINE> queryAllLINE() {
		con=MySqlUtil.getConnection();//
		List list=new ArrayList();//
		String sql="select * from LINE";
		try {
			pre=con.prepareStatement(sql);
			rs=pre.executeQuery();
			while(rs.next()){			
				int year = rs.getInt("YEAR");
				float score = rs.getFloat("SCORE");
				line=new LINE(year,score);
				list.add(line);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			MySqlUtil.closeResource(rs, pre, con);
		}
		
		return list;
		
	}
	
}
