package org.crm.common;

/**
 * 
 * @author lishixi
 * 
 */
public interface Constant {
	/**
	 * 当前登录用户的标识 <br/> {@value}
	 */
	public static String CURRENT_USER = "curruser";

	/**
	 * 管理员 <br/> {@value}
	 * 
	 * @author lishixi
	 * 
	 * @category 权限-角色
	 */
	public static final int ROLE_ADMIN = 1;
	/**
	 * 销售主管 <br/> {@value}
	 * 
	 * @author lishixi
	 * @category 权限-角色
	 */
	public static final int ROLE_SALES_SUPERVISOR = 2;
	/**
	 * 客户经理<br/> {@value}
	 * 
	 * @author lishixi
	 * @category 权限-角色
	 */
	public static final int ROLE_CUSTOMER_MANAGER = 3;
	/**
	 * 超级管理员<br/> {@value}
	 * 
	 * @author lishixi
	 * @category 权限-角色
	 */
	public static final int ROLE_SUPER_ADMIN = 4;

	/**
	 * 销售机会状态，标记已删除
	 * 
	 * @category 销售机会 <br/> {@value}
	 */
	public static final int CHANCE_REMOVED = 0;
	/**
	 * 销售机会状态，未指派
	 * 
	 * @category 销售机会 <br/> {@value}
	 */
	public static final int CHANCE_UNASSIGN = 1;
	/**
	 * 销售机会状态，已指派("开发中") *
	 * 
	 * @category 销售机会 <br/> {@value}
	 */
	public static final int CHANCE_ASSIGN = 2;
	/**
	 * 销售机会状态，开发成功
	 */
	public static final int CHANCE_DEV_SUCCESS = 3;
	/**
	 * 销售机会状态，开发失败
	 */
	public static final int CHANCE_DEV_Failure = 4;

	/**
	 * 客户信息状态
	 */
	public static final int CUSTOMER_STATE_NORMAL = 1;
	public static final int CUSTOMER_STATE_ZZZ = 2;
	public static final int CUSTOMER_STATE_XXX = 3;

	/**
	 * 客户满意度
	 */

	public static final int CUSTOMER_STATISFY_ONE = 1;
	public static final int CUSTOMER_STATISFY_TWO = 2;
	public static final int CUSTOMER_STATISFY_THREE = 3;
	public static final int CUSTOMER_STATISFY_FOUR = 4;
	public static final int CUSTOMER_STATISFY_FIVE = 5;
	/**
	 * 客户信用度
	 */
	public static final int CUSTOMER_CREDIT_ONE = 1;
	public static final int CUSTOMER_CREDIT_TWO = 2;
	public static final int CUSTOMER_CREDIT_THREE = 3;
	public static final int CUSTOMER_CREDIT_FOUR = 4;
	public static final int CUSTOMER_CREDIT_FIVE = 5;

}
