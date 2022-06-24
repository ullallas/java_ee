package member.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

public class LogoutService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
		//쿠키
		Cookie[] ar = request.getCookies();
		if(ar != null) {
			for(int i=0; i<ar.length; i++) {
				if(ar[i].getName().equals("memName")) {
					ar[i].setPath("/");
					ar[i].setMaxAge(0); //쿠키삭제
					response.addCookie(ar[i]); //클라이언트 보내기
				}
				if(ar[i].getName().equals("memId")) {
					ar[i].setPath("/");
					ar[i].setMaxAge(0); //쿠키삭제
					response.addCookie(ar[i]); //클라이언트 보내기
				}
			}
		}
		 */
		
		//세션
		HttpSession session = request.getSession();
		
		//각각의 세션 삭제
		session.removeAttribute("memName");
		session.removeAttribute("memId");
		
		//모든 세션 삭제
		session.invalidate(); //무효화
		 
		//return "/index.jsp";
		return "/member/logout.jsp";
	}
	

}
