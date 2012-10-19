package org.crm.entity;

public class Users {
	private int userId;
	private String loginName;
	private String tureName;
	private String loginPass;
	private boolean flag;
	private int roleId;

	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Users(int userId, String loginName, String tureName,
			String loginPass, boolean flag, int roleId) {
		super();
		this.userId = userId;
		this.loginName = loginName;
		this.tureName = tureName;
		this.loginPass = loginPass;
		this.flag = flag;
		this.roleId = roleId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getTureName() {
		return tureName;
	}

	public void setTureName(String tureName) {
		this.tureName = tureName;
	}

	public String getLoginPass() {
		return loginPass;
	}

	public void setLoginPass(String loginPass) {
		this.loginPass = loginPass;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

}
