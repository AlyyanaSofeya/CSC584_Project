package RegisterModel;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	
    	String name = request.getParameter("name");
    	String username = request.getParameter("username");
    	String name = request.getParameter("email");
    	String name = request.getParameter("password");
    	String name = request.getParameter("contact");
    	
    	
        try {
        	Class.forName("com.mysql.jdbc.Driver");
        	Connection con = DriverManager.getConnection("jdbc:mysql//localhost:3306/project","root","root");
        	PreparedStatement ps = con.prepareStatement("insert into customer(CustName, Username, CustEmail, CustPhoneNum, Pass) values(?,?,?,?,?)");
        	
        	
        }catch (Exception e) {
        	
        }
    }
}
