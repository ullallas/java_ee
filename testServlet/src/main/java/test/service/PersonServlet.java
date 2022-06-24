package test.service;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PersonServlet")
public class PersonServlet extends HttpServlet {
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
		int gender = Integer.parseInt(request.getParameter("gender"));
		String color = request.getParameter("color");
		String[] hobby = request.getParameterValues("hobby");
		String[] subject = request.getParameterValues("subject");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<body>");
		out.println("이름 : " + name);
		out.println("<br>");
		if(gender == 0) out.println("성별 : 남자<br>");
		else out.println("성별 : 여자<br>");
		out.println("색깔 : " + color);
		out.println("<br>");
		out.println("취미 : " + Arrays.toString(hobby));
		out.println("<br>");
		out.println("과목 : " + Arrays.toString(subject));
		
		out.println("<input type='button' value='뒤로' onclick='history.go(-1)'>");
		
		out.println("</body>");
		out.println("</html>");
	}
	
	
	

}
