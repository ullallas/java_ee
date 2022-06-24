package member.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class LoginService implements CommandProcess {

	//1번인 경우
//	@Override
//	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
//		//데이터
//		String id = request.getParameter("id");
//		String pwd = request.getParameter("pwd");
//		
//		//DB
//		MemberDAO memberDAO = new MemberDAO();
//		MemberDTO memberDTO = memberDAO.login(id, pwd); //안돼! 고쳐야함! 스트링 네임 안돼!
//		
//		//응답
//		String loginResult = null;
//		if(memberDTO == null) {
//			 loginResult = "fail"; //로그인 실패
//		}else {
//			
//			/*
//			//쿠키
//	         //Cookie cookie = new Cookie("쿠키명", 값);
//	         Cookie cookie = new Cookie("memName", name);
//	         cookie.setPath("/");
//	         cookie.setMaxAge(30*60); //쿠키 살아있는 시간 초 기준(30*60)은 30분
//	         response.addCookie(cookie);      //클라이언트 보내기
//	         
//	         Cookie cookie2 = new Cookie("memId", id);
//	         cookie2.setPath("/");
//	         cookie2.setMaxAge(30*60); //쿠키 살아있는 시간 초 기준(30*60)은 30분
//	         response.addCookie(cookie2);      //클라이언트 보내기
//	         */
//		
//	        
//	        //세션
//			HttpSession session = request.getSession(); //세션 생성
//			session.setAttribute("memName", memberDTO.getName());
//			session.setAttribute("memId", id);
//			session.setAttribute("memEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
//			
//			session.setAttribute("memDTO", memberDTO);
//			
//	        // request.setAttribute("id",  id);
//	        // request.setAttribute("name",  name);
//		}
//		request.setAttribute("loginResult", loginResult);
//		return "/index.jsp";
//	}
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		//DB
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = memberDAO.login(id, pwd); //안돼! 고쳐야함! 스트링 네임 안돼!
		
		//응답
		if(memberDTO != null) {
			
			//세션
			HttpSession session = request.getSession(); //세션 생성
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memId", id);
			session.setAttribute("memEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
			
			session.setAttribute("memDTO", memberDTO);
		}
		return "/member/login.jsp";
	}

}
