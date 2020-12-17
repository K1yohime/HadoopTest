package com.bxk.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;


import com.demo.dao.LineDao;
import com.demo.dao.LineDaoImpl;
import com.demo.entity.LINE;

import com.demo.dao.RadarDao;
import com.demo.dao.RadarDaoImpl;
import com.demo.entity.RADAR;

import com.demo.dao.HeatmapDao;
import com.demo.dao.HeatmapDaoImpl;
import com.demo.entity.HEATMAP;

import com.demo.dao.StackedlineDao;
import com.demo.dao.StackedlineDaoImpl;
import com.demo.entity.STACKEDLINE;

import com.demo.dao.BaidumapDao;
import com.demo.dao.BaidumapDaoImpl;
import com.demo.entity.BAIDUMAP;

/**
 * Servlet implementation class EmpServlet
 */
@WebServlet("/EmpServlet")
public class EmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//2 dispatch redict
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		LineDao lineDao =  new LineDaoImpl();
		RadarDao radarDao =  new RadarDaoImpl();
		HeatmapDao heatmapDao =  new HeatmapDaoImpl();
		StackedlineDao stackedlineDao = new StackedlineDaoImpl();
		BaidumapDao baidumapDao = new BaidumapDaoImpl();
		
		String param = request.getParameter("param");
		if("line".equals(param)){
			List<LINE> linelist= lineDao.queryAllLINE();
			String linejson = JSON.toJSONString(linelist,true);
			response.getWriter().write(linejson);
		}else if("radar".equals(param)){
			
			String username =request.getParameter("username");
			
			System.out.println("wqdwdq"+username);
			List<RADAR> radarlist=null;
			String radarjson ="";
			if("".equals(username)||null==username){
				radarlist= radarDao.queryAllRADAR();
				radarjson = JSON.toJSONString(radarlist,true);
			}else{
				username = new String(request.getParameter("username").getBytes("ISO-8859-1"), "utf-8");
				radarlist= radarDao.queryAllRADARByName(username);
				System.out.println(radarlist);
				radarjson = JSON.toJSONString(radarlist,true);
			}
			//radarjson = JSON.toJSONString(radarlist,true);
			response.getWriter().write(radarjson);
		}else if("heatmap".equals(param)){
			List<HEATMAP> heatmaplist= heatmapDao.queryAllHEATMAP();
			String heatmapjson = JSON.toJSONString(heatmaplist,true);
			response.getWriter().write(heatmapjson);
		}else if("stackedline".equals(param)){
			List<STACKEDLINE> stackedlinelist= stackedlineDao.queryAllSTACKEDLINE();
			String stackedlinejson = JSON.toJSONString(stackedlinelist,true);
			response.getWriter().write(stackedlinejson);
		}else if("baidumap".equals(param)){
			List<BAIDUMAP> baidumaplist= baidumapDao.queryAllBAIDUMAP();
			String baidumapjson = JSON.toJSONString(baidumaplist,true);
			response.getWriter().write(baidumapjson);
//			//
//		}else if
	
		//request.setAttribute("emplist", list);
		
		}
		
	}

}
