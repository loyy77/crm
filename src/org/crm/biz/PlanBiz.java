/**
 * 
 */
package org.crm.biz;

import java.util.List;

import org.crm.dao.PlanDao;
import org.crm.entity.Plan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author lishixi
 * 
 */
@Component
public class PlanBiz {
	@Autowired
	private PlanDao planDao;

	public List<Plan> list(int chanceId) {
		return planDao.list(chanceId);
	}

	public boolean update(Plan plan) {
		return planDao.update(plan);
	}

	public boolean delete(int id) {
		return planDao.del(id);
	}

	public boolean add(Plan plan) {
		return planDao.add(plan);
	}
}
