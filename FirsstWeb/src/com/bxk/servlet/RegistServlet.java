package com.bxk.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.dao.UserDao;
import com.demo.dao.UserDaoImpl;
import com.demo.entity.User;

@WebServlet("/registServlet")
public class RegistServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 设置字符
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		// 转换字符串
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		// 调用UserDao、UserDaoImpl类及方法
		UserDao ud = new UserDaoImpl();
		User u = new User();

		// 添加用户提交的数据到数据库
		u.setUsername(username);
		u.setPassword(password);
		boolean flag = ud.addUser(u);

		// 处理结果跳转相应页面
		if (flag) {
			response.sendRedirect("logintest.jsp");
		} else {
			response.sendRedirect("accountstest.jsp");
		}
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}
