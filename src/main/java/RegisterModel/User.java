package RegisterModel;

public class User {
	    private String name;
	    private String phoneNumber;
	    private String email;
	    private String username;
	    private String password;

	    // Getters
	    public String getName() {
	        return name;
	    }

	    public String getPhoneNumber() {
	        return phoneNumber;
	    }

	    public String getEmail() {
	        return email;
	    }

	    public String getUsername() {
	        return username;
	    }

	    public String getPassword() {
	        return password;
	    }

	    // Setters
	    public void setName(String name) {
	        this.name = name;
	    }

	    public void setPhoneNumber(String phoneNumber) {
	        this.phoneNumber = phoneNumber;
	    }

	    public void setEmail(String email) {
	        this.email = email;
	    }

	    public void setUsername(String username) {
	        this.username = username;
	    }

	    public void setPassword(String password) {
	        this.password = password;
	    }
	    
	    public boolean validate() {
	    if(password.isEmpty())
	    	return false;
	    else
	    	return true;
	    }
}
