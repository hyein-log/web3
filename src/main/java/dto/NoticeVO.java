package dto;

import java.util.Date;

public class NoticeVO {
	private int notic_id;
	private String notic_title;
	private String notic_content;
	private Date notic_date;

	public NoticeVO() {

	}

	public NoticeVO(int notic_id, String notic_title, String notic_content, Date notic_date) {
		super();
		this.notic_id = notic_id;
		this.notic_title = notic_title;
		this.notic_content = notic_content;
		this.notic_date = notic_date;
	}

	public int getNotic_id() {
		return notic_id;
	}

	public void setNotic_id(int notic_id) {
		this.notic_id = notic_id;
	}

	public String getNotic_title() {
		return notic_title;
	}

	public void setNotic_title(String notic_title) {
		this.notic_title = notic_title;
	}

	public String getNotic_content() {
		return notic_content;
	}

	public void setNotic_content(String notic_content) {
		this.notic_content = notic_content;
	}

	public Date getNotic_date() {
		return notic_date;
	}

	public void setNotic_date(Date notic_date) {
		this.notic_date = notic_date;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("NoticeVO [notic_id=");
		builder.append(notic_id);
		builder.append(", notic_title=");
		builder.append(notic_title);
		builder.append(", notic_content=");
		builder.append(notic_content);
		builder.append(", notic_date=");
		builder.append(notic_date);
		builder.append("]");
		return builder.toString();
	}


}
