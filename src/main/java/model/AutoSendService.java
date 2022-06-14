package model;

import java.util.List;

import dto.AutoSendVO;

public class AutoSendService {
	AutoSendDAO dao = new AutoSendDAO();
	
	public List<AutoSendVO> selectByAuto(int accId) {
		return dao.selectByAuto(accId);
	}
	
	public AutoSendVO selectById(int autoid) {
		return dao.selectById(autoid);
	}
	
	public int updateAuto(AutoSendVO autosend) {
		return dao.updateAuto(autosend);
	}
	
	public int insertAuto(AutoSendVO autosend) {
		return dao.insertAuto(autosend);
	}
}
