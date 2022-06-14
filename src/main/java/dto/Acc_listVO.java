package dto;

import java.sql.Date;

public class Acc_listVO {
	private int account_id;
	private int trans_id;
	private long past_acc;
	private String location;
	private long trans_acc;
	private Date trans_date;
	private String trans_kind;
	private String trans_name;
	public Acc_listVO() {
		super();
	}
	public Acc_listVO(int account_id, int trans_id, long past_acc, String location, long trans_acc, Date trans_date,
			String trans_kind, String trans_name) {
		super();
		this.account_id = account_id;
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
		return "Acc_listVO [account_id=" + account_id + ", trans_id=" + trans_id + ", past_acc=" + past_acc
				+ ", location=" + location + ", trans_acc=" + trans_acc + ", trans_date=" + trans_date + ", trans_kind="
				+ trans_kind + ", trans_name=" + trans_name + "]";
	}


}
