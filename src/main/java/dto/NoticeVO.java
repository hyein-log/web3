package dto;

import java.sql.Date;

public class NoticeVO {
	private int notice_id;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	public NoticeVO(int notice_id, String notice_title, String notice_content, Date notice_date) {
		super();
		this.notice_id = notice_id;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
	}
	public NoticeVO() {}
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("NoticeVO [notice_id=").append(notice_id).append(", notice_title=").append(notice_title)
				.append(", notice_content=").append(notice_content).append(", notice_date=").append(notice_date)
				.append("]");
		return builder.toString();
	}
	
	
}
