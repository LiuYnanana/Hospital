package cn.ly.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.ly.dao.*;
import cn.ly.bean.*;

/**
 * Servlet implementation class MemberFind
 */

public class MemberFind extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFind() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String s = (String)request.getParameter("departmentId");
    	hospitalDao dp = new hospitalDao();
		PrintWriter out = response.getWriter();
		 try {
			    
		    if(dp.getOneDp(s) == null) {
		    	out.print("no");
		    } else {
		    	 HttpSession session = request.getSession();
		 	    session.setAttribute("oneDp", s);
		    	out.print("yes");
		       }
			} catch (Exception e) {
				e.printStackTrace();
			}
		    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
