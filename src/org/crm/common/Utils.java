package org.crm.common;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Utils {
	/**
	 * 获得当前时间 格式为 yyyy-MM-dd HH:mm:ss
	 * 
	 * @return
	 */
	public String getNowDate() {

		SimpleDateFormat tempDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String datetime = tempDate.format(new java.util.Date());
		return datetime;
	}

	public Date StringToDate(String dateObject) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return format.parse(dateObject);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 格式化json为ligerGrid能识别的格式
	 * 
	 * @param source
	 * @param totalCount
	 *            总记录数
	 * @return
	 */
	public String formatLigerGridJSON(String source, int totalCount) {
		String rst = "";
		StringBuffer sb = new StringBuffer();
		sb.append("{\"Rows\":");
		sb.append(source);
		sb.append(",");
		sb.append("\"total\":");
		sb.append(totalCount);
		sb.append("}");
		rst = sb.toString();
		return rst;

	}
}
