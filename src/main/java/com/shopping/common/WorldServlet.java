package com.shopping.common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.model.bean.Hello;
import com.shopping.model.bean.World;

/**
 * Servlet implementation class WorldServlet
 */

@WebServlet(
		urlPatterns = { "/WorldServlet" }, 
		initParams = { 
				@WebInitParam(name = "company", value = "IT 교육 센터", description = "기관명입니다."),
				@WebInitParam(name="address", value="마포구 공덕동")
		})
public class WorldServlet extends HttpServlet {
	
	private String company;
    private String address;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public WorldServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		
		System.out.println("init() 메소드 호출됨");
		
		this.company = config.getInitParameter("company");
		this.address = config.getInitParameter("address");
		
		System.out.println("회사명 : " + company);
		System.out.println("주소 : " + address);
		
		// application : 웹 어플리케이션이 실행되고 있는 동안 유효
		ServletContext application = config.getServletContext();
		String hello = "여러분 안녕하세요.";
		application.setAttribute("hello", hello);
	}
	
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("service방식");
		
		request.setCharacterEncoding("UTF-8"); // 한글 깨짐 방지

		String method = request.getMethod();

		if (method.equalsIgnoreCase("get")) {
			doGet(request, response);
		} else {
			doPost(request, response);
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("doPost방식");
		//request으로 바인딩
		int pnum = Integer.parseInt(request.getParameter("pnum"));
		String name = request.getParameter("name");
		String company = request.getParameter("company");
		int price = Integer.parseInt(request.getParameter("price"));
		
		request.setAttribute("pnum", pnum);
		request.setAttribute("name", name);
		request.setAttribute("company", company);
		request.setAttribute("price", price);
		
		// bean 객체를 이용한 바인딩
		World bean = new World();

		bean.setPnum(pnum);
		bean.setName(name);
		bean.setCompany(company);
		bean.setPrice(price);
		
		request.setAttribute("xxx", bean);
		
		// session으로 바인딩
		HttpSession session = request.getSession();
		session.setAttribute("pnum", pnum);
		session.setAttribute("name", name);
		session.setAttribute("company", this.company);
		session.setAttribute("price", price);
		
		
		String gotopage = "exercise/servletTo02.jsp"; // 이동할 페이지
		
		RequestDispatcher diapatcher = request.getRequestDispatcher(gotopage);
		diapatcher.forward(request, response);
	}

}
