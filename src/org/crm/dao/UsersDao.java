package org.crm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.crm.entity.Users;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

@Component
public class UsersDao {

	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	/**
	 * 添加用户
	 * 
	 * @param user
	 */
	public void add(Users user) {
		String sql = "insert into Users(userId,loginName,loginPass,trueName,roleId,flag) values(null,?,?,?,?,?)";
		jdbcTemplate.update(sql, user.getLoginName(), user.getLoginPass(),
				user.getTrueName(), user.getRoleId(), user.isFlag());
	}

	/**
	 * 更新用户信息（可更新的属性有：登录密码，真实姓名，角色编号，标记）
	 * 
	 * @param user
	 */
	public void update(Users user) {
		String sql = "UPDATE Users set loginPass=?,trueName=?,roleId=?,flag=? where userId=? or (loginName=? and loginPass=?)";
		jdbcTemplate.update(sql, user.getLoginPass(), user.getTrueName(),
				user.getRoleId(), user.isFlag(), user.getUserId(),
				user.getLoginName(), user.getLoginPass());
	}

	/**
	 * 查询所有用户
	 * 
	 * @return 所有用户的列表
	 */
	public List<Users> findAll() {
		return jdbcTemplate.queryForList("select * from users", Users.class);
	}

	/**
	 * 通过用户的编号查询
	 * 
	 * @param userId
	 * @return 通过Id查询得到的用户对象
	 */
	public Users getById(int userId) {

		String sql = "select userId,loginname,loginpass,truename,roleId,flag from users where userId=?";

		Users user = jdbcTemplate.queryForObject(sql, new Object[] { userId },
				new UsersMapper());
		return user;

	}

	/**
	 * 通过用户登录名和密码获得用户的Id
	 */
	public int getUserIdByLoignnameAndLoginpass(String loginname,
			String loginpass) {
		// ,loginname,truename,roleId,flag
		String userId = jdbcTemplate.queryForObject(
				"select userId from users where loginname=? and loginpass=?",
				new Object[] { loginname, loginpass }, String.class);
		return Integer.valueOf(userId);

	}
}

class UsersMapper implements RowMapper<Users> {

	@Override
	public Users mapRow(ResultSet rs, int rowNum) throws SQLException {
		Users user = new Users();

		user.setUserId(rs.getInt("userId"));
		user.setLoginName(rs.getString("loginname"));
		user.setLoginPass(rs.getString("loginpass"));
		user.setTrueName(rs.getString("truename"));
		user.setRoleId(rs.getInt("roleId"));
		user.setFlag(rs.getBoolean("flag"));

		return user;
	}

}