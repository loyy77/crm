package org.crm.common;

/**
 * 
 * @author lishixi
 * 
 */
public interface Constant {
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
	 * 当前登录用户的标识 * {@value}
	 */
	public static String CURRENT_USER = "user";
}
