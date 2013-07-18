package org.crm.entity;

import java.sql.Date;

public class Activity {
	private int id;
	private Customer customerId;
    private String customerName;
	private Date atvDate;
	private String place;
    private String title;

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String custmerName) {
        this.customerName = custmerName;
    }

    public Activity(int id,Customer customerId, Date atvDate, String place, String title, String description) {
        this.id=id;
        this.customerId = customerId;
        this.atvDate = atvDate;
        this.place = place;
        this.title = title;
        this.description = description;
    }

    private String description;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
	public Customer getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Customer customerId) {
		this.customerId = customerId;
	}

	public Date getAtvDate() {
		return atvDate;
	}

	public void setAtvDate(Date atvDate) {
		this.atvDate = atvDate;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Activity(int id, Customer customerId, Date atvDate, String place,
			String description) {
		super();
		this.id = id;
		this.customerId = customerId;
		this.atvDate = atvDate;
		this.place = place;
		this.description = description;
	}

	public Activity() {
		super();
		// TODO Auto-generated constructor stub
	}

}
