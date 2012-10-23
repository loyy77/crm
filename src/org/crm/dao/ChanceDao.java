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
	
	private int REMOVED=1; //状态被标记为删除的销售机会
	
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
		String sql = "select id,customerName,title,linkMan,linkPhone,createDate from chance where state !=1";

		return jdbcTemplate.query(sql, new ChanceMapperSimple());
	}
	/**
	 * 删除一个机会（不是直接执行物理删除，只是改个标记）
	 * @param id
	 * @return
	 */
	public boolean del(int id){
		String sql="update chance  set state = ? where id=?";
		int rst=this.jdbcTemplate.update(sql, REMOVED,id);
		if(rst==1){
			return true;
			
		}return false;
	}
	/**
	 * 指派一个机会给营销人员
	 * @param chance
	 * @return
	 */
	public boolean update(int chanceId,int assignId){
		
		String sql="update chance set assginId=? where id=? and state != 1 ";
		if(this.jdbcTemplate.update(sql,assignId,chanceId)==1){
			return true;
		}
		
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
