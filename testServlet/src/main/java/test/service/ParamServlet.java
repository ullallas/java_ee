package test.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/ParamServlet")
public class ParamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void init() throws ServletException {
		System.out.println("init()...");
	}

	public void destroy() {
		System.out.println("destroy()...");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()...");
		
		//데이터
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("Hello Servlet!<br>");
		out.println("안녕하세요 Servlet!<br>");
		
		out.println("나의 이름은 " + name + " 이고 " + age + "살 이므로 ");
		if(age>=19) out.println("성인 입니다.");
		else out.println("청소년 입니다.");
		
		out.println("<br><br>");
		out.println("<input type='button' value='뒤로' onclick='history.go(-1)'>");
		
		out.println("</body>");
		out.println("</html>");
		
	}

}
