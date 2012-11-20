package org.crm.dao;

import java.util.List;

import org.crm.entity.Dict;

public interface DictDao {

	/**
	 * �������Ͳ�
	 * 
	 * @param dictType
	 * @return
	 */
	public abstract List<Dict> findByDictType(String dictType);

	public abstract String findById(int id);

}