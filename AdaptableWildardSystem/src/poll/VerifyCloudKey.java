
package poll;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/VerifyCloudKey")
public class VerifyCloudKey extends HttpServlet {
	

	private static final long serialVersionUID = 1L;
	public static String impdtd = "30";
	public static String impdtm = "5";

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
	
	loginRequest(request,response);
}

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
	
	loginRequest(request,response);
}

private void loginRequest(HttpServletRequest request,
		HttpServletResponse response) throws ServletException,IOException {
	
	
	response.setContentType("text/html;charset=UTF-8");
	HttpSession session = request.getSession();
	PrintWriter out = response.getWriter();
	
	try{
		String CloudSecretKeyUser = request.getParameter("CloudSecretKey");
		int fileID = Integer.parseInt(request.getParameter("fileID"));
		
		
		Connection con = ConnectionProvider.getConn();
		Statement st = con.createStatement();
		
		ResultSet rs = st.executeQuery("select * from userfile where id="+fileID);
		
		if(rs.next()){
			
			String CloudSecretKey = rs.getString("CloudSecretKey");
			
			
			if(CloudSecretKey.equalsIgnoreCase(CloudSecretKeyUser)){
				response.sendRedirect("DataOwnerVerifyKey.jsp?Fileid="+fileID);
				
				
				
			}else{
				
					response.sendRedirect("Files.jsp?failCloud=incorrect");
                
				
				
			}
			
			
		}
		
		
	}catch(Exception e){
		out.println(e);
	}finally{
		
		out.close();
	}
	
	
}
	

}
