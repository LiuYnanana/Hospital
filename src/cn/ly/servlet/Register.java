package cn.ly.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ly.dao.*;
import cn.ly.bean.*;

/**
 * Servlet implementation class Register
 */

public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		userDao userD = new userDao();
		PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
       
        if(userD.getOneUser(username) != null) {
        	out.print("click");	
            return ;
        }
        
        
        
		try {
			if(userD.getOneUser(username) == null) {
	        	User user = new User();
	        	 String password = request.getParameter("password");
	             String phone = request.getParameter("phone");
	             String email = request.getParameter("email");
	             
	    		user.setName(request.getParameter("username"));
	    		user.setPassword(request.getParameter("password"));
	    		user.setPhone(request.getParameter("phone"));
	    		user.setEmail(request.getParameter("email"));
	    		
	    		
	    		if(username != null && password != null && phone != null && email != null) {
					/* System.out.println("come in add!"); */
		    		userD.add(user);	
		    		out.print("yes");
	    		}
	    		
	        }	

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
