package cn.ly.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.ly.dao.hospitalDao;
import cn.ly.dao.userDao;
import cn.ly.bean.department;

/**
 * Servlet implementation class Member_add
 */

public class Member_add extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member_add() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		hospitalDao departmentD = new hospitalDao();
		department dp = new department();
		
		dp.setDepartmentName(request.getParameter("departmentname"));
		System.out.println(request.getParameter("departmentname") + "112");
		if(departmentD.getOneDp(dp.getDepartmentName()) != null) {
			out.print("exist");
			return ;
		}
		
	    try {
	    	System.out.println("Here");
	    	if(departmentD.getOneDp(dp.getDepartmentName()) == null) {
	    		String dpName = request.getParameter("departmentname");
	    		String dpNum = request.getParameter("departmentnumber");
	    		String dpDes = request.getParameter("departmentdiscription");
	    		
	    		dp.setDepartmentDescription(request.getParameter("departmentdiscription"));
	    		dp.setDepartmentNumber(request.getParameter("departmentnumber"));
	    		
	    		System.out.println(dpName + " " + dpNum + " " + dpDes);
	    		if(dpName != null && dpNum != null && dpDes != null) {
	    			departmentD.addDepartment(dp);
	    			out.print("yes");
	    		}
	    	}
		} catch (Exception e) {
			// TODO Auto-generated catch block
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
