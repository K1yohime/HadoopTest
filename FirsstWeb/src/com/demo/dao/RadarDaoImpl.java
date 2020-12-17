package com.demo.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



import com.demo.entity.RADAR;
import com.demo.util.MySqlUtil;

public class RadarDaoImpl implements RadarDao{
	Connection con = null;
	RADAR radar = null;
	PreparedStatement pre = null;
	ResultSet rs = null;
	@Override
	public List<RADAR> queryAllRADAR() {
		con=MySqlUtil.getConnection();
		List list=new ArrayList();
		//String sql="SELECT score from radar where dname='张艺谋' limit 6";
		
//		String user = request.getParameter("value");
		
		String sql="SELECT dname,ftype,score from radar where dname='陈凯歌' AND ftype in ('爱情','动作','犯罪','恐怖','喜剧','悬疑') ORDER BY CONVERT(ftype using gbk);";
		try {
			pre=con.prepareStatement(sql);
			rs=pre.executeQuery();
			while(rs.next()){
				String dname = rs.getString("DNAME");
				String ftype = rs.getString("FTYPE");
				double score = rs.getDouble("SCORE");
				radar=new RADAR(dname,ftype,score);
				list.add(radar);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			MySqlUtil.closeResource(rs, pre, con);
		}
		
		return list;
	}
	@Override
	public List<RADAR> queryAllRADARByName(String name) {
		con=MySqlUtil.getConnection();
		List list=new ArrayList();
		//String sql="SELECT score from radar where dname='张艺谋' limit 6";
		
//		String user = request.getParameter("value");
		
		String sql="SELECT dname,ftype,score from radar where dname='"+name+"' AND ftype in ('爱情','动作','犯罪','恐怖','喜剧','悬疑') ORDER BY CONVERT(ftype using gbk);";
		try {
			pre=con.prepareStatement(sql);
			rs=pre.executeQuery();
			while(rs.next()){
				String dname = rs.getString("DNAME");
				String ftype = rs.getString("FTYPE");
				double score = rs.getDouble("SCORE");
				radar=new RADAR(dname,ftype,score);
				list.add(radar);
				
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
