package cn.ly.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ly.bean.medicinal;
import cn.ly.dao.hospitalDao;

/**
 * Servlet implementation class addMedicinalServlet
 */
public class addMedicinalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addMedicinalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		hospitalDao MedicinalD = new hospitalDao();
		medicinal md = new medicinal();
		
		md.setMedicinalId(request.getParameter("mdId"));

		if(MedicinalD.getOnemd(md.getMedicinalId()) != null) {
			out.print("exist");
			return ;
		}
		
	    try {
	    
	    	if(MedicinalD.getOneDp(md.getMedicinalId()) == null) {
	    		String mdId= request.getParameter("mdId");
	    		String mdName = request.getParameter("mdName");
	    		String mdNumber = request.getParameter("mdNumber");
	    		String mdPrice = request.getParameter("mdPrice");
	    		String mdDescription = request.getParameter("mdDescription");
	    		
	    		md.setMedicinalId(mdId);
	    		md.setMedicinalName(mdName);
	    		md.setMedicinalNumber(mdNumber);
	    		md.setMedicinalPrice(mdPrice);
	    		md.setMedicinalDescription(mdDescription);

	    /*		System.out.println(mdId);
	    		System.out.println(mdName);
	    		System.out.println(mdNumber);
	    		System.out.println(mdPrice);
	    		System.out.println(mdDescription);*/
	    		if(mdNumber != null && mdName != null && mdId != null && mdPrice != null && mdDescription != null) {
	    			MedicinalD.addMedicinal(md);
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
