package org.crm.dao;

import java.util.List;

import org.crm.entity.Linkman;

public interface LinkmanDao {

	/**
	 * �����ϵ��
	 * 
	 * @param linkman
	 * @return
	 */
	public abstract boolean add(Linkman linkman);

	/**
	 * ����
	 * 
	 * @param linkman
	 * @return
	 */
	public abstract boolean update(Linkman linkman);

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
	public abstract List<Linkman> find();

	public List<Linkman> findByCustId(int custId);

	/**
	 * ���ݱ�Ż��
	 * 
	 * @param id
	 * @return
	 */
	public abstract Linkman get(int id);

	public abstract int getTotalCount();

}