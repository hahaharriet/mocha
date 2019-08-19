package review.dao;

import java.util.List;

import review.model.Review;

public interface ReviewDAO {
	
	List<Review> selectAll();//����Ʈ	����
	
	boolean insert(Review review);
	List<Review> selectByProductNo(int productno); //�󼼺��� �ı�
	
	//�����ȣ�� ���� ���� ó��
	Review selectByReviewNo(int reviewno);
	
	//����¡ ó��
	List<Review> selectAllPage(int rowStartNumber, int rowEndNumber);
	//������Ʈ
	void update(Review review);
	//����
	boolean delete(int reviewno);
	//��ȸ�� ó��
	void updateVisited(int no);
	//�� �˻�ó��
	List<Review> selectbyreviewsubject(String reviewsubject);
}
