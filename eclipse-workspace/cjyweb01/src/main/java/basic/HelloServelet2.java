package basic;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HelloServelet2")
public class HelloServelet2 extends HttpServlet {
    public HelloServelet2() {
        System.out.println("HelloServlet2 생성자 수행");
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config) throws ServletException {
    	System.out.println("HelloServlet2 init() 수행");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HelloServlet2 doGet() 수행");
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HelloServlet2 doPost() 수행");
//		doGet(request, response);
	}
	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HelloServlet2 doPut() 수행");
//		doGet(request, response);
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HelloServlet2 doDelete() 수행");
//		doGet(request, response);
	}

}
