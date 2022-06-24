package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardDeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//id="boardDeleteBtn"을 눌렀을 때
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		BoardDAO boardDAO = new BoardDAO();
		boardDAO.boardDelete(seq);
		
		return "/board/boardDelete.jsp";
	}

}
