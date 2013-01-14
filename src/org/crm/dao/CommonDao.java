package org.crm.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class CommonDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/**
	 * 返回指定表名中的总记录数
	 * 
	 * @param tableName
	 * @return
	 */
	public int getTotalCount(String tableName, String where) {
		return jdbcTemplate.queryForInt("select count(*) from ? ", tableName);

	}
}
