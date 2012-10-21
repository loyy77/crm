package org.crm.common;

import java.text.SimpleDateFormat;

public class Utils {
	public  String getNowDate(){
		SimpleDateFormat tempDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String datetime = tempDate.format(new java.util.Date());
		return datetime;
	}
}
