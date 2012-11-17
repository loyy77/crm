package org.crm.common;

/**
 * 
 * @author lishixi
 * 
 */
public interface Constant {
	/**
	 * ��ǰ��¼�û��ı�ʶ <br/> {@value}
	 */
	public static String CURRENT_USER = "curruser";

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
	 * ���ۻ���״̬�������ɾ��
	 * 
	 * @category ���ۻ��� <br/> {@value}
	 */
	public static final int CHANCE_REMOVED = 0;
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
	 * ���ۻ���״̬�������ɹ�
	 */
	public static final int CHANCE_DEV_SUCCESS = 3;
	/**
	 * ���ۻ���״̬������ʧ��
	 */
	public static final int CHANCE_DEV_Failure = 4;

	/**
	 * �ͻ���Ϣ״̬
	 */
	public static final int CUSTOMER_STATE_NORMAL = 1;
	public static final int CUSTOMER_STATE_ZZZ = 2;
	public static final int CUSTOMER_STATE_XXX = 3;

	/**
	 * �ͻ������
	 */

	public static final int CUSTOMER_STATISFY_ONE = 1;
	public static final int CUSTOMER_STATISFY_TWO = 2;
	public static final int CUSTOMER_STATISFY_THREE = 3;
	public static final int CUSTOMER_STATISFY_FOUR = 4;
	public static final int CUSTOMER_STATISFY_FIVE = 5;
	/**
	 * �ͻ����ö�
	 */
	public static final int CUSTOMER_CREDIT_ONE = 1;
	public static final int CUSTOMER_CREDIT_TWO = 2;
	public static final int CUSTOMER_CREDIT_THREE = 3;
	public static final int CUSTOMER_CREDIT_FOUR = 4;
	public static final int CUSTOMER_CREDIT_FIVE = 5;

}
