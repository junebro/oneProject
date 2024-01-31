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

/**
 * Servlet implementation class HelloServlet
 */
@WebServlet(
		urlPatterns = { "/hello" }, 
		initParams = { 
				@WebInitParam(name = "company", value = "IT 교육 센터", description = "기관명입니다."),
				@WebInitParam(name="address", value="마포구 공덕동")
		})

public class HelloServlet extends HttpServlet {
	
	private String company;
    private String address;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelloServlet() {
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
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("service() 메소드 호출됨");
		request.setCharacterEncoding("UTF-8"); // 한글 깨짐 방지
		
		String method = request.getMethod();
		
		if(method.equalsIgnoreCase("get")) {
			doGet(request, response);
		} else {
			doPost(request, response);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("post 방식 호출됨");
		
		// request : 클라이언트의 요청이 처리되는 동안 유효
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String[] hobbies = request.getParameterValues("hobby");
		
		String hobby = "";
		if(hobbies == null ) {
			hobby = null;
		} else {
			for (int i = 0; i < hobbies.length; i++ ) {
				
				hobby += hobbies[i] + "/";
			}
		}
		
		System.out.println("id : " + id);
		System.out.println("name : " + name);
		System.out.println("age : " + age);
		System.out.println("hobbies : " + hobby);
		
		// 바인딩(binding) : scope에 attribute를 추가하는 동작
		request.setAttribute("id", id);
		request.setAttribute("name", name);
		request.setAttribute("age", age);
		request.setAttribute("hobby", hobby);
		
		
		// bean 객체를 이용한 바인딩
		// java를 이용한 바인딩 방법
		Hello bean = new Hello();
		
		bean.setAge(age);
		bean.setId(id);
		bean.setHobby(hobby);
		bean.setName(name);
		
		request.setAttribute("xxx", bean);
		
		// session으로 바인딩
		// session : 세션이 유지되는 동안 유효
		HttpSession session = request.getSession();
		session.setAttribute("company", company);
		session.setAttribute("address", address);
		
		String gotopage = "exercise/servletTo01.jsp"; // 이동할 페이지
		
		// 포워딩 방식
		RequestDispatcher diapatcher = request.getRequestDispatcher(gotopage);
		diapatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get 방식 호출됨");
	}
	
	
	

}
