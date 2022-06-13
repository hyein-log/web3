package model;

import java.util.List;

import dto.NoticeVO;

public class NoticeService {
	NoticeDAO dao = new NoticeDAO();

	public List<NoticeVO> selectAll(){
		return dao.selectAll();
	}
	public NoticeVO selectById(int i_noticeid) {
		return dao.selectById(i_noticeid);
	}
	public int delete(int nno) {
		return dao.delete(nno);
	}
	public int insert(NoticeVO notice) {
		return dao.insert(notice);
	}
	public int update(NoticeVO notice) {
		return dao.update(notice); 

	}
}
