package member.dao;

import java.util.List;

import member.model.Member;

public interface MemberDAO {
	//회원정보
	List<Member> selectAllMemberno(int memberno);
	List<Member> selectAll();
	//로그인
	Member selectByNo(int memberno);
	Member selectById(String memberid);
	Member selectByEmail(String email);
	//중복확인
	public int checkById(String id);
	
	//회원가입
	boolean insert(Member member);
	
	//수정문
	boolean updatePassword(Member member);
	boolean updateName(Member member);
	boolean updateEmail(Member member);
	
	//회원탈퇴
	boolean delete(int memberno);
}
