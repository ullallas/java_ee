package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class GetBoardViewService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		//DB
		BoardDAO boardDAO = new BoardDAO();
		
		//조회수 새로고침 증가 방지 --> BoardListService와 연결
		HttpSession session = request.getSession();
		if(session.getAttribute("memHit") != null){
			
			boardDAO.setHit(seq); //조회수 증가
			session.removeAttribute("memHit"); //세션 삭제
		}
		
		BoardDTO boardDTO = boardDAO.getBoard(seq);
		
		//BoardDTO -> JSON 변환
		JSONObject json = new JSONObject();
		json.put("seq", boardDTO.getSeq());
		json.put("id", boardDTO.getId());
		json.put("name", boardDTO.getName());
		json.put("email", boardDTO.getEmail());
		json.put("subject", boardDTO.getSubject());
		json.put("content", boardDTO.getContent());
		json.put("ref", boardDTO.getRef());
		json.put("lev", boardDTO.getLev());
		json.put("step", boardDTO.getStep());
		json.put("pseq", boardDTO.getPseq());
		json.put("reply", boardDTO.getReply());
		json.put("hit", boardDTO.getHit());
		json.put("logtime", boardDTO.getLogtime()+"");
		
		//세션
		json.put("memId", session.getAttribute("memId"));
		
		//응답
		request.setAttribute("json", json);
		return "/board/getBoardView.jsp";
	}

}
