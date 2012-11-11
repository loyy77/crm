package org.crm.biz;

import java.util.List;

import org.crm.dao.UsersDao;
import org.crm.entity.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UsersBiz {

	@Autowired
	private UsersDao usersDao;

	public Users login(String loginName, String loginPass) {
		return usersDao.getByNameAndPassword(loginName, loginPass);

	}

	public List<Users> list() {
		return usersDao.findAll();
	}

	public Users getById(int id) {
		return usersDao.getById(id);
	}
}
