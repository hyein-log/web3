package model;

import java.util.List;

import dto.AcclistVO;

public class AcclistService {
	AcclistDAO acclistdao = new AcclistDAO();
	
	public List<AcclistVO> SELECT_ACCLIST_ALL(String accNum) {
		return acclistdao.SELECT_ACCLIST_ALL(accNum);
	}
	public List<AcclistVO> SQL_SELECT_KIND(String ACC_NUMBER, String kind, int page) {
		return acclistdao.SQL_SELECT_KIND(ACC_NUMBER, kind, page);
	}
	
}
