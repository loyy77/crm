package org.crm.dao;

import javax.annotation.Resource;

import org.crm.entity.Users;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:WebContent/WEB-INF/spring/persistence-context.xml")
public class UsersDaoTest extends AbstractJUnit4SpringContextTests {

	public UsersDaoTest() {
	}

	@Resource
	private UsersDao ud;

	@Test
	public void testAdd() {
		System.out.println("testng");

		Users u = new Users();
		u.setFlag(true);
		u.setLoginName("loyy3");
		u.setLoginPass("123");
		u.setRoleId(1);
		u.setTrueName("loyy");

		ud.add(u);

	}
}
