package org.crm.dao;

import java.util.List;

import org.crm.entity.Dict;

public interface DictDao {

	/**
	 * 根据类型查
	 * 
	 * @param dictType
	 * @return
	 */
	public abstract List<Dict> findByDictType(String dictType);

	public abstract String findById(int id);

}