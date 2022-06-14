package dto;

import java.sql.Date;

public class MemberAccountJoinVO {
	private int account_id;
	private int member_id;
	private int accounttype;
	private String acc_number;
	private int balance;
	private int acc_pass;
	private Date makedate;
	private String limit_ox;
	private String name;
	private String id;
	private String password;
	private String email;
	private String address;
	private String phonenum;
	private String subscri_ox;
	private String dropout_ox;
	
	
	public MemberAccountJoinVO() {
		super();
	}
	
	public MemberAccountJoinVO(int account_id, int member_id, int accounttype, String acc_number, int balance,
			int acc_pass, Date makedate, String limit_ox, String name, String id, String password, String email,
			String address, String phonenum, String subscri_ox, String dropout_ox) {
		super();
		this.account_id = account_id;
		this.member_id = member_id;
		this.accounttype = accounttype;
		this.acc_number = acc_number;
		this.balance = balance;
		this.acc_pass = acc_pass;
		this.makedate = makedate;
		this.limit_ox = limit_ox;
		this.name = name;
		this.id = id;
		this.password = password;
		this.email = email;
		this.address = address;
		this.phonenum = phonenum;
		this.subscri_ox = subscri_ox;
		this.dropout_ox = dropout_ox;
	}
	public int getAccount_id() {
		return account_id;
	}
	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getAccounttype() {
		return accounttype;
	}
	public void setAccounttype(int accounttype) {
		this.accounttype = accounttype;
	}
	public String getAcc_number() {
		return acc_number;
	}
	public void setAcc_number(String acc_number) {
		this.acc_number = acc_number;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public int getAcc_pass() {
		return acc_pass;
	}
	public void setAcc_pass(int acc_pass) {
		this.acc_pass = acc_pass;
	}
	public Date getMakedate() {
		return makedate;
	}
	public void setMakedate(Date makedate) {
		this.makedate = makedate;
	}
	public String getLimit_ox() {
		return limit_ox;
	}
	public void setLimit_ox(String limit_ox) {
		this.limit_ox = limit_ox;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getSubscri_ox() {
		return subscri_ox;
	}
	public void setSubscri_ox(String subscri_ox) {
		this.subscri_ox = subscri_ox;
	}
	public String getDropout_ox() {
		return dropout_ox;
	}
	public void setDropout_ox(String dropout_ox) {
		this.dropout_ox = dropout_ox;
	}
	@Override
	public String toString() {
		return "MemberAccountJoinVO [account_id=" + account_id + ", member_id=" + member_id + ", accounttype="
				+ accounttype + ", acc_number=" + acc_number + ", balance=" + balance + ", acc_pass=" + acc_pass
				+ ", makedate=" + makedate + ", limit_ox=" + limit_ox + ", name=" + name + ", id=" + id + ", password="
				+ password + ", email=" + email + ", address=" + address + ", phonenum=" + phonenum + ", subscri_ox="
				+ subscri_ox + ", dropout_ox=" + dropout_ox + "]";
	}
	
}
