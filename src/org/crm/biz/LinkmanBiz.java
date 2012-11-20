package org.crm.biz;

import java.util.List;

import org.crm.dao.LinkmanDao;
import org.crm.entity.Linkman;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class LinkmanBiz {
	@Autowired
	private LinkmanDao linkmanDao;

	public List<Linkman> findByCustId(int custId) {
		return linkmanDao.findByCustId(custId);
	}

	public boolean add(Linkman l) {
		return linkmanDao.add(l);
	}

	public boolean del(int linkmanId) {
		return linkmanDao.delete(linkmanId);
	}

	public boolean update(Linkman linkman) {
		return linkmanDao.update(linkman);
	}

	public Linkman get(int id) {
		return linkmanDao.get(id);
	}

	public int getTotalCount() {
		// TODO Auto-generated method stub
		return linkmanDao.getTotalCount();
	}
}
