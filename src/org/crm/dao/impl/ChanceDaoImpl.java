package org.crm.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.crm.dao.ChanceDao;
import org.crm.dao.UsersDao;
import org.crm.entity.Chance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

@Component
public class ChanceDaoImpl implements ChanceDao {

	private int REMOVED = 1;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private UsersDao usersDao;    

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	/* 
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.impl.ChanceDao#add(org.crm.entity.Chance)
	 */
	@Override
	public boolean add(Chance chance) {
		String sql = "insert into chance(source,customerName,rate,title,linkMan,linkPhone,description,createId,createDate,assignId,assignDate,state) values(?,?,?,?,?,?,?,?,?,?,?,?)";
		int rst = jdbcTemplate.update(sql, chance.getSource(),
				chance.getCustomerName(), chance.getRate(), chance.getTitle(),
				chance.getLinkMan(), chance.getLinkPhone(),
				chance.getDescription(), chance.getCreateId().getUserId(),
				chance.getCreateDate(), 99999, chance.getAssignDate(),
				chance.getState());
		if (rst == 1)
			return true;
		return false;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.impl.ChanceDao#list()
	 */
	@Override
	public List<Chance> list() {
		String sql = "select id,customerName,title,linkMan,linkPhone,createDate from chance where state !=1";

		return jdbcTemplate.query(sql, new ChanceMapperSimple());
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.impl.ChanceDao#del(int)
	 */
	@Override
	public boolean del(int id) {
		String sql = "update chance  set state = ? where id=?";
		int rst = this.jdbcTemplate.update(sql, REMOVED, id);
		if (rst == 1) {
			return true;

		}
		return false;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.impl.ChanceDao#update(int, int)
	 */
	@Override
	public boolean update(int chanceId, int assignId) {

		String sql = "update chance set assginId=? where id=? and state != 1 ";
		if (this.jdbcTemplate.update(sql, assignId, chanceId) == 1) {
			return true;
		}

		return false;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.impl.ChanceDao#get(int)
	 */
	@Override
	public Chance get(int id) {
		String sql = "select * from chance where id=?";

		return this.jdbcTemplate.queryForObject(sql, new Object[] { id },
				new RowMapper<Chance>() {

					@Override
					public Chance mapRow(ResultSet rs, int arg1)
							throws SQLException {
						Chance chance = new Chance();
						chance.setAssignDate(rs.getString("assignDate"));
						chance.setAssignId(usersDao.getById(rs
								.getInt("assignId")));//
						chance.setCreateDate(rs.getString("createDate"));
						chance.setCreateId(usersDao.getById(rs
								.getInt("createId")));//
						chance.setCustomerName(rs.getString("customerName"));
						chance.setDescription(rs.getString("description"));
						chance.setId(rs.getInt("id"));
						chance.setLinkMan(rs.getString("linkMan"));
						chance.setLinkPhone(rs.getString("linkPhone"));
						chance.setRate(rs.getFloat("rate"));
						chance.setSource(rs.getString("source"));
						chance.setState(rs.getInt("state"));
						chance.setTitle(rs.getString("title"));
						return chance;
					}
				});

	}

	@Override
	public boolean update(Chance chance) {

		String sql = "update chance set source=?,customerName=?,rate=?,title=?,linkMan=?,linkPhone=?,description=? where id=?";

		int rst = this.jdbcTemplate.update(sql, chance.getSource(),
				chance.getCustomerName(), chance.getRate(), chance.getTitle(),
				chance.getLinkMan(), chance.getLinkPhone(),
				chance.getDescription(), chance.getId());
		if (rst == 1)
			return true;
		return false;
	}

	@Override
	public int getTotalCount() {
		String sql="select count(*) from Chance where state !=1";
		return jdbcTemplate.queryForInt(sql);
	}

/**
 * 分页查询(存储过程）
 */
	@Override
	public List<Chance> list(int page, int pageSize) {
		int start=(page-1)*pageSize;
		int end=pageSize;
			String sql="select * from chance  where state !=1 limit ?,?";
		
		//String sql="call crm.proc_pager(?,?)";
		//jdbcTemplate.call(, declaredParameters)
		return this.jdbcTemplate.query(sql, new Object[]{start,end},new RowMapper<Chance>() {

				@Override
				public Chance mapRow(ResultSet rs, int arg1)
						throws SQLException {
					Chance chance = new Chance();
					chance.setAssignDate(rs.getString("assignDate"));
					chance.setAssignId(usersDao.getById(rs
							.getInt("assignId")));//
					chance.setCreateDate(rs.getString("createDate"));
					chance.setCreateId(usersDao.getById(rs
							.getInt("createId")));//
					chance.setCustomerName(rs.getString("customerName"));
					chance.setDescription(rs.getString("description"));
					chance.setId(rs.getInt("id"));
					chance.setLinkMan(rs.getString("linkMan"));
					chance.setLinkPhone(rs.getString("linkPhone"));
					chance.setRate(rs.getFloat("rate"));
					chance.setSource(rs.getString("source"));
					chance.setState(rs.getInt("state"));
					chance.setTitle(rs.getString("title"));
					return chance;
				}
			});
//		return null;
	}

}

@Component
class ChanceMapper implements RowMapper<Object> {

	@Autowired
	private UsersDao usersDao;

	@Override
	public Object mapRow(ResultSet rs, int arg1) throws SQLException {

		Chance chance = new Chance();
		chance.setAssignDate(rs.getString("assignDate"));
		chance.setAssignId(usersDao.getById(rs.getInt("assignId")));//
		chance.setCreateDate(rs.getString("createDate"));
		chance.setCreateId(usersDao.getById(rs.getInt("createId")));//
		chance.setCustomerName(rs.getString("customerName"));
		chance.setDescription(rs.getString("description"));
		chance.setId(rs.getInt("id"));
		chance.setLinkMan(rs.getString("linkMan"));
		chance.setLinkPhone(rs.getString("linkPhone"));
		chance.setRate(rs.getFloat("rate"));
		chance.setSource(rs.getString("source"));
		chance.setState(rs.getInt("state"));
		chance.setTitle(rs.getString("title"));
		return chance;
	}

}

class ChanceMapperSimple implements RowMapper<Chance> {

	@Override
	public Chance mapRow(ResultSet rs, int arg1) throws SQLException {

		Chance chance = new Chance();
		chance.setCreateDate(rs.getString("createDate"));
		chance.setCustomerName(rs.getString("customerName"));
		chance.setId(rs.getInt("id"));
		chance.setLinkMan(rs.getString("linkMan"));
		chance.setLinkPhone(rs.getString("linkPhone"));
		chance.setTitle(rs.getString("title"));
		return chance;
	}
}
