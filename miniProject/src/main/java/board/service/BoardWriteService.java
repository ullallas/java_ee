package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardWriteService implements CommandProcess{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
			//데이터
			HttpSession session = request.getSession();
			
			String id = (String)session.getAttribute("memId");
			String name = (String)session.getAttribute("memName");
			String email = (String)session.getAttribute("memEmail"); //로그인 서비스에서 세션 만들기 & 데이터도 건드려야.. DB에서 꺼내와야...
		
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", id);
			map.put("name", name);
			map.put("email", email);
			map.put("subject", subject);
			map.put("content", content);
			
			//DB
			BoardDAO boardDAO = new BoardDAO();
			boardDAO.boardWrite(map);
			
			//응답
			return "/board/boardWrite.jsp";
	}
}
