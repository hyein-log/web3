package model;

import java.util.List;

import dto.AcclistVO;

public class AcclistService {
	AcclistDAO acclistdao = new AcclistDAO();
	
	public List<AcclistVO> SELECT_ACCLIST_ALL(int memberid) {
		return acclistdao.SELECT_ACCLIST_ALL(memberid);
	}
	public AcclistVO SELECT_ACCLIST_BYID(int TRANS_ID) {
		return acclistdao.SELECT_ACCLIST_BYID(TRANS_ID);
	}
	public List<AcclistVO> SQL_SELECT_KIND(int memberid, String kind) {
		return acclistdao.SQL_SELECT_KIND(memberid, kind);
	}
	public AcclistVO SELECT_ACCLIST_MAP(int ACCOUNT_ID, int TRANS_ID) {
		return acclistdao.SELECT_ACCLIST_MAP(ACCOUNT_ID, TRANS_ID);
	}
}
