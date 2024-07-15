package getReceipt;

import jakarta.servlet.ServletException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/receiptServlet")
public class ReceiptServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public receiptServlet() {
    	super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        try {
        	
        	receiptBean bean = new receiptBean();
        	
        	update up = new update();
        	
            int orderId = request.getParameter("orderId");
            
            bean.setOrderId(orderId);
            
            boolean status=up.insertNew(bean);
            boolean status2 = bean.validate();
            
            if(status&&status2) {
            	request.setAttribute("bean",bean);
            	RequestDispatcher rd = request.getRequestDispatcher("getReceipt.jsp");
                rd.forward(request, response);
            }
            else {
                RequestDispatcher rd = request.getRequestDispatcher("errorReceipt.jsp");
                rd.forward(request, response);
            }

        } catch (Throwable theException) {System.out.println(theException);} 
    }
}
