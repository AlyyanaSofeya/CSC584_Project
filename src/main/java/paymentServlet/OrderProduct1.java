package paymentServlet;

public class OrderProduct1 {
	private int orderID,prodID,productQuantity;
	private double totalAmount;
	
	public int getOrderID() {return orderID;}
	public int getProdID() {return prodID;}
	public int getProductQuantity() {return productQuantity;}
	public double getTotalAmount() {return totalAmount;}
	
	public void setOrderID(int orderID) {this.orderID=orderID;}
	public void setProdID(int prodID) {this.prodID=prodID;}
	public void setProductQuantity(int productQuantity) {this.productQuantity=productQuantity;}
	public void setTotalAmount(double totalAmount) {this.totalAmount=totalAmount;}
	
	public OrderProduct(int orderID,int prodID, int productQuantity,double totalAmount) {
		this.orderID=orderID;
		this.prodID=prodID;
		this.productQuantity=productQuantity;
		this.totalAmount=totalAmount;
	}
}
