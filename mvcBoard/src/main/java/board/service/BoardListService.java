package board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardListService implements CommandProcess{
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		int endNum = pg * 5;
		int startNum = endNum - 4;
		
		//DB - 1페이지당 5개씩
		BoardDAO boardDAO = new BoardDAO();
		List<BoardDTO> list = boardDAO.getBoardList(startNum, endNum);
		
		//페이징 처리
		int totalA = boardDAO.getTotalA();
		int totalP = (totalA+4)/5;
		System.out.println("totalA = " + totalA + ", totalP = " + totalP);
		
		//응답
		request.setAttribute("list", list);
		request.setAttribute("totalP", totalP);
		request.setAttribute("pg", pg);
		return "/board/boardList.jsp";
	}
}
