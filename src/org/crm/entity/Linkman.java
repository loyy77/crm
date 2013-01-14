package org.crm.entity;

public class Linkman {
	private int id;
	private Customer customerId;
	private String name;
	private String sex;
	private String position;
	private String tel;
	private String mobile;
	private String memo;

	public Linkman() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Linkman(String name, String tel) {
		super();
		this.name = name;
		this.tel = tel;
	}

	public Linkman(int id, Customer customerId, String name, String sex,
			String position, String tel, String mobile, String memo) {
		super();
		this.id = id;
		this.customerId = customerId;
		this.name = name;
		this.sex = sex;
		this.position = position;
		this.tel = tel;
		this.mobile = mobile;
		this.memo = memo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Customer getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Customer customerId) {
		this.customerId = customerId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	@Override
	public String toString() {
		return "Linkman [id=" + id + ", customerId=" + customerId + ", name="
				+ name + ", sex=" + sex + ", position=" + position + ", tel="
				+ tel + ", mobile=" + mobile + ", memo=" + memo + "]";
	}

}
