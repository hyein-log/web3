package dto;

import java.sql.Date;

public class AcclistVO {
	private int account_id;
	private int member_id;
	private int accounttype;
	private String acc_number;
	private long balance;
	private int acc_pass;
	private Date makedate;
	private int trans_id;
	private long past_acc;
	private String location;
	private long trans_acc;
	private Date trans_date;
	private String trans_kind;
	private String trans_name;

public AcclistVO() {
	super();
}

public AcclistVO(int account_id, int member_id, int accounttype, String acc_number, long balance, int acc_pass,
		Date makedate, int trans_id, long past_acc, String location, long trans_acc, Date trans_date, String trans_kind,
		String trans_name) {
	super();
	this.account_id = account_id;
	this.member_id = member_id;
	this.accounttype = accounttype;
	this.acc_number = acc_number;
	this.balance = balance;
	this.acc_pass = acc_pass;
	this.makedate = makedate;
	this.trans_id = trans_id;
	this.past_acc = past_acc;
	this.location = location;
	this.trans_acc = trans_acc;
	this.trans_date = trans_date;
	this.trans_kind = trans_kind;
	this.trans_name = trans_name;
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

public long getBalance() {
	return balance;
}

public void setBalance(long balance) {
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

public int getTrans_id() {
	return trans_id;
}

public void setTrans_id(int trans_id) {
	this.trans_id = trans_id;
}

public long getPast_acc() {
	return past_acc;
}

public void setPast_acc(long past_acc) {
	this.past_acc = past_acc;
}

public String getLocation() {
	return location;
}

public void setLocation(String location) {
	this.location = location;
}

public long getTrans_acc() {
	return trans_acc;
}

public void setTrans_acc(long trans_acc) {
	this.trans_acc = trans_acc;
}

public Date getTrans_date() {
	return trans_date;
}

public void setTrans_date(Date trans_date) {
	this.trans_date = trans_date;
}

public String getTrans_kind() {
	return trans_kind;
}

public void setTrans_kind(String trans_kind) {
	this.trans_kind = trans_kind;
}

public String getTrans_name() {
	return trans_name;
}

public void setTrans_name(String trans_name) {
	this.trans_name = trans_name;
}

@Override
public String toString() {
	return "AcclistVO [account_id=" + account_id + ", member_id=" + member_id + ", accounttype=" + accounttype
			+ ", acc_number=" + acc_number + ", balance=" + balance + ", acc_pass=" + acc_pass + ", makedate="
			+ makedate + ", trans_id=" + trans_id + ", past_acc=" + past_acc + ", location=" + location + ", trans_acc="
			+ trans_acc + ", trans_date=" + trans_date + ", trans_kind=" + trans_kind + ", trans_name=" + trans_name
			+ "]";
}


}
