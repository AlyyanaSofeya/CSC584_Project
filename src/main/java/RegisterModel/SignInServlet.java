package RegisterModel;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/SignInServlet")
public class SignInServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	public SignInServlet()
	{
		super();
	}
  
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
    	response.setContentType("text/html");
		
		try 
		{
			
			UserBean bean = new UserBean();
			
			AdminBean ad = new AdminBean();
			
			Update up = new Update();
			
	        String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        
	        boolean status1;
	        boolean status2;
	        
	        
	        if(username.contains("admin"))
	        {
	        	ad.setUsername(username);
	 	        ad.setPassword(password);
	 	        
	 	        status1 = up.checkAdmin(ad);
	 	        status2 = ad.validate();
	 	        
	        	if(status1 && status2)
		        {
		        	request.setAttribute("ad",ad);
		        	RequestDispatcher ds = request.getRequestDispatcher("admin.jsp");
		        	ds.forward(request, response);
		        }
	        	else
		        {
		        	request.setAttribute("ad",ad);
		        	RequestDispatcher ds = request.getRequestDispatcher("failedSignin.jsp");
		        	ds.forward(request, response);
		        }
	        }
	        else
	        {
	        	bean.setUsername(username);
	 	        bean.setPassword(password);
	 	        
	 	        status1 = up.checkValidation(bean);
		        status2 = bean.validate2();
	 	        
		        if(status1 && status2)
		        {
		        	request.setAttribute("bean",bean);
		        	RequestDispatcher  ds = request.getRequestDispatcher("index.html");
		        	ds.forward(request, response);
		        }
		        else
		        {
		        	request.setAttribute("bean",bean);
		        	RequestDispatcher ds = request.getRequestDispatcher("failedSignin.jsp");
		        	ds.forward(request, response);
		        }
		     
	        }
	    
		}
		
		catch (Exception e) 
		{
            e.printStackTrace();
        }

    }
}
