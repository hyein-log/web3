package model;

import java.util.List;

import dto.AccountVO;

public class AccountService {
	
	AccountDAO dao = new AccountDAO();
	
	public List<AccountVO> selectAll(){
		return dao.selectAll();
	}
	
	public int accInsert(AccountVO acc) {
		return dao.accInsert(acc);
	}
}
