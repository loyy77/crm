package org.crm.dao;

import java.util.List;

import org.crm.entity.Chance;

public interface ChanceDao {

	/**
	 * 添加一个销售机会
	 * 
	 * @param chance
	 * @return
	 */
	public abstract boolean add(Chance chance);

	/**
	 * 所有机会的列表
	 * 
	 * @return
	 */
	public abstract List<Chance> list();
	
	public abstract List<Chance> list(int page,int pageSize);

	/**
	 * 删除一个机会（不是直接执行物理删除，只是改个标记）
	 * @param id
	 * @return
	 */
	public abstract boolean del(int id);

	/**
	 * 指派一个机会给营销人员
	 * @param chance
	 * @return
	 */
	public abstract boolean update(int chanceId, int assignId);

	/**
	 * 通过id获得一个chance
	 * @param id
	 * @return
	 */
	public abstract Chance get(int id);
	
	
	public abstract boolean update(Chance chance);
	/**
	 *获得总记录数
	 * @return
	 */
	public abstract int getTotalCount();

}