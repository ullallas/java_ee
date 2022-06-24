package user.service;

import java.util.Scanner;

import user.dao.UserDAO;

public class UserDeleteService implements UserService {
	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);
		
		System.out.print("삭제 할 아이디 입력 : ");
		String id = scan.next();
		
		//DB
		UserDAO userDAO = new UserDAO();
		userDAO.delete(id);
		
		//응답
		System.out.println("데이터를 삭제하였습니다.");
	}
}
