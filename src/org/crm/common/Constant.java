package org.crm.common;

/**
 * 
 * @author lishixi
 * 
 */
public interface Constant {
	/**
	 * ����Ա <br/> {@value}
	 * 
	 * @author lishixi
	 * 
	 * @category Ȩ��-��ɫ
	 */
	public static final int ROLE_ADMIN = 1;
	/**
	 * �������� <br/> {@value}
	 * 
	 * @author lishixi
	 * @category Ȩ��-��ɫ
	 */
	public static final int ROLE_SALES_SUPERVISOR = 2;
	/**
	 * �ͻ�����<br/> {@value}
	 * 
	 * @author lishixi
	 * @category Ȩ��-��ɫ
	 */
	public static final int ROLE_CUSTOMER_MANAGER = 3;
	/**
	 * ��������Ա<br/> {@value}
	 * 
	 * @author lishixi
	 * @category Ȩ��-��ɫ
	 */
	public static final int ROLE_SUPER_ADMIN = 4;
	/**
	 * ��ǰ��¼�û��ı�ʶ <br/> {@value}
	 */
	public static String CURRENT_USER = "curruser";
	/**
	 * ���ۻ���״̬��δָ��
	 * 
	 * @category ���ۻ��� <br/> {@value}
	 */
	public static final int CHANCE_UNASSIGN = 1;
	/**
	 * ���ۻ���״̬����ָ��("������") *
	 * 
	 * @category ���ۻ��� <br/> {@value}
	 */
	public static final int CHANCE_ASSIGN = 2;
	/**
	 * ���ۻ���״̬�������ɾ��
	 * 
	 * @category ���ۻ��� <br/> {@value}
	 */
	public static final int CHANCE_REMOVED = 0;
	
	public static final String USERS_SESSION_USER="user";

}
