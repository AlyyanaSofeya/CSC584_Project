package paymentServlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class paymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public paymentController () {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doGet(request, response);
		int bank=Integer.parseInt(request.getParameter("bank"));
		if(bank==1) {
			RequestDispatcher rd=request.getRequestDispatcher("bsn.jsp");
			rd.forward(request, response);
		}
		
		else {
			RequestDispatcher rd=request.getRequestDispatcher("maybank.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
			
		
		

}
}
