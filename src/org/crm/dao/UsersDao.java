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
	 * �����û���Ϣ���ɸ��µ������У���¼���룬��ʵ�����ɫ��ţ���ǣ�
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
	 * @param
	 * @return ͨ��Id��ѯ�õ����û�����
	 */
	public Users getByNameAndPassword(String loginName,String loginPass) {
		if (this.checkUserIsExist(loginName, loginPass)) {
			String sql = "select userId,loginname,loginpass,truename,roleId,flag from users where loginname=? and loginpass=?";

			Users u = jdbcTemplate.queryForObject(sql,
					new Object[] { loginName, loginPass},
					new UsersMapper());
			return u;
		}
		return null;

	}
	
	public Users getById(int userId){
		return jdbcTemplate.queryForObject("select * from users where userid=?",new Object[]{userId},new UsersMapper());
	}

	/**
	 * ͨ���û���¼����������û���Id
	 */
	public boolean checkUserIsExist(String loginname, String loginpass) {
		// ,loginname,truename,roleId,flag
		String sql = "select count(*) from users where loginname=? and loginpass=?";
		String sql1 = "select userId from users where loginname=? and loginpass=?";
		int count = jdbcTemplate.queryForInt(sql, new Object[] { loginname,
				loginpass });
		
		if (count == 1) {
			return true;
		}
		return false;

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