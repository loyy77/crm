package org.crm.biz;

import javax.annotation.Resource;

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
}
