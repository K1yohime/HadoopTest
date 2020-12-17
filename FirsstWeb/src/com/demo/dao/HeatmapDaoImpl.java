package com.demo.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.demo.entity.HEATMAP;
import com.demo.entity.LINE;
import com.demo.util.MySqlUtil;

public class HeatmapDaoImpl implements HeatmapDao{
	Connection con = null;
	HEATMAP heatmap = null;
	PreparedStatement pre = null;
	ResultSet rs = null;
	@Override
	public List<HEATMAP> queryAllHEATMAP() {
	con=MySqlUtil.getConnection();//
	List list=new ArrayList();//
	String sql="select count from heatmap where year=2019 and ftype in ('传记','动作','动画','喜剧','悬疑','犯罪','科幻') GROUP BY `month`,ftype;";
	try {
		pre=con.prepareStatement(sql);
		rs=pre.executeQuery();
		while(rs.next()){			
			int count = rs.getInt("COUNT");
			heatmap=new HEATMAP(count);
			list.add(heatmap);
			
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
