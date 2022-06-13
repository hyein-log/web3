package model;

import java.util.List;

import dto.NoticeVO;

public class NoticeService {
	NoticeDAO dao = new NoticeDAO();
	
	public List<NoticeVO> selectAll() {
		return dao.selectAll();
	}
	
	public NoticeVO selectById(int num) {
		return dao.selectById(num);
	}
}
