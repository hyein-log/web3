package dto;

import java.util.Date;

public class AutoSendVO {
	private int auto_id;
	private int account_id;
	private String auto_content;
	private int auto_amonut;
	private Date expiry_date;
	private Date auto_date;
	private int delay_count;

	public AutoSendVO() {
		super();
	}

	public AutoSendVO(int auto_id, int account_id, String auto_content, int auto_amonut, Date expiry_date,
			Date auto_date, int delay_count) {
		super();
		this.auto_id = auto_id;
		this.account_id = account_id;
		this.auto_content = auto_content;
		this.auto_amonut = auto_amonut;
		this.expiry_date = expiry_date;
		this.auto_date = auto_date;
		this.delay_count = delay_count;
	}

	public int getAuto_id() {
		return auto_id;
	}

	public void setAuto_id(int auto_id) {
		this.auto_id = auto_id;
	}

	public int getAccount_id() {
		return account_id;
	}

	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}

	public String getAuto_content() {
		return auto_content;
	}

	public void setAuto_content(String auto_content) {
		this.auto_content = auto_content;
	}

	public int getAuto_amonut() {
		return auto_amonut;
	}

	public void setAuto_amonut(int auto_amonut) {
		this.auto_amonut = auto_amonut;
	}

	public Date getExpiry_date() {
		return expiry_date;
	}

	public void setExpiry_date(Date expiry_date) {
		this.expiry_date = expiry_date;
	}

	public Date getAuto_date() {
		return auto_date;
	}

	public void setAuto_date(Date auto_date) {
		this.auto_date = auto_date;
	}

	public int getDelay_count() {
		return delay_count;
	}

	public void setDelay_count(int delay_count) {
		this.delay_count = delay_count;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("AutoSendVO [auto_id=");
		builder.append(auto_id);
		builder.append(", account_id=");
		builder.append(account_id);
		builder.append(", auto_content=");
		builder.append(auto_content);
		builder.append(", auto_amonut=");
		builder.append(auto_amonut);
		builder.append(", expiry_date=");
		builder.append(expiry_date);
		builder.append(", auto_date=");
		builder.append(auto_date);
		builder.append(", delay_count=");
		builder.append(delay_count);
		builder.append("]");
		return builder.toString();
	}

}
