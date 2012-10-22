package org.crm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.crm.entity.Chance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

@Component
public class ChanceDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/**
	 * 添加一个销售机会
	 * 
	 * @param chance
	 * @return
	 */
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

	/**
	 * 所有机会的列表
	 * 
	 * @return
	 */
	public List<Chance> list() {
		String sql = "select id,customerName,title,linkMan,linkPhone,createDate from chance";

		return jdbcTemplate.query(sql, new ChanceMapperSimple());
	}
	/**
	 * 删除一个机会（不是直接执行物理删除，只是改个标记）
	 * @param id
	 * @return
	 */
	public boolean del(int id){
		String sql="delete from chance where id=?";
		int rst=this.jdbcTemplate.update(sql, id);
		if(rst==1){
			return true;
			
		}return false;
	}
	/**
	 * 修改营销机会的信息
	 * @param chance
	 * @return
	 */
	public boolean update(Chance chance){
		
		String sql="update chance set ";
		return false;
	}

}

class ChanceMapper implements RowMapper {

	@Override
	public Object mapRow(ResultSet rs, int arg1) throws SQLException {
		Chance chance = new Chance();
		chance.setAssignDate(rs.getString("assignDate"));
		chance.setAssignId(new UsersDao().getById(rs.getInt("assignId")));
		chance.setCreateDate(rs.getString("createDate"));
		chance.setCreateId(new UsersDao().getById(rs.getInt("createId")));
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
