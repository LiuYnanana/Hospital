package cn.ly.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ly.bean.department;
import cn.ly.bean.doctor;
import cn.ly.dao.hospitalDao;

/**
 * Servlet implementation class editDoctorServlet
 */
public class editDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editDoctorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    doctor dc = new doctor();
	
		String dcNumber = request.getParameter("dcNumber");
	    System.out.println(dcNumber);
		String dcName = request.getParameter("dcName");
		String dcSex = request.getParameter("dcSex");
		String dcAge = request.getParameter("dcAge");
		String dcBirthday = request.getParameter("dcBirthday");
		String dcMarriage = request.getParameter("dcMarriage");
		String dcEducation = request.getParameter("dcEducation");
		String dcCareer = request.getParameter("dcCareer");
		String dcExpert = request.getParameter("dcExpert");
		
		dc.setdoctorNumber(dcNumber);
		dc.setdoctorName(dcName);
		dc.setdoctorSex(dcSex);
		dc.setdoctorAge(dcAge);
		dc.setdoctorBirthday(dcBirthday);
		dc.setdoctorMarriage(dcMarriage);
		dc.setdoctorEducation(dcEducation);
		dc.setdoctorMarriage(dcMarriage);
		dc.setdoctorCareer(dcCareer);
		dc.setdoctorExpert(dcExpert);
	
		
		hospitalDao doctorD = new hospitalDao();
	    try {
	    	doctorD.updateDoctor(dc);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    response.sendRedirect("doctorlist.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
