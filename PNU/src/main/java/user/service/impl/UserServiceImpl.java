package user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import user.dao.UserDAO;
import user.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserDAO userDAO;
	@Override
	public Boolean selectPwd(String userId) {
		return pwd.equals(userDAO.selectPwd(userId));
	}
}
