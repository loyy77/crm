/**
 * 
 */
package org.crm.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.crm.dao.PlanDao;
import org.crm.entity.Plan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

/**
 * @author lishixi
 * 
 */
@Component
public class PlanDaoImpl implements PlanDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	/*
	 * ���һ��������ۻ���Ŀ����ƻ�
	 * 
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.PlanDao#add(org.crm.entity.Plan)
	 */
	/*
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.impl.PlanDao#add(org.crm.entity.Plan)
	 */
	@Override
	public boolean add(Plan plan) {
		String sql = "insert into plan(chanceId,planDate,planTodo,planResult) values(?,?,?,?)";
		if (this.jdbcTemplate.update(sql, new Object[] { plan.getChanceId(),
				plan.getPlanDate(), plan.getPlanTodo(), plan.getPlanResult() }) == 1) {
			return true;
		}

		return false;
	}

	/*
	 * ɾ��һ���ͻ������ƻ� (non-Javadoc)
	 * 
	 * @see org.crm.dao.PlanDao#del(int)
	 */
	/*
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.impl.PlanDao#del(int)
	 */
	@Override
	public boolean del(int id) {
		String sql = "delete from plan where id=?";
		if (this.jdbcTemplate.update(sql, id) == 1) {
			return true;
		}
		return false;
	}

	/*
	 * ��ϸ��һ�������ƻ� (non-Javadoc)
	 * 
	 * @see org.crm.dao.PlanDao#update(org.crm.entity.Plan)
	 */
	/*
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.impl.PlanDao#update(org.crm.entity.Plan)
	 */
	@Override
	public boolean update(Plan plan) {
		String sql = "update plan set planTodo=? where id=?";
		if (jdbcTemplate.update(sql,
				new Object[] { plan.getPlanTodo(), plan.getId() }) == 1) {
			return true;
		}
		return false;
	}

	/*
	 * ͨ����Ż��һ�������ƻ����� (non-Javadoc)
	 * 
	 * @see org.crm.dao.PlanDao#getById(int)
	 */
	/*
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.impl.PlanDao#getById(int)
	 */
	@Override
	public Plan getById(int id) {

		return this.jdbcTemplate
				.queryForObject(
						"select id,chanceId,palnDate,planResult,planTodo from plan where id=?",
						new Object[] { id }, new RowMapper<Plan>() {

							@Override
							public Plan mapRow(ResultSet rs, int arg1)
									throws SQLException {
								Plan p = new Plan();
								p.setId(rs.getInt("id"));
								p.setChanceId(rs.getInt("chanceId"));
								p.setPlanDate(rs.getString("planDate"));
								p.setPlanResult(rs.getString("planResult"));
								p.setPlanTodo(rs.getString("planTodo"));

								return p;
							}
						});
	}

	/*
	 * ��ѯ���п����ƻ� (non-Javadoc)
	 * 
	 * @see org.crm.dao.PlanDao#list()
	 */
	/*
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.impl.PlanDao#list()
	 */
	@Override
	public List<Plan> list() {
		// TODO ��ѯ���еĿ����ƻ�
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.impl.PlanDao#list(int)
	 */
	@Override
	public List<Plan> list(int chanceId) {
		String sql = "select * from plan where chanceId=?";
		return this.jdbcTemplate.query(sql, new Object[] { chanceId },
				new RowMapper<Plan>() {

					@Override
					public Plan mapRow(ResultSet rs, int arg1)
							throws SQLException {
						Plan p = new Plan();
						p.setId(rs.getInt("id"));
						p.setChanceId(rs.getInt("chanceId"));
						p.setPlanDate(rs.getString("planDate"));
						p.setPlanResult(rs.getString("planResult"));
						p.setPlanTodo(rs.getString("planTodo"));

						return p;
					}
				});
	}
}
