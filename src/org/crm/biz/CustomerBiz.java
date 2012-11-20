package org.crm.biz;

import java.util.List;

import org.crm.dao.CustomerDao;
import org.crm.entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CustomerBiz {
	@Autowired
	private CustomerDao customerDao;

	public List<Customer> find() {
		return customerDao.findSmall();
	}

	public int getTotalCount() {
		return customerDao.getTotalCount();
	}

	public Customer get(int id) {
		return customerDao.get(id);
	}

	public boolean udpate(Customer customer) {
		return customerDao.update(customer);
	}
}
