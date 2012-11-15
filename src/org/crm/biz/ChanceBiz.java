package org.crm.biz;

import java.util.List;

import org.crm.common.Constant;
import org.crm.dao.ChanceDao;
import org.crm.dao.CustomerDao;
import org.crm.dao.LinkmanDao;
import org.crm.entity.Chance;
import org.crm.entity.Linkman;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ChanceBiz {
	@Autowired
	private ChanceDao chanceDao;
	@Autowired
	private LinkmanDao linkmanDao;
	@Autowired
	private CustomerDao customerDao;

	public void add(Chance chance) {
		chanceDao.add(chance);
	}

	public List<Chance> list() {
		return chanceDao.list();
	}

	public boolean del(int chanceId) {
		return chanceDao.del(chanceId);
	}

	public Chance get(int id) {
		return chanceDao.get(id);
	}

	public boolean udpate(Chance chance) {
		return chanceDao.update(chance);
	}

	public int getTotalCount() {
		return chanceDao.getTotalCount();
	}

	/**
	 * 排除被标记为 删除和为指派的销售机会总数
	 * 
	 * @return
	 */
	public int getTotalCountWithoutUnassgin() {
		return chanceDao.getTotalCountWithoutUnassgin();
	}

	public List<Chance> list(int page, int pageSize) {
		return chanceDao.list(page, pageSize);
	}

	public List<Chance> list(int page, int pageSize, int state) {
		return chanceDao.list(page, pageSize, state);
	}

	public boolean assign(Chance chance) {
		return chanceDao.assign(chance);
	}

	/**
	 * 开发成功,设置销售机会状态为开发成功
	 * 
	 * @param chanceId
	 * @return
	 */
	public boolean devSuccess(int chanceId, Linkman linkman, String customerName) {
		try {

			// 更新状态为开发成功
			chanceDao.updateState(chanceId, Constant.CHANCE_DEV_SUCCESS);
			// 创建客户记录。
			int customerId = customerDao.add(customerName);
			linkman.setCustomerId(customerDao.getCustomerSmall(customerId));
			return linkmanDao.add(linkman);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	/**
	 * 开发失败
	 * 
	 * @param chanceId
	 * @return
	 */
	public boolean devFailure(int chanceId) {
		return chanceDao.updateState(chanceId, Constant.CHANCE_DEV_Failure);
	}
}
