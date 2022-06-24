package user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSearchService implements UserService {
	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);
		
		System.out.println("1. 이름 검색");
		System.out.println("2. 아이디 검색");
		System.out.print(" 번호 선택 : ");
		int num = scan.nextInt();
		
		String columnName = null;
		String value = null;
		
		if(num == 1) {
			System.out.print("이름 입력 : ");
			value = scan.next();
			columnName = "name";
		
		} else if(num == 2) {
			System.out.print("아이디 입력 : ");
			value = scan.next();
			columnName = "id";
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("columnName", columnName);
		map.put("value", value);
		
		//DB
		UserDAO userDAO = new UserDAO();
		List<UserDTO> list = userDAO.search(map);
		
		for(UserDTO userDTO : list) {
			System.out.println(userDTO.getName() + "\t"
									+ userDTO.getId() + "\t"
									+ userDTO.getPwd());
		}
		
		
		
		
		//DB
//		UserDAO userDAO = new UserDAO();
//		List<UserDTO> list = userDAO.search(~~);
//		
//		for(UserDTO userDTO : list) {
//			System.out.println(userDTO.getName() + "\t"
//									+ userDTO.getId() + "\t"
//									+ userDTO.getPwd());
//		}
	}
}

/*
1. 이름 검색
2. 아이디 검색
번호 선택 : 

1번인 경우
이름 입력 : 홍 (이름에 홍이 들어간 레코드 모두 검색)

2번인 경우
아이디 입력 : n (아이디에 n이 들어간 레코드 모두 검색)

- search 함수는 한 번만 (DAO, mapper 둘 다)
- if문 mapper에 써도 됨

*/
 
