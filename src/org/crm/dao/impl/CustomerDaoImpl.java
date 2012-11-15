package org.crm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

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
	 * (non-Javadoc)
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
				// TODO Auto-generated method stub
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
	public boolean update(Customer customer) {
		return false;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.impl.CustomerDao#delete(int)
	 */
	@Override
	public boolean delete(int id) {
		return false;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.impl.CustomerDao#find()
	 */
	@Override
	public List<Customer> find() {
		List list = null;
		return list;
	}

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
		return jdbcTemplate.queryForObject(
				"select * from ccustomer where id=?", new Object[] { id },
				new RowMapper<Customer>() {

					@Override
					public Customer mapRow(ResultSet rs, int arg1)
							throws SQLException {
						Customer c = new Customer();
						c.setAccount(rs.getString("account"));
						c.setAddr(rs.getString("addr"));
						c.setBank(rs.getString("bank"));
						c.setBankroll(rs.getDouble("bankrool"));
						c.setChiefatain(rs.getString("chiefatain"));
						c.setCredit(rs.getInt("credit"));
						c.setFax(rs.getString("fax"));
						c.setId(rs.getInt("id"));
						c.setLevelLabel(rs.getInt("levellabel"));
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
}
