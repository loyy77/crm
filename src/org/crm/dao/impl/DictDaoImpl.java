package org.crm.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.crm.dao.DictDao;
import org.crm.entity.Dict;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

@Component
public class DictDaoImpl implements DictDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.impl.DictDao#findByDictType(java.lang.String)
	 */
	@Override
	public List<Dict> findByDictType(String dictType) {
		String sql = "select * from dict where dictType=?";
		return jdbcTemplate.query(sql, new Object[] { dictType },
				new RowMapper<Dict>() {

					@Override
					public Dict mapRow(ResultSet rs, int arg1)
							throws SQLException {
						Dict d = new Dict();
						d.setId(rs.getInt("id"));
						d.setDictItem(rs.getString("dictItem"));
						d.setDictType(rs.getString("dictType"));
						d.setDictValue(rs.getString("dictValue"));
						d.setEditable(rs.getBoolean("editable"));
						return d;
					}
				});
	}

}
