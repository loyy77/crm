package org.crm.biz;

import java.util.List;

import org.crm.dao.ChanceDao;
import org.crm.entity.Chance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
@Component
public class ChanceBiz {
	@Autowired
	private ChanceDao chanceDao;
	
	public void add(Chance chance){
		chanceDao.add(chance);
	}
	
	public List<Chance> list(){
		return chanceDao.list();
	}
	
	public boolean del(int chanceId){
		return chanceDao.del(chanceId);
	}
}
