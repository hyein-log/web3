package model;

import java.util.List;

import dto.AcclistVO;

public class AcclistService {
	AcclistDAO acclistdao = new AcclistDAO();
	public List<AcclistVO> SELECT_ACCLIST_ALL() {
		return acclistdao.SELECT_ACCLIST_ALL();
	}
	public AcclistVO SELECT_ACCLIST_BYID(int TRANS_ID) {
		return acclistdao.SELECT_ACCLIST_BYID(TRANS_ID);
	}
}
