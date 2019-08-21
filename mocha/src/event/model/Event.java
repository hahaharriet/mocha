package event.model;

public class Event {
	private int eventno;
	private String eventsubject;	
	private String start_date;
	private String end_date;	
	private int eventvisited;
	private String eventcontent;
	public int getEventno() {
		return eventno;
	}
	public void setEventno(int eventno) {
		this.eventno = eventno;
	}
	public String getEventsubject() {
		return eventsubject;
	}
	public void setEventsubject(String eventsubject) {
		this.eventsubject = eventsubject;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public int getEventvisited() {
		return eventvisited;
	}
	public void setEventvisited(int eventvisited) {
		this.eventvisited = eventvisited;
	}
	public String getEventcontent() {
		return eventcontent;
	}
	public void setEventcontent(String eventcontent) {
		this.eventcontent = eventcontent;
	}
	
	@Override
	public String toString() {
		return "Event [eventno=" + eventno + ", eventsubject=" + eventsubject + ", start_date=" + start_date
				+ ", end_date=" + end_date + ", eventvisited=" + eventvisited + ", eventcontent=" + eventcontent + "]";
	}
	
	
}
