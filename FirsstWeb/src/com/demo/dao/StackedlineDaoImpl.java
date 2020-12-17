package com.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.demo.entity.STACKEDLINE;
import com.demo.util.MySqlUtil;

public class StackedlineDaoImpl implements StackedlineDao{
	Connection con = null;
	STACKEDLINE stackedline = null;
	PreparedStatement pre = null;
	ResultSet rs = null;
	@Override
	public List<STACKEDLINE> queryAllSTACKEDLINE() {
		con=MySqlUtil.getConnection();//
		List list=new ArrayList();//
		String sql="select distinct year,score,ftype from stackedline where year>2010 and ftype in ('动作','动画','喜剧','悬疑','科幻')";
		try {
			pre=con.prepareStatement(sql);
			rs=pre.executeQuery();
			while(rs.next()){			
				int year = rs.getInt("YEAR");
				float score = rs.getFloat("SCORE");
				stackedline=new STACKEDLINE(year,score);
				list.add(stackedline);
				
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
