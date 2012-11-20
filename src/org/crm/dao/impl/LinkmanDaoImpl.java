package org.crm.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.crm.dao.CustomerDao;
import org.crm.dao.LinkmanDao;
import org.crm.entity.Linkman;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

@Component
public class LinkmanDaoImpl implements LinkmanDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private CustomerDao customerDao;

	/*
	 * (non-Javadoc) 添加一个联系人
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
	 * (non-Javadoc) 更新联系人信息
	 * 
	 * @see org.crm.dao.impl.LinkmanDao#update(org.crm.entity.Linkman)
	 */
	@Override
	public boolean update(Linkman linkman) {

		return jdbcTemplate
				.update("update linkman set name=?,position=?,sex=?,tel=?,mobile=?,memo=? where id=?",
						linkman.getName(), linkman.getPosition(),
						linkman.getSex(), linkman.getTel(),
						linkman.getMobile(), linkman.getMemo(), linkman.getId()) == 1 ? true
				: false;
	}

	/*
	 * (non-Javadoc) 删除
	 * 
	 * @see org.crm.dao.impl.LinkmanDao#delete(int)
	 */
	@Override
	public boolean delete(int id) {

		return jdbcTemplate.update("delete from linkman where id=?", id) == 1 ? true
				: false;
	}

	/*
	 * (non-Javadoc) 查找所有联系人
	 * 
	 * @see org.crm.dao.impl.LinkmanDao#find()
	 */
	@Override
	public List<Linkman> find() {
		List<Linkman> list = null;
		list = jdbcTemplate.query("select * from linkman",
				new RowMapper<Linkman>() {

					@Override
					public Linkman mapRow(ResultSet rs, int arg1)
							throws SQLException {
						Linkman l = new Linkman();
						l.setCustomerId(customerDao.get(rs.getInt("customerId")));
						l.setId(rs.getInt("id"));
						l.setMemo(rs.getString("memo"));
						l.setMobile(rs.getString("mobile"));
						l.setName(rs.getString("name"));
						l.setPosition(rs.getString("position"));
						l.setSex(rs.getString("sex"));
						l.setTel(rs.getString("tel"));
						return l;
					}
				});
		return list;
	}

	/*
	 * (non-Javadoc) 根据编号获得联系人对象
	 * 
	 * @see org.crm.dao.impl.LinkmanDao#get(int)
	 */
	@Override
	public Linkman get(int id) {

		return jdbcTemplate.queryForObject("select * from linkman where id=?",
				new RowMapper<Linkman>() {

					@Override
					public Linkman mapRow(ResultSet rs, int arg1)
							throws SQLException {
						Linkman l = new Linkman();
						l.setCustomerId(customerDao.get(rs.getInt("customerId")));
						l.setId(rs.getInt("id"));
						l.setMemo(rs.getString("memo"));
						l.setMobile(rs.getString("mobile"));
						l.setName(rs.getString("name"));
						l.setPosition(rs.getString("position"));
						l.setSex(rs.getString("sex"));
						l.setTel(rs.getString("tel"));
						return l;
					}
				}, id);
	}

	/**
	 * 根据客户编号查询对应的联系人
	 * 
	 * @param custId
	 * @return
	 */
	public List<Linkman> findByCustId(int custId) {
		String sql = "select * from linkman where customerId=?";
		return jdbcTemplate.query(sql, new Object[] { custId },
				new RowMapper<Linkman>() {

					@Override
					public Linkman mapRow(ResultSet rs, int arg1)
							throws SQLException {
						Linkman l = new Linkman();
						l.setCustomerId(customerDao.get(rs.getInt("customerId")));
						l.setId(rs.getInt("id"));
						l.setMemo(rs.getString("memo"));
						l.setMobile(rs.getString("mobile"));
						l.setName(rs.getString("name"));
						l.setPosition(rs.getString("position"));
						l.setSex(rs.getString("sex"));
						l.setTel(rs.getString("tel"));
						return l;
					}
				});
	}

	/**
	 * 分页用，数据总记录数
	 */
	public int getTotalCount() {
		String sql = "select count(id) from linkman";
		return jdbcTemplate.queryForInt(sql);
	}
}
