package board.service;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class GetBoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		int endNum = pg * 5;
		int startNum = endNum - 4;
		
		//DB - 1페이지당 5개씩
		BoardDAO boardDAO = new BoardDAO();
		List<BoardDTO> list = boardDAO.getBoardList(startNum, endNum);
		System.out.println(list);
		
		//List -> JSON 변환
		JSONObject json = new JSONObject();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		
		if(list != null) {
			JSONArray array = new JSONArray();
			
			for(BoardDTO boardDTO : list) {
				JSONObject temp = new JSONObject();
				temp.put("seq", boardDTO.getSeq());
				temp.put("id", boardDTO.getId());
				temp.put("name", boardDTO.getName());
				temp.put("email", boardDTO.getEmail());
				temp.put("subject", boardDTO.getSubject());
				temp.put("content", boardDTO.getContent());
				temp.put("ref", boardDTO.getRef());
				temp.put("lev", boardDTO.getLev());
				temp.put("step", boardDTO.getStep());
				temp.put("pseq", boardDTO.getPseq());
				temp.put("reply", boardDTO.getReply());
				temp.put("hit", boardDTO.getHit());
				//temp.put("logtime", boardDTO.getLogtime()+""); //Date -> String으로 바꿔서 (년월일시분초 다 나옴)
				
				temp.put("logtime", sdf.format(boardDTO.getLogtime())); //Date -> String으로 바꿔서
				
				array.add(temp);
			} //for
			
			json.put("list", array);
			
		} //if
		
		//페이징 처리
		int totalA = boardDAO.getTotalA(); //총글수
		
		BoardPaging boardPaging = new BoardPaging();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		
		json.put("pagingHTML", boardPaging.getPagingHTML()+""); //StringBuffer -> String으로 바꿈
		System.out.println(json);
		
		//조회수 새로고침 증가 방지
		HttpSession session = request.getSession();
		if(session.getAttribute("memId") != null) {
			session.setAttribute("memHit", "0"); // 0대신 다른거 아무거나 넣어도 됨
		}
		json.put("memId", session.getAttribute("memId"));
		
		//응답
		request.setAttribute("json", json);
		return "/board/getBoardList.jsp";
	}

}
