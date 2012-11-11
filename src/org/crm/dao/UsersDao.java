package org.crm.dao;

import java.util.List;

import org.crm.entity.Users;

public interface UsersDao {

	/**
	 * 锟斤拷锟斤拷没锟� *
	 * 
	 * @param user
	 */
	public abstract void add(Users user);

	/**
	 * 锟斤拷锟斤拷锟矫伙拷锟斤拷息锟斤拷锟缴革拷锟铰碉拷锟斤拷锟斤拷锟叫ｏ拷锟斤拷录锟斤拷锟诫，锟斤拷实锟斤拷锟斤拷锟缴拷锟脚ｏ拷锟斤拷牵锟� *
	 * 
	 * @param user
	 */
	public abstract void update(Users user);

	/**
	 * 锟斤拷询锟斤拷锟斤拷锟矫伙拷
	 * 
	 * @return 锟斤拷锟斤拷锟矫伙拷锟斤拷锟叫憋拷
	 */
	public abstract List<Users> findAll();

	/**
	 * 通锟斤拷锟矫伙拷锟侥憋拷挪锟窖� *
	 * 
	 * @param
	 * @return 通锟斤拷Id锟斤拷询锟矫碉拷锟斤拷锟矫伙拷锟斤拷锟斤拷
	 */
	public abstract Users getByNameAndPassword(String loginName,
			String loginPass);

	public abstract Users getById(int userId);

	/**
	 * 通锟斤拷锟矫伙拷锟斤拷录锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷没锟斤拷锟絀d
	 */
	public abstract boolean checkUserIsExist(String loginname, String loginpass);

}