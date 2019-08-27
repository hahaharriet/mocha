package notice.dao;

import java.util.List;


import notice.model.Notice;


public interface NoticeDAO {
	
	List<Notice> selectAll();//����Ʈ	����
	
	boolean insert(Notice notice);
	//List<Event> selectByEventNo(int eventno); //�󼼺��� �ı�
	
	//�̺�Ʈ��ȣ��  �󼼺��� ���� ���� ó��
	Notice selectByNoticeNo(int noticeno);
	
	//����¡ ó��
	List<Notice> selectAllPage(int rowStartNumber, int rowEndNumber);
	//������Ʈ
	void update(Notice notice);
	//����
	boolean delete(int noticeno);
	//��ȸ�� ó��
	void updateVisited(int no);
	//�� �˻�ó��
	List<Notice> selectbyNoticeContent(String noticecontent);
}
