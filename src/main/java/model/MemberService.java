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
}
