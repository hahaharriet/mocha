package product.model;

public class Product {
    
    private int productno;
    private String productname;
    private String imgname;
    private String description;
    private int price;
	
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
	public String getimgname() {
		return imgname;
	}
	public void setimgname(String imgname) {
		this.imgname = imgname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Product [productno=" + productno + ", productname=" + productname + ", imgname=" + imgname
				+ ", description=" + description + ", price=" + price + "]";
	}
    
	

    
}
