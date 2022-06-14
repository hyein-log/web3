package model;

import dto.MemberAccountJoinVO;

public class MemberAccountJoinService {
	MemberAccountJoinDAO dao = new MemberAccountJoinDAO();
	public MemberAccountJoinVO SELECT_BY_ACC_NUMBER(String ACC_NUMBER) {
		return dao.SELECT_BY_ACC_NUMBER(ACC_NUMBER);
	}
}
