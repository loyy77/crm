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
	 * ����û�
	 * 
	 * @param user
	 */
	public void add(Users user) {
		String sql = "insert into Users(userId,loginName,loginPass,trueName,roleId,flag) values(null,?,?,?,?,?)";
		jdbcTemplate.update(sql, user.getLoginName(), user.getLoginPass(),
				user.getTureName(), user.getRoleId(), user.isFlag());
	}

	/**
	 * �����û���Ϣ���ɸ��µ������У���¼���룬��ʵ��������ɫ��ţ���ǣ�
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
	 * ��ѯ�����û�
	 * 
	 * @return �����û����б�
	 */
	public List<Users> findAll() {
		return jdbcTemplate.queryForList("select * from users", Users.class);
	}

	/**
	 * ͨ���û��ı�Ų�ѯ
	 * 
	 * @param userId
	 * @return ͨ��Id��ѯ�õ����û�����
	 */
	public Users getById(int userId) {
		return jdbcTemplate.queryForObject(
				"select * from users where userId=?", Users.class, userId);

	}

	/**
	 * ͨ���û���¼�����������û���Id
	 */
	public Users getUserIdByLoignnameAndLoginpass(String loginname,
			String loginpass) {
		return jdbcTemplate
				.queryForObject(
						"select userId,loginname,truename,roleId,flag from users where loginname=? and loginpass=?",
						new String[] { loginname, loginpass }, Users.class);

	}

}
