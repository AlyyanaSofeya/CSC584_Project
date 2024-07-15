package getReceipt;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class ReceiptBean {
    private int orderId;
    private int userId;
    private Date orderDate;
    private BigDecimal totalAmount;
    private String status;
    private List<OrderItem> items;

    // Getters and Setters
    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public Date getOrderDate() { return orderDate; }
    public void setOrderDate(Date orderDate) { this.orderDate = orderDate; }

    public BigDecimal getTotalAmount() { return totalAmount; }
    public void setTotalAmount(BigDecimal totalAmount) { this.totalAmount = totalAmount; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public List<OrderItem> getItems() { return items; }
    public void setItems(List<OrderItem> items) { this.items = items; }
    
    public boolean validate() {
    	if(orderId.isEmpty())
    		return false;
    	else {return true;}
    }
}