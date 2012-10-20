package org.crm.entity;

public class Dict {
	private int id;
	private String dictType;
	private String dictItem;
	private String dictValue;
	private boolean editable;

	public Dict() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Dict(int id, String dictType, String dictItem, String dictValue,
			boolean editable) {
		super();
		this.id = id;
		this.dictType = dictType;
		this.dictItem = dictItem;
		this.dictValue = dictValue;
		this.editable = editable;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDictType() {
		return dictType;
	}

	public void setDictType(String dictType) {
		this.dictType = dictType;
	}

	public String getDictItem() {
		return dictItem;
	}

	public void setDictItem(String dictItem) {
		this.dictItem = dictItem;
	}

	public String getDictValue() {
		return dictValue;
	}

	public void setDictValue(String dictValue) {
		this.dictValue = dictValue;
	}

	public boolean isEditable() {
		return editable;
	}

	public void setEditable(boolean editable) {
		this.editable = editable;
	}

}
