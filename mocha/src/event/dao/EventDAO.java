package event.dao;

import java.util.List;

import event.model.Event;


public interface EventDAO {
	
	List<Event> selectAll();//����Ʈ	����
	
	boolean insert(Event event);
	List<Event> selectByEventNo(int eventno); //�󼼺��� �ı�
	
	//�̺�Ʈ��ȣ�� ���� ���� ó��
	Event selectByReviewNo(int eventno);
	
	//����¡ ó��
	List<Event> selectAllPage(int rowStartNumber, int rowEndNumber);
	//������Ʈ
	void update(Event event);
	//����
	boolean delete(int eventno);
	//��ȸ�� ó��
	void updateVisited(int no);
	//�� �˻�ó��
	List<Event> selectbyEventSubject(String EVENTSUBJECT);
}
