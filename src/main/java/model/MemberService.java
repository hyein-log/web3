package model;

import java.util.ArrayList;

import dto.MemberVO;

public class MemberService {
	MemberDAO dao = new MemberDAO();
	public int insertMember(MemberVO member) { return dao.insertMember(member); }
	public ArrayList<MemberVO> getMembers() { return dao.getMembers();}
	public MemberVO selectById(String user_id, String user_pass){
        return dao.selectById(user_id,user_pass);
    }
	public MemberVO selectByEmail(String name, String email) {
		return dao.selecByEmail(name,email);
	}
	public MemberVO selectEmailById(String id) {
		return dao.selectEmailById(id);
	}
}
