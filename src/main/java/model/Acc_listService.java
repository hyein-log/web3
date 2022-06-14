package model;

import dto.Acc_listVO;

public class Acc_listService {
	Acc_listDAO dao = new Acc_listDAO();
	public int InsertAccList(int ACCOUNT_ID, int PAST_ACC, int TRANS_ACC, String TRANS_KIND) {
		return dao.InsertAccList(ACCOUNT_ID, PAST_ACC, TRANS_ACC, TRANS_KIND);
	}
}
