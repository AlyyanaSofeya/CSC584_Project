package RegisterModel;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "register", urlPatterns={"/RegisterServlet"})
public class RegisterServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	response.setContentType("text/html");
    	
    	String name = request.getParameter("name");
    	String username = request.getParameter("username");
    	String email = request.getParameter("email");
    	String password = request.getParameter("password");
    	String contact = request.getParameter("contact");
    	
    	RequestDispatcher dispatcher = null;
    	Connection con = null;
    	
        try {
        	Class.forName("com.mysql.jdbc.Driver");
        	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false","root","root");
        	PreparedStatement ps = con.prepareStatement("insert into customer(CustName, Username, CustEmail, CustPhoneNum, Pass) values(?,?,?,?,?)");
        	
        	ps.setString(1,  name);
        	ps.setString(2,  username);
        	ps.setString(1,  email);
        	ps.setString(1,  contact);
        	ps.setString(1,  password);
        	
        	int rowCount = ps.executeUpdate();
        	
        	dispatcher = request.getRequestDispatvher("registration.jsp");
        	
        	if(rowCount > 0) {
        		request.setAttribute("status","success");
        	}else {
        		request.setAttribute("status","failed");
        	}
    
        	dispatcher.forward(request,response);
        	
        }catch (Exception e) {
        	e.printStackTrace();
        }finally {
        	try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
