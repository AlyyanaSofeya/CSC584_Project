package cart;

public class CartItem {
    private String productName;
    private String description;
    private String imageUrl;
    private double price;
    private int quantity;

    // Constructor
    public CartItem(String productName, String description, String imageUrl, double price, int quantity) {
        this.productName = productName;
        this.description = description;
        this.imageUrl = imageUrl;
        this.price = price;
        this.quantity = quantity;
    }

    // Getters
    public String getProductName() {
        return productName;
    }

    public String getDescription() {
        return description;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    // Setters
    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
