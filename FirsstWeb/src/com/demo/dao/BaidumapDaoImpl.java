package com.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.demo.entity.BAIDUMAP;
import com.demo.util.MySqlUtil;

public class BaidumapDaoImpl implements BaidumapDao{
	Connection con = null;
	BAIDUMAP baidumap = null;
	PreparedStatement pre = null;
	ResultSet rs = null;
	@Override
	public List<BAIDUMAP> queryAllBAIDUMAP() {
		con=MySqlUtil.getConnection();//
		List list=new ArrayList();//
		String sql="select * from BAIDUMAP2";
		try {
			pre=con.prepareStatement(sql);
			rs=pre.executeQuery();
			while(rs.next()){			
				String name = rs.getString("NAME");
				int value = rs.getInt("BALUE");
				baidumap=new BAIDUMAP(name,value);
				list.add(baidumap);
				
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
