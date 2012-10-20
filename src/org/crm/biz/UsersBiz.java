package org.crm.biz;

import javax.annotation.Resource;

import org.crm.dao.UsersDao;
import org.crm.entity.Users;
import org.springframework.stereotype.Component;

@Component
public class UsersBiz {

	@Resource
	private UsersDao usersDao;

	public Users login(String loginName, String loginPass) {
		return usersDao.getById(usersDao.getUserIdByLoignnameAndLoginpass(
				loginName, loginPass));

	}
}
