package member.dao;

import java.util.List;

import member.model.Member;

public interface MemberDAO {
	//ȸ������
	List<Member> selectAllMemberno(int memberno);
	List<Member> selectAll();
	//�α���
	Member selectByNo(int memberno);
	Member selectById(String memberid);
	Member selectByEmail(String email);
	//�ߺ�Ȯ��
	public int checkById(String id);
	
	//ȸ������
	boolean insert(Member member);
	
	//������
	boolean updatePassword(Member member);
	boolean updateName(Member member);
	boolean updateEmail(Member member);
	
	//ȸ��Ż��
	boolean delete(int memberno);
}
