package orders.model;

public class basketOrder {
	private int productno;
	private String productname;
	private int ordersprice;
	private int count;

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
	public int getOrdersprice() {
		return ordersprice;
	}
	public void setOrdersprice(int ordersprice) {
		this.ordersprice = ordersprice;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "basketOrder [productno=" + productno + ", productname=" + productname
				+ ", ordersprice=" + ordersprice + ", count=" + count + "]";
	}
	
}
