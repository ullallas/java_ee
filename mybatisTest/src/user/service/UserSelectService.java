package user.service;

import java.util.List;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSelectService implements UserService {

	@Override
	public void execute() {
		UserDAO userDAO = new UserDAO();
		List<UserDTO> list = userDAO.getUserList();
		
		for(UserDTO userDTO : list) {
			System.out.println(userDTO.getName() + "\t"
									+ userDTO.getId() + "\t"
									+ userDTO.getPwd());
		}
	}

}
