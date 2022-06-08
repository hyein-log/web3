package dto;

import java.sql.Date;

public class AccountVO {

	private int account_id;
	private int member_id;
	private int accountType;
	private String acc_number;
	private int balance;
	private int acc_pass;
	private Date makedate;
	
	public AccountVO() {
		super();
	}

	public AccountVO(int account_id, int member_id, int accountType, String acc_number, int balance, int acc_pass,
			Date makedate) {
		super();
		this.account_id = account_id;
		this.member_id = member_id;
		this.accountType = accountType;
		this.acc_number = acc_number;
		this.balance = balance;
		this.acc_pass = acc_pass;
		this.makedate = makedate;
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

	public int getAccountType() {
		return accountType;
	}

	public void setAccountType(int accountType) {
		this.accountType = accountType;
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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("AccountVO [account_id=").append(account_id).append(", member_id=").append(member_id)
				.append(", accountType=").append(accountType).append(", acc_number=").append(acc_number)
				.append(", balance=").append(balance).append(", acc_pass=").append(acc_pass).append(", makedate=")
				.append(makedate).append("]");
		return builder.toString();
	}
	
	
}
