package org.crm.dao;

import java.util.List;

import org.crm.entity.Customer;

public interface CustomerDao {

	/**
	 * 只设置客户的名字
	 * 
	 * @param customer
	 * @return
	 */
	public abstract int add(String customerName);

	/**
	 * 更新
	 * 
	 * @param customer
	 * @return
	 */
	public abstract boolean update(Customer customer);

	/**
	 * 删除
	 * 
	 * @param id
	 * @return
	 */
	public abstract boolean delete(int id);

	/**
	 * 查找所有
	 * 
	 * @return
	 */
	public abstract List<Customer> find();

	/**
	 * 根据编号获得
	 * 
	 * @param id
	 * @return
	 */
	public abstract Customer get(int id);

	/**
	 * 最小体积的customer
	 * 
	 * @param id
	 * @return customer对象只有id和name属性
	 */
	public abstract Customer getCustomerSmall(int id);
}