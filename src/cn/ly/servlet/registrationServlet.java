package cn.ly.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ly.bean.registration;
import cn.ly.dao.userDao;

/**
 * Servlet implementation class registrationServlet
 */
public class registrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		userDao rgD = new userDao();
		PrintWriter out = response.getWriter();
		registration rg = new registration();
		rg.setPatientName(request.getParameter("data1")); 
		rg.setDepartmentNumber(request.getParameter("data2")); 
		rg.setDoctorNumber(request.getParameter("data3")); 
		rg.setRegistrationTime(request.getParameter("data4")); 
		rg.setRegistrationFee(request.getParameter("data5")); 
		
		try {
			rgD.addRegistration(rg);	
    		out.print("yes");
		}  catch (Exception e) {
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
