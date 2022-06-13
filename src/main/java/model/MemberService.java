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
	public MemberVO selectByIdEmail(String id, String name, String email) {
		return dao.selectByIdEmail(id,name,email);
	}
	public MemberVO selectByEmailForPass(String email) {
		return dao.selectByEmailForPass(email);
	}
	public int passwordUpdate(MemberVO member) {
		return dao.passwordUpdate(member);
	}
	public int idCheck(String id) {
		return dao.selectAllId(id);
	}
	public int emailCheck(String email) {
		return dao.selectAllEmail(email);
	}
	public MemberVO selectMemberByMemberId(int memberid) {
		return dao.selectMemberByMemberId(memberid);
	}
	public int update_member_email(MemberVO member) {
		return dao.update_member_email(member);
	}
}
