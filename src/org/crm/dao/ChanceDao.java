package org.crm.dao;

import java.util.List;

import org.crm.entity.Chance;

public interface ChanceDao {

	/**
	 * 娣诲姞涓�釜閿�敭鏈轰細
	 * 
	 * @param chance
	 * @return
	 */
	public abstract boolean add(Chance chance);

	/**
	 * 鎵�湁鏈轰細鐨勫垪琛�
	 * 
	 * @return
	 */
	public abstract List<Chance> list();

	public abstract List<Chance> list(int page, int pageSize);

	/**
	 * 鍒犻櫎涓�釜鏈轰細锛堜笉鏄洿鎺ユ墽琛岀墿鐞锛� * @param id
	 * 
	 * @return
	 */
	public abstract boolean del(int id);

	/**
	 * 鎸囨淳涓�釜鏈轰細缁欒惀閿�汉鍛�* @param chance
	 * 
	 * @return
	 */
	public abstract boolean update(int chanceId, int assignId);

	/**
	 * 閫氳繃id鑾峰緱涓�釜chance
	 * 
	 * @param id
	 * @return
	 */
	public abstract Chance get(int id);

	public abstract boolean update(Chance chance);

	/**
	 * 鑾峰緱鎬昏褰� *
	 * 
	 * @return
	 */
	public abstract int getTotalCount();

	public abstract boolean assign(Chance chance);

	public abstract boolean updateState(int chanceId, int chanceState);

}