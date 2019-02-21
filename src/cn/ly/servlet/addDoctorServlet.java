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
 * Servlet implementation class addDoctorServlet
 */
public class addDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addDoctorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		hospitalDao doctorD = new hospitalDao();
		doctor dc = new doctor();
		
		dc.setdoctorNumber(request.getParameter("dcNumber"));
		//System.out.println(request.getParameter("departmentname") + "112");
		if(doctorD.getOneDc(dc.getdoctorNumber()) != null) {
			out.print("exist");
			return ;
		}
		
	    try {
	    	System.out.println("Here");
	    	if(doctorD.getOneDp(dc.getdoctorNumber()) == null) {
	    		String dcNumber = request.getParameter("dcNumber");
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
	    		
	    		System.out.println(dc.getdoctorAge() + "lall");
	    		
	    	//	System.out.println(dpName + " " + dpNum + " " + dpDes);
	    		if(dcNumber != null && dcNumber != null && dcSex != null && dcAge != null && dcBirthday != null && dcMarriage != null && dcEducation != null && dcMarriage != null && dcCareer != null && dcExpert != null) {
	    			System.out.println(dcExpert);
	    			doctorD.addDoctor(dc);
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
