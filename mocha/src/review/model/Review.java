package review.model;

public class Review {
	private int reviewno;
	private String reviewsubject;
	private int productno;
	private int rate;
	private String review_memberid;
	private String review_date;
	private String content;
	private int visited;
	
	public int getReviewno() {
		return reviewno;
	}
	public void setReviewno(int reviewno) {
		this.reviewno = reviewno;
	}
	public String getReviewsubject() {
		return reviewsubject;
	}
	public void setReviewsubject(String reviewsubject) {
		this.reviewsubject = reviewsubject;
	}
	public int getProductno() {
		return productno;
	}
	public void setProductno(int productno) {
		this.productno = productno;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public String getReview_memberid() {
		return review_memberid;
	}
	public void setReview_memberid(String review_memberid) {
		this.review_memberid = review_memberid;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getVisited() {
		return visited;
	}
	public void setVisited(int visited) {
		this.visited = visited;
	}
	@Override
	public String toString() {
		return "Review [reviewno=" + reviewno + ", reviewsubject=" + reviewsubject + ", productno=" + productno
				+ ", rate=" + rate + ", review_memberid=" + review_memberid + ", review_date=" + review_date
				+ ", content=" + content + ", visited=" + visited + "]";
	}

	
}
