package member.dao;

import java.util.List;

import member.model.Member;

public interface MemberDAO {
	
	List<Member> selectAll();
	
	Member selectByNo(int memberno);
	Member selectById(String memberid);
	
	public int checkById(String id);
	
	boolean insert(Member member);
}
