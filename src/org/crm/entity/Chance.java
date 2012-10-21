package org.crm.entity;

import java.util.Date;

public class Chance {
	private int id;
	private String source;
	private String customerName;
	private float rate;
	private String title;
	private String linkMan;
	private String linkPhone;
	private String description;
	private Users createId;//创建人
	private String createDate;
	private Users assignId;//指派给
	private String assignDate;
	private int state;

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public Chance() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public float getRate() {
		return rate;
	}

	public void setRate(float rate) {
		this.rate = rate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLinkMan() {
		return linkMan;
	}

	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
	}

	public String getLinkPhone() {
		return linkPhone;
	}

	public void setLinkPhone(String linkPhone) {
		this.linkPhone = linkPhone;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}




	public Users getCreateId() {
		return createId;
	}

	public void setCreateId(Users createId) {
		this.createId = createId;
	}

	public Users getAssignId() {
		return assignId;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getAssignDate() {
		return assignDate;
	}

	public void setAssignDate(String assignDate) {
		this.assignDate = assignDate;
	}

	public void setAssignId(Users assignId) {
		this.assignId = assignId;
	}


	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

}
