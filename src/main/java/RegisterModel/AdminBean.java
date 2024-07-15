package RegisterModel;

public class AdminBean 
{
    private String username;
    private String password;

    // Getters
    public String getUsername() {return username;}

    public String getPassword() { return password;}

    // Setters
    public void setUsername(String username) {this.username = username;}

    public void setPassword(String password) {this.password = password;}
    
    public boolean validate() 
    {
	    if(password.isEmpty() || username.isEmpty()) 
	    	return false;
	    else
	    	return true;
	 }
}
