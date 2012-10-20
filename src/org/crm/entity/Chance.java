package org.crm.entity;

import java.util.Date;

public class Chance {
	private int id;
	private String source;
	private float rate;
	private String title;
	private String linkMan;
	private String linkPhone;
	private String description;
	private int createId;
	private Date createDate;
	private int assignId;
	private Date assignDate;
	private int state;

	public Chance() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Chance(int id, String source, float rate, String title,
			String linkMan, String linkPhone, String description, int createId,
			Date createDate, int assignId, Date assignDate, int state) {
		super();
		this.id = id;
		this.source = source;
		this.rate = rate;
		this.title = title;
		this.linkMan = linkMan;
		this.linkPhone = linkPhone;
		this.description = description;
		this.createId = createId;
		this.createDate = createDate;
		this.assignId = assignId;
		this.assignDate = assignDate;
		this.state = state;
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

	public int getCreateId() {
		return createId;
	}

	public void setCreateId(int createId) {
		this.createId = createId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getAssignId() {
		return assignId;
	}

	public void setAssignId(int assignId) {
		this.assignId = assignId;
	}

	public Date getAssignDate() {
		return assignDate;
	}

	public void setAssignDate(Date assignDate) {
		this.assignDate = assignDate;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

}
