package cn.ly.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.ly.bean.*;
import cn.ly.dao.hospitalDao;
/**
 * Servlet implementation class Paging
 */
public class ChangePage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String flag1 = (String) session.getAttribute("flag1");
		String flag2 = (String) session.getAttribute("flag2");
		String flag3 = (String) session.getAttribute("flag3");
		
		Paging paging = new Paging();
		if(flag1 == "true") {
			hospitalDao dpDao = new hospitalDao();
			List<department> list = dpDao.getAllUser();
			paging.setCount(list.size());
		}
		if(flag2 == "true") {
			hospitalDao dcDao = new hospitalDao();
			List<doctor> list = dcDao.getAllDoctor();
			paging.setCount(list.size());
		}
		if(flag3 == "true") {
			hospitalDao mdDao = new hospitalDao();
			List<medicinal> list = mdDao.getAllMedicinal();
			paging.setCount(list.size());
		}
		int page = 1;
		String str_page = request.getParameter("page");
		String str_pos = request.getParameter("pos");
		System.out.println(str_pos);
		
		paging.setPagesize(5);
		paging.setPagenumber();
		paging.setEndpage();
		paging.setIndexpage(1);
		
		System.out.println(paging.getPagesize());
		if(str_page != null) {
			int pag = Integer.parseInt(str_page);
			if(pag > 0) {
				page = pag;
 			} 
		}
		paging.setPage(page);
		request.setAttribute("paging", paging);
		if(paging == null) System.out.println("null1111");
		
		request.getRequestDispatcher(str_pos).forward(request, response);
		
		/*
		 * System.out.println((paging.getPage() - 1) * paging.getPagesize());
		 * System.out.println(paging.getPage() * paging.getPagesize());
		 * 
		 * List<department> list_page = new ArrayList<>(); for(int i = (paging.getPage()
		 * - 1) * paging.getPagesize(); i < paging.getPage() * paging.getPagesize();i++)
		 * { list_page.add(list.get(i)); }
		 */
		 
		
		/*
		 * if(paging == null) System.out.println("null");
		 * 
		 * request.setAttribute("name", "username");
		 * 
		 * 
		 * if(request.getAttribute("paging") == null) System.out.println("null11");
		 * 
		 * request.setAttribute("list", list_page);
		 */
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
