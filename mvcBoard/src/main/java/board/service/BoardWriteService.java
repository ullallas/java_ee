package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardWriteService implements CommandProcess{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
			//데이터
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", "ddochi");
			map.put("name", "또치");
			map.put("email", "ddochi@java.com");
			map.put("subject", subject);
			map.put("content", content);
			
			//DB
			BoardDAO boardDAO = new BoardDAO();
			boardDAO.boardWrite(map);
			
			//응답
			return "/board/boardWrite.jsp";
	}
}
