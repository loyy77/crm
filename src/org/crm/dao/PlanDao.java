package org.crm.dao;

import java.util.List;

import org.crm.entity.Plan;

public interface PlanDao {

	/*
	 * 添加一个针对销售机会的开发计划
	 * 
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.PlanDao#add(org.crm.entity.Plan)
	 */
	public abstract boolean add(Plan plan);

	/*
	 * 删除一条客户开发计划 (non-Javadoc)
	 * 
	 * @see org.crm.dao.PlanDao#del(int)
	 */
	public abstract boolean del(int id);

	/*
	 * 更细腻一条开发计划 (non-Javadoc)
	 * 
	 * @see org.crm.dao.PlanDao#update(org.crm.entity.Plan)
	 */
	public abstract boolean update(Plan plan);

	/*
	 * 通过编号获得一个开发计划对象 (non-Javadoc)
	 * 
	 * @see org.crm.dao.PlanDao#getById(int)
	 */
	public abstract Plan getById(int id);

	/*
	 * 查询所有开发计划 (non-Javadoc)
	 * 
	 * @see org.crm.dao.PlanDao#list()
	 */
	public abstract List<Plan> list();

	/**
	 * 根据销售计划编号查询所有对应的开发计划
	 * 
	 * @author lishixi
	 * @return 指定销售计划编号的所有开发计划对象的列表
	 */
	public abstract List<Plan> list(int chanceId);

}