package getReceipt;

import java.util.List;

import java.util.List;

public class OrderHistoryBean {
    private int userId;
    private List<OrderDetail> orders;

    // Getters and Setters
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public List<OrderDetail> getOrders() { return orders; }
    public void setOrders(List<OrderDetail> orders) { this.orders = orders; }
}