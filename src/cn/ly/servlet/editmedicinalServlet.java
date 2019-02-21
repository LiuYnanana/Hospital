package cn.ly.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ly.bean.medicinal;
import cn.ly.dao.hospitalDao;

/**
 * Servlet implementation class editmedicinalServlet
 */
public class editmedicinalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editmedicinalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		medicinal md = new medicinal();
		String mdId= request.getParameter("mdId");
		String mdName = request.getParameter("mdName");
		String mdNumber = request.getParameter("mdNumber");
		String mdPrice = request.getParameter("mdPrice");
		String mdDescription = request.getParameter("mdDescription");
		
		System.out.println(mdName + "lala");
		md.setMedicinalId(mdId);
		md.setMedicinalName(mdName);
		md.setMedicinalNumber(mdNumber);
		md.setMedicinalPrice(mdPrice);
		md.setMedicinalDescription(mdDescription);
		
		hospitalDao medicinalD = new hospitalDao();
	    try {
	    	medicinalD.updateMedicinal(md);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    response.sendRedirect("medicinallist.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
