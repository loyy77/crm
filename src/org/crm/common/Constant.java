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

}
