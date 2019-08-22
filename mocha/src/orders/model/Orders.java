package orders.model;

public class Orders {
    	
	private int orderid;
	private int memberno;
	private int productno;
	private String productname;
	private String ordersmembername;
	private String ordersmemberid;
	private String ordersmemberemail;
	private String address;
	private int ordersprice;
	private String orderdate;
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public int getMemberno() {
		return memberno;
	}
	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	public int getProductno() {
		return productno;
	}
	public void setProductno(int productno) {
		this.productno = productno;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getOrdersmembername() {
		return ordersmembername;
	}
	public void setOrdersmembername(String ordersmembername) {
		this.ordersmembername = ordersmembername;
	}
	public String getOrdersmemberid() {
		return ordersmemberid;
	}
	public void setOrdersmemberid(String ordersmemberid) {
		this.ordersmemberid = ordersmemberid;
	}
	public String getOrdersmemberemail() {
		return ordersmemberemail;
	}
	public void setOrdersmemberemail(String ordersmemberemail) {
		this.ordersmemberemail = ordersmemberemail;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getOrdersprice() {
		return ordersprice;
	}
	public void setOrdersprice(int ordersprice) {
		this.ordersprice = ordersprice;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	@Override
	public String toString() {
		return "Orders [orderid=" + orderid + ", memberno=" + memberno + ", productno=" + productno + ", productname="
				+ productname + ", ordersmembername=" + ordersmembername + ", ordersmemberid=" + ordersmemberid
				+ ", ordersmemberemail=" + ordersmemberemail + ", address=" + address + ", ordersprice=" + ordersprice
				+ ", orderdate=" + orderdate + "]";
	}
	
	
	
}
