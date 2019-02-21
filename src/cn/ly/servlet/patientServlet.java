package cn.ly.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ly.bean.patient;
import cn.ly.dao.userDao;

/**
 * Servlet implementation class patientServlet
 */
public class patientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public patientServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		userDao ptD = new userDao();
		PrintWriter out = response.getWriter();
		patient pt = new patient();
		pt.setPatientName(request.getParameter("data1")); 
		pt.setPatientSex(request.getParameter("data2")); 
		pt.setPatientDescription(request.getParameter("data3")); 
		pt.setMedicinal(request.getParameter("data4")); 
		pt.setTime(request.getParameter("data5")); 
		pt.setDoctorNumber(request.getParameter("data6")); 
		
		try {
			ptD.addPatient(pt);	
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
