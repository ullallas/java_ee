package board.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class BoardListService implements CommandProcess{
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		//응답
		request.setAttribute("pg", pg);
		request.setAttribute("display", "/board/boardList.jsp");
		return "/index.jsp";
	}
}
