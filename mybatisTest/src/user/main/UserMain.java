package user.main;

import java.util.Scanner;

import user.service.UserDeleteService;
import user.service.UserInsertService;
import user.service.UserSearchService;
import user.service.UserSelectService;
import user.service.UserService;
import user.service.UserUpdateService;

public class UserMain {

	public static void main(String[] args) {
		UserMain userMain = new UserMain();
		userMain.menu();
		System.out.println("프로그램을 종료합니다.");
	}
	
	public void menu() {
		Scanner scan = new Scanner(System.in);
		UserService userService = null;
		
		int num = 0;
		
		while(true) {
			System.out.println();
			System.out.println("***************");
			System.out.println("     1. 입력");
			System.out.println("     2. 출력");
			System.out.println("     3. 수정");
			System.out.println("     4. 삭제");
			System.out.println("     5. 검색");
			System.out.println("     6. 끝");
			System.out.println("***************");
			System.out.print("     번호 : ");
			num = scan.nextInt();
			
			if(num==6) break;
			if(num==1) 
				//UserInsertService userInsertService = new UserInsertService(); //1:1관계
				userService = new UserInsertService(); //다형성, 부모 = 자식
			else if(num==2) 
				userService = new UserSelectService();
			else if(num==3) 
				userService = new UserUpdateService();
			else if(num==4) 
				userService = new UserDeleteService();
			else if(num==5) 
				userService = new UserSearchService();
			
			userService.execute(); //호출
			
		} //while
	} //menu()

}
