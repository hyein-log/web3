package dto;

import java.sql.Date;

public class MyQnaVO {
	
	int qa_id;
	int member_id;
	String qa_title;
	String qa_content;
	String qa_answer; 
	Date qa_date;
	Date qa_answer_date;
	
	public MyQnaVO() {
		super();
	}
	

	public MyQnaVO(int member_id, String qa_title, String qa_content) {
		super();
		this.member_id = member_id;
		this.qa_title = qa_title;
		this.qa_content = qa_content;
	}



	public MyQnaVO(int qa_id, int member_id, String qa_title, String qa_content, String qa_answer, Date qa_date,
			Date qa_answer_date) {
		super();
		this.qa_id = qa_id;
		this.member_id = member_id;
		this.qa_title = qa_title;
		this.qa_content = qa_content;
		this.qa_answer = qa_answer;
		this.qa_date = qa_date;
		this.qa_answer_date = qa_answer_date;
	}

	public int getQa_id() {
		return qa_id;
	}

	public void setQa_id(int qa_id) {
		this.qa_id = qa_id;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public String getQa_title() {
		return qa_title;
	}

	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}

	public String getQa_content() {
		return qa_content;
	}

	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}

	public String getQa_answer() {
		return qa_answer;
	}

	public void setQa_answer(String qa_answer) {
		this.qa_answer = qa_answer;
	}

	public Date getQa_date() {
		return qa_date;
	}

	public void setQa_date(Date qa_date) {
		this.qa_date = qa_date;
	}

	public Date getQa_answer_date() {
		return qa_answer_date;
	}

	public void setQa_answer_date(Date qa_answer_date) {
		this.qa_answer_date = qa_answer_date;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MyQnaVO [qa_id=").append(qa_id).append(", member_id=").append(member_id).append(", qa_title=")
				.append(qa_title).append(", qa_content=").append(qa_content).append(", qa_answer=").append(qa_answer)
				.append(", qa_date=").append(qa_date).append(", qa_answer_date=").append(qa_answer_date).append("]");
		return builder.toString();
	}
	
	
	
}
