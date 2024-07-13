package paymentServlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class paymentDao {

	public double totalAmount(OrderProduct bean)throws SQLException{
		
		int orderID=bean.getOrderID();
		String sql="SELECT TotalPrice FROM order WHERE OrderID=?";
		double totalAmount=0;
		try {
			//i.initialize JDBC connection and prepared statement
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject","root","root");
			PreparedStatement statement=con.prepareStatement(sql);
			
			statement.setInt(1,orderID);
			ResultSet rs=statement.executeQuery();
			
			if(rs.next()) {
				totalAmount+=rs.getDouble("TotalPrice");
			}
			
			con.close();		
		}catch(Exception ex){System.out.println(ex);}
		
		return totalAmount;
		
	}
	
	public boolean insertDeliveryData(delivery beanDelivery) throws SQLException {
	    boolean success = false;
	    
	    try {
	    	Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject","root","root");
			PreparedStatement ps=con.prepareStatement("insert into delivery(Name, Address, City, PostalCode) values(?,?,?,?)");
	        
	        String n=beanDelivery.getName();
	        String p=beanDelivery.getAddress();
	        String q=beanDelivery.getCity();
	        String s=beanDelivery.getPostalCode();
	        
	        ps.setString(1, n);
	        ps.setString(2, p);
	        ps.setString(3, q);
	        ps.setString(4, s);
	        
	        
	        int rowsInserted = ps.executeUpdate();
	        if (rowsInserted>0) {
	            success = true;
	        }
	    } catch(Exception ex){System.out.println(ex);}
	    
	    
	    return success;
	}
	
	public boolean insertReceipt(Receipt beanReceipt) throws SQLException {
	    boolean success = false;
	    
	    try {
	    	Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject","root","root");
			PreparedStatement ps=con.prepareStatement("insert into receipt(ReceiptDate, ReceiptTime, PaymentMethod, DeliveryType) values(?,?,?,?)");
	        
	        String n=beanReceipt.getReceiptDate();
	        String p=beanReceipt.getReceiptTime();
	        String q=beanReceipt.getPaymentMethod();
	        String s=beanReceipt.getDeliveryType();
	        
	        ps.setString(1, n);
	        ps.setString(2, p);
	        ps.setString(3, q);
	        ps.setString(4, s);
	        
	        
	        int rowsInserted = ps.executeUpdate();
	        if (rowsInserted>0) {
	            success = true;
	        }
	    } catch(Exception ex){System.out.println(ex);}
	    
	    
	    return success;
	}

	public boolean insertPickupData(String PickupTime,String PickupDate) {
	    boolean success2 = false;
	    
	    try  {
	    	Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject","root","root");
			PreparedStatement ps=con.prepareStatement("insert into pickup(PickupTime,PickupDate) values(?,?)");
			
		
	        ps.setString(1, PickupTime);
	        ps.setString(2, PickupDate);
	        
	        int rowsInserted = ps.executeUpdate();
	        if (rowsInserted > 0) {
	            success2 = true;
	        }
	    } catch(Exception ex){System.out.println(ex);}
	    
	    return success2;
	}


public List<OrderProduct> getCartDetailsByOrderId(int orderId) throws SQLException {
    List<OrderProduct> cartDetails = new ArrayList<>();

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject", "root", "root");

        String query = "SELECT ProdID, ProductQuantity, TotalAmount FROM order_product WHERE OrderID = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, orderId);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            int productId = rs.getInt("ProdID");
            int quantity = rs.getInt("ProductQuantity");
            double totalPrice = rs.getDouble("TotalAmount");

            OrderProduct orderProduct = new OrderProduct(orderId,productId, quantity, totalPrice);
            cartDetails.add(orderProduct);
        }

        rs.close();
        ps.close();
        con.close();
    } catch (Exception ex) {
        System.out.println("Error: " + ex.getMessage());
    }

    return cartDetails;
}
}

