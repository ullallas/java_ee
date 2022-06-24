package user.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserUpdateService implements UserService {
	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);
		
		System.out.print("수정할 아이디 입력 : ");
		String id = scan.next();
		
		//DB
		UserDAO userDAO = new UserDAO();
		UserDTO userDTO = userDAO.getUser(id);
		
		if(userDTO == null) {
			System.out.println("찾고자 하는 아이디가 없습니다.");
			return;
		}
		
		System.out.println(userDTO.getName() + "\t"
								 + userDTO.getId() + "\t"
								 + userDTO.getPwd());
		
		//입력
		System.out.print("수정할 이름 입력 : ");
		String name = scan.next();
		System.out.print("수정할 비밀번호 입력 : ");
		String pwd = scan.next();
		
		//데이터 담기
		Map<String, String> map = new HashMap<String, String>(); //DTO에 넣어도 됨
		map.put("name", name);
		map.put("id", id);
		map.put("pwd", pwd);
		
		//DB
		userDAO.update(map);
		
		//응답
		System.out.println("데이터를 수정하였습니다.");
		
	}
}

/* 
수정할 아이디 입력 : 
찾고자 하는 아이디가 없습니다. -select
------------------
수정할 아이디 입력 : 
홍길동		hong		111

수정할 이름 입력 : 
수정할 비밀번호 입력 : 

데이터를 수정하였습니다.
 */