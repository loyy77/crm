package org.crm.common;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Utils {
	/**
	 * ��õ�ǰʱ�� ��ʽΪ yyyy-MM-dd HH:mm:ss
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
	 * ��ʽ��jsonΪligerGrid��ʶ��ĸ�ʽ
	 * 
	 * @param source
	 * @param totalCount
	 *            �ܼ�¼��
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
