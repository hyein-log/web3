package model;

import java.sql.Date;
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
	public List<AcclistVO> SQL_SELECT_TERM(String acc_num ,Date searchStartDate, Date searchEndDate,int page) {
		return acclistdao.SQL_SELECT_TERM(acc_num, searchStartDate, searchEndDate, page);
	}
	public int SQL_SELECT_TERM_COUNT(String acc_num, Date start_Term, Date end_Term ) {
		return acclistdao.SQL_SELECT_TERM_COUNT(acc_num, start_Term, end_Term);
	}
}
