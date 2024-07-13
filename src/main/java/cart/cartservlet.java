package cart;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/your_database";
    private String jdbcUsername = "root";
    private String jdbcPassword = "password";

    private static final String SELECT_ALL_ITEMS = "SELECT * FROM cart";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public List<CartItem> selectAllItems() {
        List<CartItem> items = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ITEMS);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String productName = rs.getString("product_name");
                String description = rs.getString("description");
                String imageUrl = rs.getString("image_url");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                items.add(new CartItem(productName, description, imageUrl, price, quantity));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }
}
