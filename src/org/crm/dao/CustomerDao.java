package org.crm.dao;

import java.util.List;

import org.crm.entity.Customer;

public interface CustomerDao {

	/**
	 * ֻ���ÿͻ�������
	 * 
	 * @param customer
	 * @return
	 */
	public abstract int add(String customerName);

	/**
	 * ����
	 * 
	 * @param customer
	 * @return
	 */
	public abstract boolean update(Customer customer);

	/**
	 * ���ݱ�Ÿ���״̬
	 * 
	 * @param id
	 * @return
	 */
	public abstract boolean updateSatate(int id, int stateId);

	/**
	 * ɾ��
	 * 
	 * @param id
	 * @return
	 */
	public abstract boolean delete(int id);

	/**
	 * ��������
	 * 
	 * @return
	 */
	public abstract List<Customer> find();

	public List<Customer> findSmall();

	/**
	 * ���ݱ�Ż��
	 * 
	 * @param id
	 * @return
	 */
	public abstract Customer get(int id);

	/**
	 * ��С�����customer
	 * 
	 * @param id
	 * @return customer����ֻ��id��name����
	 */
	public abstract Customer getCustomerSmall(int id);

	public abstract int getTotalCount();
}