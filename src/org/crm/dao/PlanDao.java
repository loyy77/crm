package org.crm.dao;

import java.util.List;

import org.crm.entity.Plan;

public interface PlanDao {

	/*
	 * ���һ��������ۻ���Ŀ����ƻ�
	 * 
	 * (non-Javadoc)
	 * 
	 * @see org.crm.dao.PlanDao#add(org.crm.entity.Plan)
	 */
	public abstract boolean add(Plan plan);

	/*
	 * ɾ��һ���ͻ������ƻ� (non-Javadoc)
	 * 
	 * @see org.crm.dao.PlanDao#del(int)
	 */
	public abstract boolean del(int id);

	/*
	 * ��ϸ��һ�������ƻ� (non-Javadoc)
	 * 
	 * @see org.crm.dao.PlanDao#update(org.crm.entity.Plan)
	 */
	public abstract boolean update(Plan plan);

	/*
	 * ͨ����Ż��һ�������ƻ����� (non-Javadoc)
	 * 
	 * @see org.crm.dao.PlanDao#getById(int)
	 */
	public abstract Plan getById(int id);

	/*
	 * ��ѯ���п����ƻ� (non-Javadoc)
	 * 
	 * @see org.crm.dao.PlanDao#list()
	 */
	public abstract List<Plan> list();

	/**
	 * �������ۼƻ���Ų�ѯ���ж�Ӧ�Ŀ����ƻ�
	 * 
	 * @author lishixi
	 * @return ָ�����ۼƻ���ŵ����п����ƻ�������б�
	 */
	public abstract List<Plan> list(int chanceId);

}