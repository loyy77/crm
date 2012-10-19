package org.crm.dao;

import java.util.List;

import org.crm.entity.Users;
import org.springframework.jdbc.core.JdbcTemplate;
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
				user.getTureName(), user.getRoleId(), user.isFlag());
	}

	/**
	 * 更新用户信息（可更新的属性有：登录密码，真实姓名，角色编号，标记）
	 * 
	 * @param user
	 */
	public void update(Users user) {
		String sql = "UPDATE Users set loginPass=?,trueName=?,roleId=?,flag=? where userId=? or (loginName=? and loginPass=?)";
		jdbcTemplate.update(sql, user.getLoginPass(), user.getTureName(),
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
		return jdbcTemplate.queryForObject(
				"select * from users where userId=?", Users.class, userId);

	}

	/**
	 * 通过用户登录名和密码获得用户的Id
	 */
	public Users getUserIdByLoignnameAndLoginpass(String loginname,
			String loginpass) {
		return jdbcTemplate
				.queryForObject(
						"select userId,loginname,truename,roleId,flag from users where loginname=? and loginpass=?",
						new String[] { loginname, loginpass }, Users.class);

	}

}
