package model;

import java.util.List;

import dto.AccountVO;

public class AccountService {
	
	AccountDAO dao = new AccountDAO();
	
	public List<AccountVO> selectAll(){
		return dao.selectAll();
	}
	

	public List<AccountVO> selectById(int memId) {
		return dao.selectById(memId);
	}
	
	public String accInsert(AccountVO acc) {
		return dao.accInsert(acc);
	}
	
	public int updateLimit(String accNum) {
		return dao.updateLimit(accNum);
	}
	
	public int deleteAcc(String accNum) {
		return dao.deleteAcc(accNum);
	}

}
