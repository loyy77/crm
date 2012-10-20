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
	 * ����û�
	 * 
	 * @param user
	 */
	public void add(Users user) {
		String sql = "insert into Users(userId,loginName,loginPass,trueName,roleId,flag) values(null,?,?,?,?,?)";
		jdbcTemplate.update(sql, user.getLoginName(), user.getLoginPass(),
				user.getTrueName(), user.getRoleId(), user.isFlag());
	}

	/**
	 * �����û���Ϣ���ɸ��µ������У���¼���룬��ʵ��������ɫ��ţ���ǣ�
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

		String sql = "select userId,loginname,loginpass,truename,roleId,flag from users where userId=?";

		Users user = jdbcTemplate.queryForObject(sql, new Object[] { userId },
				new UsersMapper());
		return user;

	}

	/**
	 * ͨ���û���¼�����������û���Id
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