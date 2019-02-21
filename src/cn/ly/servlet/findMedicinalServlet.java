package cn.ly.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.ly.dao.hospitalDao;

/**
 * Servlet implementation class findMedicinalServlet
 */
public class findMedicinalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public findMedicinalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String s = (String)request.getParameter("medicinalId");
		System.out.println("medicinal" + "   " + s);
    	hospitalDao md = new hospitalDao();
		PrintWriter out = response.getWriter();
		 try {
			    
		    if(md.getOnemd(s) == null) {
		    	out.print("no");
		    } else {
		    	 HttpSession session = request.getSession();
		 	    session.setAttribute("onemd", s);
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
