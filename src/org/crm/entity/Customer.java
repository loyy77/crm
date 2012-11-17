package org.crm.entity;

public class Customer {
	private int id;
	private String name;
	private String region;
	private int managerId;
	private String managerName;
	private String levelLabel;
	private int satisfy;
	private int credit;
	private String addr;
	private String zip;
	private String tel;
	private String fax;
	private String website;
	private String licence;
	private String chieftain;
	private double bankroll;
	private double turnover;
	private String bank;
	private String account;
	private String localTax;
	private String nationalTax;
	private int state;

	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Customer(String name) {
		super();
		this.name = name;
	}

	public Customer(int id, String name, String region, int managerId,
			String managerName, String levelLabel, int satisfy, int credit,
			String addr, String zip, String tel, String fax, String website,
			String licence, String chiefatain, double bankroll,
			double turnover, String bank, String account, String localTax,
			String nationalTax, int state) {
		super();
		this.id = id;
		this.name = name;
		this.region = region;
		this.managerId = managerId;
		this.managerName = managerName;
		this.levelLabel = levelLabel;
		this.satisfy = satisfy;
		this.credit = credit;
		this.addr = addr;
		this.zip = zip;
		this.tel = tel;
		this.fax = fax;
		this.website = website;
		this.licence = licence;
		this.chieftain = chiefatain;
		this.bankroll = bankroll;
		this.turnover = turnover;
		this.bank = bank;
		this.account = account;
		this.localTax = localTax;
		this.nationalTax = nationalTax;
		this.state = state;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public int getManagerId() {
		return managerId;
	}

	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public String getLevelLabel() {
		return levelLabel;
	}

	public void setLevelLabel(String levelLabel) {
		this.levelLabel = levelLabel;
	}

	public int getSatisfy() {
		return satisfy;
	}

	public void setSatisfy(int satisfy) {
		this.satisfy = satisfy;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getLicence() {
		return licence;
	}

	public void setLicence(String licence) {
		this.licence = licence;
	}

	public String getChieftain() {
		return chieftain;
	}

	public void setChieftain(String chieftain) {
		this.chieftain = chieftain;
	}

	public double getBankroll() {
		return bankroll;
	}

	public void setBankroll(double bankroll) {
		this.bankroll = bankroll;
	}

	public double getTurnover() {
		return turnover;
	}

	public void setTurnover(double turnover) {
		this.turnover = turnover;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getLocalTax() {
		return localTax;
	}

	public void setLocalTax(String localTax) {
		this.localTax = localTax;
	}

	public String getNationalTax() {
		return nationalTax;
	}

	public void setNationalTax(String nationalTax) {
		this.nationalTax = nationalTax;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

}
