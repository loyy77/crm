package org.crm.entity;

import org.hibernate.validator.constraints.NotEmpty;

public class Users {
	private int userId;
	@NotEmpty
	private String loginName;
	private String trueName;
	private String loginPass;
	private boolean flag;
	private int roleId;

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

	public String getLoginPass() {
		return loginPass;
	}

	public String getTrueName() {
		return trueName;
	}

	public void setTrueName(String trueName) {
		this.trueName = trueName;
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

	@Override
	public String toString() {
		return "Users{" + "userId=" + userId + ", loginName=" + loginName
				+ ", tureName=" + trueName + ", loginPass=" + loginPass
				+ ", flag=" + flag + ", roleId=" + roleId + '}';
	}

}
