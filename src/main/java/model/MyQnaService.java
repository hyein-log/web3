package model;

import java.util.List;

import dto.MyQnaVO;

public class MyQnaService {

	MyQnaDAO dao = new MyQnaDAO();
	
	public List<MyQnaVO> selectAll(){
		
		return dao.selectAll();
	}
	
	public MyQnaVO selectById(int memId) {
		return dao.selectById(memId);
	}
	
	public int myInsert(MyQnaVO my) {
		return dao.myInsert(my);
	}
	
	public int myUpdate(MyQnaVO my) {
		return dao.myUpdate(my);
	}
	
	public int myDelete(int qaId) {
		return dao.myDelete(qaId);
	}
}
	
	
