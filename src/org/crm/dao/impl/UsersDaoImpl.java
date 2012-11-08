package org.crm.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.crm.dao.UsersDao;
import org.crm.entity.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

@Component
public class UsersDaoImpl implements UsersDao {
@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	/* (non-Javadoc)
	 * @see org.crm.dao.impl.UsersDao#add(org.crm.entity.Users)
	 */
	@Override
	public void add(Users user) {
		String sql = "insert into Users(userId,loginName,loginPass,trueName,roleId,flag) values(null,?,?,?,?,?)";
		jdbcTemplate.update(sql, user.getLoginName(), user.getLoginPass(),
				user.getTrueName(), user.getRoleId(), user.isFlag());
	}

	/* (non-Javadoc)
	 * @see org.crm.dao.impl.UsersDao#update(org.crm.entity.Users)
	 */
	@Override
	public void update(Users user) {
		String sql = "UPDATE Users set loginPass=?,trueName=?,roleId=?,flag=? where userId=? or (loginName=? and loginPass=?)";
		jdbcTemplate.update(sql, user.getLoginPass(), user.getTrueName(),
				user.getRoleId(), user.isFlag(), user.getUserId(),
				user.getLoginName(), user.getLoginPass());
	}

	/* (non-Javadoc)
	 * @see org.crm.dao.impl.UsersDao#findAll()
	 */
	@Override
	public List<Users> findAll() {
		return jdbcTemplate.queryForList("select * from users", Users.class);
	}

	/* (non-Javadoc)
	 * @see org.crm.dao.impl.UsersDao#getByNameAndPassword(java.lang.String, java.lang.String)
	 */
	@Override
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
	
	/* (non-Javadoc)
	 * @see org.crm.dao.impl.UsersDao#getById(int)
	 */
	@Override
	public Users getById(int userId){
		Users u=null;
		try{
			u=this.jdbcTemplate.queryForObject("select * from users where userid=?",new Object[]{userId},new RowMapper<Users>() {

				@Override
				public Users mapRow(ResultSet rs, int arg1) throws SQLException {
					Users user = new Users();

					user.setUserId(rs.getInt("userId"));
					user.setLoginName(rs.getString("loginname"));
					user.setLoginPass(rs.getString("loginpass"));
					user.setTrueName(rs.getString("truename"));
					user.setRoleId(rs.getInt("roleId"));
					user.setFlag(rs.getBoolean("flag"));

					return user;
				}
			});
		}catch(EmptyResultDataAccessException ex){return null;}
		
		
		
		return u;
	}

	/* (non-Javadoc)
	 * @see org.crm.dao.impl.UsersDao#checkUserIsExist(java.lang.String, java.lang.String)
	 */
	@Override
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