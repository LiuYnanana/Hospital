package cn.ly.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Driver;

import cn.ly.dao.userDao;
import cn.ly.bean.User;

/**
 * Servlet implementation class Login
 */

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();
		if(username == "") {
			out.print("用户名不能为空！");
			return ;
		}
		if(password == "") {
			out.print("密码不能为空！");
			return ;
		}
		
		/*
		 * System.out.println(username); System.out.println(password);
		 */
		
		userDao dao = new userDao();
		User user = dao.getOneUser(username);
		if(user != null) {
			String pass = user.getPassword();
			if(pass.equals(password))
			{
				session.setAttribute("user", user);
				out.print("yes");
			}
			else
			{
				out.print("密码不正确！");
			}
		} 
		else {
			out.print("用户名密码不正确！");
		}
	}

}
