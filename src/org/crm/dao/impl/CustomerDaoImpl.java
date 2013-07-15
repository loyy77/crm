package org.crm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.crm.common.Constant;
import org.crm.dao.CustomerDao;
import org.crm.entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

@Component
public class CustomerDaoImpl implements CustomerDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/*
	 * 添加后返回 编号 (non-Javadoc)
	 * 
	 * @see org.crm.dao.impl.CustomerDao#add(org.crm.entity.Customer)
	 */
	@Override
	public int add(final String customerName) {
		final String sql = "insert into customer(name) values(?)";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection conn)
					throws SQLException {
				PreparedStatement ps = conn.prepareStatement(sql,
						new String[] { "id" });
				ps.setString(1, customerName);
				return ps;
			}
		}, keyHolder);
		return keyHolder.getKey().intValue();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.impl.CustomerDao#update(org.crm.entity.Customer)
	 */
	@Override
	public boolean update(Customer c) {
		String sql = "update customer set name=?,region=?,managerId=?,managerName=?,levelLabel=?,satisfy=?,credit=?,addr=?,zip=?,tel=?,fax=?,website=?,licence=?,chieftain=?,bankroll=?,turnover=?,bank=?,account=?,localTax=?,nationalTax=? where id=?";

		return jdbcTemplate.update(
				sql,
				new Object[] { c.getName(), c.getRegion(), c.getManagerId(),
						c.getManagerName(), c.getLevelLabel(), c.getSatisfy(),
						c.getCredit(), c.getAddr(), c.getZip(), c.getTel(),
						c.getFax(), c.getWebsite(), c.getLicence(),
						c.getChieftain(), c.getBankroll(), c.getTurnover(),
						c.getBank(), c.getAccount(), c.getLocalTax(),
						c.getNationalTax(), c.getId() }) == 1 ? true : false;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.impl.CustomerDao#delete(int)
	 */
	@Override
	public boolean delete(int id) {

		String sql = "delete from customer where id=?";

		return jdbcTemplate.update(sql, id) == 1 ? true : false;
	}

	/**
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.impl.CustomerDaoImpl#findSmall()
	 */
	public List<Customer> findSmall() {
		List<Customer> list = null;
		// jdbcTemplate.execute("set names=utf8 ;");
		String sql = "select id,name,levellabel,managername,region,state from customer where state =?";
		list = jdbcTemplate.query(sql,
				new Object[] { Constant.CUSTOMER_STATE_NORMAL },
				new RowMapper<Customer>() {
					@Override
					public Customer mapRow(ResultSet rs, int arg1)
							throws SQLException {
						Customer c = new Customer();

						c.setId(rs.getInt("id"));
						c.setLevelLabel(rs.getString("levellabel"));

						c.setManagerName(rs.getString("managerName"));
						c.setName(rs.getString("name"));

						c.setRegion(rs.getString("region"));
						c.setState(rs.getInt("state"));
						return c;
					}
				});
		return list;
	}

	@Override
	public List<Customer> find() {
		List<Customer> list = null;
		// jdbcTemplate.execute("set names=utf8 ;");
		String sql = "select * from customer where state =?";
		list = jdbcTemplate.query(sql,
				new Object[] { Constant.CUSTOMER_STATE_NORMAL },
				new RowMapper<Customer>() {
					@Override
					public Customer mapRow(ResultSet rs, int arg1)
							throws SQLException {
						Customer c = new Customer();
						c.setAccount(rs.getString("account"));
						c.setAddr(rs.getString("addr"));
						c.setBank(rs.getString("bank"));
						c.setBankroll(rs.getDouble("bankroll"));
						c.setChieftain(rs.getString("chieftain"));
						c.setCredit(rs.getInt("credit"));
						c.setFax(rs.getString("fax"));
						c.setId(rs.getInt("id"));
						c.setLevelLabel(rs.getString("levellabel"));
						c.setLicence(rs.getString("licence"));
						c.setLocalTax(rs.getString("localTax"));
						c.setManagerId(rs.getInt("managerId"));
						c.setManagerName(rs.getString("managerName"));
						c.setName(rs.getString("name"));
						c.setNationalTax(rs.getString("nationaltax"));
						c.setRegion(rs.getString("region"));
						c.setSatisfy(rs.getInt("satisfy"));
						c.setState(rs.getInt("state"));
						c.setTel(rs.getString("tel"));
						c.setTurnover(rs.getDouble("turnover"));
						c.setWebsite(rs.getString("website"));
						c.setZip(rs.getString("zip"));
						return c;
					}
				});
		return list;
	}

	/**
	 * 只获得客户的编号和名字
	 */
	public Customer getCustomerSmall(int id) {
		return jdbcTemplate.queryForObject(
				"select id,name from customer where id=?", new Object[] { id },
				new RowMapper<Customer>() {

					@Override
					public Customer mapRow(ResultSet rs, int arg1)
							throws SQLException {
						Customer c = new Customer();
						c.setId(rs.getInt("id"));
						c.setName(rs.getString("name"));
						return c;
					}
				});
	}

	/*
	 * (non-Javadoc) 根据编号获得对象
	 * 
	 * @see org.crm.dao.impl.CustomerDao#get(int)
	 */
	@Override
	public Customer get(int id) {
		return jdbcTemplate.queryForObject("select * from customer where id=?",
				new Object[] { id }, new RowMapper<Customer>() {

					@Override
					public Customer mapRow(ResultSet rs, int arg1)
							throws SQLException {
						Customer c = new Customer();
						c.setAccount(rs.getString("account"));
						c.setAddr(rs.getString("addr"));
						c.setBank(rs.getString("bank"));
						c.setBankroll(rs.getDouble("bankroll"));
						c.setChieftain(rs.getString("chieftain"));
						c.setCredit(rs.getInt("credit"));
						c.setFax(rs.getString("fax"));
						c.setId(rs.getInt("id"));
						c.setLevelLabel(rs.getString("levellabel"));
						c.setLicence(rs.getString("licence"));
						c.setLocalTax(rs.getString("localTax"));
						c.setManagerId(rs.getInt("managerId"));
						c.setManagerName(rs.getString("managerName"));
						c.setName(rs.getString("name"));
						c.setNationalTax(rs.getString("nationaltax"));
						c.setRegion(rs.getString("region"));
						c.setSatisfy(rs.getInt("satisfy"));
						c.setState(rs.getInt("state"));
						c.setTel(rs.getString("tel"));
						c.setTurnover(rs.getDouble("turnover"));
						c.setWebsite(rs.getString("website"));
						c.setZip(rs.getString("zip"));
						return c;
					}
				});
	}

	@Override
	public boolean updateSatate(int id, int stateId) {
		String sql = "update customer set state=? where id=?";

		return jdbcTemplate.update(sql, stateId, id) == 1 ? true : false;
	}

	@Override
	public int getTotalCount() {
		String sql = "select count(id) from customer where state=1";

		return jdbcTemplate.queryForInt(sql);
	}
}
