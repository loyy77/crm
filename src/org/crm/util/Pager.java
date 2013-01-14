package org.crm.util;

public class Pager {
	
	private int recoredCount;
	private int pageCount;
	//总记录数
	public int getTotalRecordCount(String tableName){
		
		return 0;
	}
	//总页数
	public int getTotalPageCount(){
		return 0;
	}
	
	public int getRecoredCount() {
		return recoredCount;
	}
	public void setRecoredCount(int recoredCount) {
		this.recoredCount = recoredCount;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	
}
