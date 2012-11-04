package org.crm.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.crm.entity.Chance;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:WebContent/WEB-INF/spring/persistence-context.xml")
public class ChanceDaoImplTest {
	@Autowired
	private ChanceDao chanceDao;
	
	@Test
	public void testListIntInt() {
		assertEquals(chanceDao.list(1, 2).size(), 2);
		List<Chance> list=chanceDao.list(1,3);
		for(int i=0;i<3;i++)
		{
			System.out.println(list.get(i).getTitle());
		}
	}

}
