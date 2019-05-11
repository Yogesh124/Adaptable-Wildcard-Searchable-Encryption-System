
package poll;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;






import poll.ConnectionProvider;



@WebServlet("/UpdateFileData")
public class UpdateFileData extends HttpServlet {
	
	
	
	
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException,IOException {
    	
    	response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	HttpSession session = request.getSession();
    	try{
    		
    		
    		//String userid = request.getParameter("userid");
    		String fileID = request.getParameter("fileID");
    		String fileData = request.getParameter("fileData");
    		
    		 AESAlgorithm tes = new AESAlgorithm();
             
             String FileData = tes.encrypt(fileData,"mySalt");
    		
    		
    		 Connection con = ConnectionProvider.getConn(); 
             
             Statement st = con.createStatement();
            
           
             
             System.out.println("1");
                 st.executeUpdate("update userfile set FileData='"+FileData+"' where id="+fileID);
                 response.sendRedirect("Files.jsp?updated=success");
                 	
                
                 
             
         } catch (Exception e) { e.getMessage();
         }finally{
    		out.close();
    		
    	}
	}

	
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
	
	
	
	

}
