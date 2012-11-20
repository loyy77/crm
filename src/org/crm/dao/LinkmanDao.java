package org.crm.dao;

import java.util.List;

import org.crm.entity.Linkman;

public interface LinkmanDao {

	/**
	 * 添加联系人
	 * 
	 * @param linkman
	 * @return
	 */
	public abstract boolean add(Linkman linkman);

	/**
	 * 更新
	 * 
	 * @param linkman
	 * @return
	 */
	public abstract boolean update(Linkman linkman);

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
	public abstract List<Linkman> find();

	public List<Linkman> findByCustId(int custId);

	/**
	 * 根据编号获得
	 * 
	 * @param id
	 * @return
	 */
	public abstract Linkman get(int id);

	public abstract int getTotalCount();

}