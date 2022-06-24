package board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardViewService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		int seq = Integer.parseInt(request.getParameter("seq")); //그냥 String으로 받아도 됨
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		//DB
		BoardDAO boardDAO = new BoardDAO();
		BoardDTO boardDTO = boardDAO.getBoard(seq);
		
		//응답
		request.setAttribute("pg", pg);
		request.setAttribute("boardDTO", boardDTO);
		return "/board/boardView.jsp";
	}

}
