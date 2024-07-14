package RegisterModel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class userDAO {
	
	public boolean insertNew(User user)throws SQLException{
		boolean status = false;
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false","root","root");
        PreparedStatement ps = con.prepareStatement("insert into customer(CustName, Username, CustEmail, CustPhoneNum, Pass) values(?,?,?,?,?)");
        
        String n = user.getName();
        String u = user.getUsername();
        String e = user.getEmail();
        String p = user.getPassword();
        String c = user.getPhoneNumber();
        
        ps.setString(1, n);
        ps.setString(2, u);
        ps.setString(3, e);
        ps.setString(4, c);
        ps.setString(5, p);
        
        int rowCount = ps.executeUpdate();
        
        if(rowCount > 0) 
            status = true;
        
        con.close();
        }catch (Exception e) {
        	System.out.println(e);
		
	}
		return status;
	
    }
}
