package org.crm.entity;

import java.util.Date;

public class Plan {
	private int id;
	private int chanceId;
	private Date planDate;
	private String planTodo;
	private String planResult;

	public Plan(int id, int chanceId, Date planDate, String planTodo,
			String planResult) {
		super();
		this.id = id;
		this.chanceId = chanceId;
		this.planDate = planDate;
		this.planTodo = planTodo;
		this.planResult = planResult;
	}

	public Plan() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getChanceId() {
		return chanceId;
	}

	public void setChanceId(int chanceId) {
		this.chanceId = chanceId;
	}

	public Date getPlanDate() {
		return planDate;
	}

	public void setPlanDate(Date planDate) {
		this.planDate = planDate;
	}

	public String getPlanTodo() {
		return planTodo;
	}

	public void setPlanTodo(String planTodo) {
		this.planTodo = planTodo;
	}

	public String getPlanResult() {
		return planResult;
	}

	public void setPlanResult(String planResult) {
		this.planResult = planResult;
	}

}
