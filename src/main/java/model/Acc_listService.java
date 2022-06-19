package model;

import java.util.List;

import dto.Acc_listVO;

public class Acc_listService {
	Acc_listDAO dao = new Acc_listDAO();
	public int InsertAccList(int ACCOUNT_ID, int PAST_ACC, int TRANS_ACC, String TRANS_KIND, String TRANS_NAME) {
		return dao.InsertAccList(ACCOUNT_ID, PAST_ACC, TRANS_ACC, TRANS_KIND,TRANS_NAME);
	}
	public List<Acc_listVO> SELECT_ACCLIST_ALL(int account_id, String startDate, String EndDate) {
		return dao.SELECT_ACCLIST_ALL(account_id, startDate, EndDate);
	}
}
