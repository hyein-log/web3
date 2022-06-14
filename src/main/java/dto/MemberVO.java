
package dto;

public class MemberVO {
	int member_id;
	String name;
	String id;
	String password;
	String email;
	String address;
	String phoneNum;
	char subscri_ox;
	char dropout_ox;
	
	public MemberVO() {}
	
	public MemberVO(int member_id, String name, String id, String password, String email, String address,
			String phoneNum, char subscri_ox, char dropout_ox) {
		super();
		this.member_id = member_id;
		this.name = name;
		this.id = id;
		this.password = password;
		this.email = email;
		this.address = address;
		this.phoneNum = phoneNum;
		this.subscri_ox = subscri_ox;
		this.dropout_ox = dropout_ox;
	}
	public MemberVO(String pass, String email) {
		this.password = pass;
		this.email = email;
	}
	
	

	public MemberVO(String name, String id, String password, String email, String address, String phoneNum) {
		super();
		this.name = name;
		this.id = id;
		this.password = password;
		this.email = email;
		this.address = address;
		this.phoneNum = phoneNum;
	}

	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
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
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public char getSubscri_ox() {
		return subscri_ox;
	}
	public void setSubscri_ox(char subscri_ox) {
		this.subscri_ox = subscri_ox;
	}
	public char getDropout_ox() {
		return dropout_ox;
	}
	public void setDropout_ox(char dropout_ox) {
		this.dropout_ox = dropout_ox;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MemberVO [member_id=").append(member_id).append(", name=").append(name).append(", id=")
				.append(id).append(", password=").append(password).append(", email=").append(email).append(", address=")
				.append(address).append(", phoneNum=").append(phoneNum).append(", subscri_ox=").append(subscri_ox)
				.append(", dropout_ox=").append(dropout_ox).append("]");
		return builder.toString();
	}

	public MemberVO(int member_id, String email) {
		super();
		this.member_id = member_id;
		this.email = email;
	}
	
	
	
	
}

