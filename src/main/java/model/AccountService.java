
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
	
	public int selectPw(int accid) {
		return dao.selectPw(accid);
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
	public List<AccountVO> SELECT_ACCMEM_BYID_TYPE0(int memberid) {
		return dao.SELECT_ACCMEM_BYID_TYPE0(memberid);
	}
	public AccountVO SELECT_ACCID_BY_ACCNUM(String acc_number) {
		return dao.SELECT_ACCID_BY_ACCNUM(acc_number);
	}
	public int UPDATE_BALANCE(int balance , int account_id) {
		return dao.UPDATE_BALANCE(balance, account_id);
	}
	public int selectMemBal(int memberid) {
		return dao.selectMemBal(memberid);
  }
  public int selectBal(String accNum) {
		return dao.selectBal(accNum);
	}
}
