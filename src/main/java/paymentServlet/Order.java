package paymentServlet;

public class Order {
	private int orderId,custId;
	private double totalPrice;
	
	public int getOrderId() {return orderId;}
	public double getTotalPrice() {return totalPrice;}
	public int getCustId() {return custId;}
	
	public void setOrderId(int orderId) {this.orderId=orderId;}
	public void setTotalPrice(double totalPrice) {this.totalPrice=totalPrice;}
	public void setCustId(int custId) {this.custId=custId;}
	
}
