package member.dao;

import member.model.Member;

public class Aaa {

	public static void main(String[] args) {
		MemberDAO dao= new MemberDAOImpl();
		Member s= dao.selectByEmail("daehyun0620@naver.com");
		System.out.println(s.getMembername());
	}
}
