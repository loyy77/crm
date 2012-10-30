package org.crm.dao;

import java.util.List;

import org.crm.entity.Users;

public interface UsersDao {

	/**
	 * ����û�
	 * 
	 * @param user
	 */
	public abstract void add(Users user);

	/**
	 * �����û���Ϣ���ɸ��µ������У���¼���룬��ʵ�����ɫ��ţ���ǣ�
	 * 
	 * @param user
	 */
	public abstract void update(Users user);

	/**
	 * ��ѯ�����û�
	 * 
	 * @return �����û����б�
	 */
	public abstract List<Users> findAll();

	/**
	 * ͨ���û��ı�Ų�ѯ
	 * 
	 * @param
	 * @return ͨ��Id��ѯ�õ����û�����
	 */
	public abstract Users getByNameAndPassword(String loginName,
			String loginPass);

	public abstract Users getById(int userId);

	/**
	 * ͨ���û���¼����������û���Id
	 */
	public abstract boolean checkUserIsExist(String loginname, String loginpass);

}