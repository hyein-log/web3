package model;

import java.util.List;

import dto.AutoSendVO;

public class AutoSendService {
	AutoSendDAO dao = new AutoSendDAO();
	
	public List<AutoSendVO> selectByAuto(int accId) {
		return dao.selectByAuto(accId);
	}
}
