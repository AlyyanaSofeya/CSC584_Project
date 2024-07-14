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
import jakarta.servlet.RequestDispatcher;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;
    
    public RegisterServlet() {
    	super();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        
        
        RequestDispatcher dispatcher = null;
        Connection con = null;
        
        try {
        	User user = new User();
        	userDAO up = new userDAO();
        	
        	String name = request.getParameter("name");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String contact = request.getParameter("contact");
            
            user.setName(name);
            user.setUsername(username);
            user.setEmail(email);
            user.setPassword(password);
            user.setPhoneNumber(contact);
        	
            boolean status1 = up.insertNew(user);
            boolean status2 = user.validate();
            
            dispatcher = request.getRequestDispatcher("registration.jsp");
            
            if(status1&&status2) {
                request.setAttribute("status","success");
            } else {
                request.setAttribute("status","failed");
            }
    
            dispatcher.forward(request,response);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
