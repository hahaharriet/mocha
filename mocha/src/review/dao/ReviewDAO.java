package review.dao;

import java.util.List;

import review.model.Review;

public interface ReviewDAO {
	
	List<Review> selectAll();//리스트	가라
	
	boolean insert(Review review);
	List<Review> selectByProductNo(int productno); //상세보기 후기
	
	//리뷰번호로 수정 삭제 처리
	Review selectByReviewNo(int reviewno);
	
	//페이징 처리
	List<Review> selectAllPage(int rowStartNumber, int rowEndNumber);
	//업데이트
	void update(Review review);
	//삭제
	boolean delete(int reviewno);
	//조회수 처리
	void updateVisited(int no);
	//상세 검색처리
	List<Review> selectbyreviewsubject(String reviewsubject);
}
