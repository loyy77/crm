package org.crm.dao;

import javax.annotation.Resource;
import org.crm.entity.Users;
import org.springframework.test.context.ContextConfiguration;

import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.annotations.Test;

//@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:WebContent/WEB-INF/spring/persistence-context.xml")
public class UsersDaoTest extends AbstractTestNGSpringContextTests {
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
		u.setTureName("loyy");

		ud.add(u);
                
	}

}
