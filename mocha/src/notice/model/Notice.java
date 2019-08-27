package notice.model;

public class Notice {
	private int noticeno;
	private String noticesubject;	
	private String noticecontent;
	private String notice_date;		
	private String notice_memberid;
	
	private int visited;
	
	public int getNoticeno() {
		return noticeno;
	}
	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}
	public String getNoticesubject() {
		return noticesubject;
	}
	public void setNoticesubject(String noticesubject) {
		this.noticesubject = noticesubject;
	}
	public String getNoticecontent() {
		return noticecontent;
	}
	public void setNoticecontent(String noticecontent) {
		this.noticecontent = noticecontent;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	public String getNotice_memberid() {
		return notice_memberid;
	}
	public void setNotice_memberid(String notice_memberid) {
		this.notice_memberid = notice_memberid;
	}
	public int getVisited() {
		return visited;
	}
	public void setVisited(int visited) {
		this.visited = visited;
	}
	
	@Override
	public String toString() {
		return "Notice [noticeno=" + noticeno + ", noticesubject=" + noticesubject + ", noticecontent=" + noticecontent
				+ ", notice_date=" + notice_date + ", notice_memberid=" + notice_memberid + ", visited=" + visited
				+ "]";
	}
		
}
