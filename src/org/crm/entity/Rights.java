package org.crm.entity;

public class Rights {
	private int rightId;
	private int parentId;
	private String rightName;
	private String rightUrl;
	private String rightDesc;

	public Rights() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Rights(int rightId, int parentId, String rightName, String rightUrl,
			String rightDesc) {
		super();
		this.rightId = rightId;
		this.parentId = parentId;
		this.rightName = rightName;
		this.rightUrl = rightUrl;
		this.rightDesc = rightDesc;
	}

	public int getRightId() {
		return rightId;
	}

	public void setRightId(int rightId) {
		this.rightId = rightId;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public String getRightName() {
		return rightName;
	}

	public void setRightName(String rightName) {
		this.rightName = rightName;
	}

	public String getRightUrl() {
		return rightUrl;
	}

	public void setRightUrl(String rightUrl) {
		this.rightUrl = rightUrl;
	}

	public String getRightDesc() {
		return rightDesc;
	}

	public void setRightDesc(String rightDesc) {
		this.rightDesc = rightDesc;
	}

}
