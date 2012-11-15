package org.crm.dao.impl;

import java.util.List;

import org.crm.dao.LinkmanDao;
import org.crm.entity.Linkman;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class LinkmanDaoImpl implements LinkmanDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.impl.LinkmanDao#add(org.crm.entity.Linkman)
	 */
	@Override
	public boolean add(Linkman linkman) {
		String sql = "insert into linkman(customerId,memo,mobile,name,position,sex,tel) values(?,?,?,?,?,?,?)";
		return jdbcTemplate.update(
				sql,
				new Object[] { linkman.getCustomerId().getId(),
						linkman.getMemo(), linkman.getMobile(),
						linkman.getName(), linkman.getPosition(),
						linkman.getSex(), linkman.getTel() }) == 1;

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.impl.LinkmanDao#update(org.crm.entity.Linkman)
	 */
	@Override
	public boolean update(Linkman linkman) {
		return false;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.impl.LinkmanDao#delete(int)
	 */
	@Override
	public boolean delete(int id) {
		return false;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.impl.LinkmanDao#find()
	 */
	@Override
	public List<Linkman> find() {
		List list = null;
		return list;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.impl.LinkmanDao#get(int)
	 */
	@Override
	public Linkman get(int id) {
		return null;
	}
}
