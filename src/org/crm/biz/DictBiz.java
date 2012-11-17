package org.crm.biz;

import java.util.List;

import org.crm.dao.DictDao;
import org.crm.entity.Dict;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DictBiz {
	@Autowired
	private DictDao dictDao;

	public List<Dict> getRegion() {
		return dictDao.findByDictType("地区");
	}

	public List<Dict> getCustLevel() {
		return dictDao.findByDictType("客户等级");
	}

}
