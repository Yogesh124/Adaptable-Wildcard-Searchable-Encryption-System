
package poll;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/VerificationSendToServer")
public class VerificationSendToServer extends HttpServlet {
	

	private static final long serialVersionUID = 1L;
	public static String impdtd = "30";
	private final String UPLOAD_DIRECTORY = "E:/upload";
	private final String UPLOAD_DIRECTORY1 = ConnectionProvider.path;//E:/upload/server/";
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
		
		int fileID = Integer.parseInt(request.getParameter("Fileid"));
		
		System.out.println(fileID);
		Connection con = ConnectionProvider.getConn();
		Statement st = con.createStatement();
		Statement st1 = con.createStatement();
		Statement st2 = con.createStatement();
		Statement st3 = con.createStatement();
		ThresholdSecretKey TSK = new ThresholdSecretKey();
		GlobalFunction GF = new GlobalFunction();
		ResultSet rs = st.executeQuery("select * from userfile where id="+fileID);
		
		if(rs.next()){
			
			String digestKey = rs.getString("digestKey");
			String fileName = rs.getString("fileName");
			
			CopyToServer CTS = new CopyToServer();
			CTS.CopyToFolder(fileName);
			
			st1.executeUpdate("update userfile set VerificationStatus='Server' where id="+fileID);
			out.println("Challenge Sent To Server.");
			 MessageDigest md = MessageDigest.getInstance("MD5");
             System.out.println("-----afterObj----"+UPLOAD_DIRECTORY1+"/"+fileName);
     		String digest = GF.getDigest(new FileInputStream(UPLOAD_DIRECTORY1+"/"+fileName), md, 2048);
     		
     		st2.executeUpdate("update userfile set tpaverification='Verified' , serverDigestKey='"+digest+"' where id="+fileID);   
     		out.println("Tag successfully generated.");
     		
			st3.executeUpdate("update userfile set VerificationStatus='ResponseToTPA' where id="+fileID);
			out.println("Proof Sent To TPA.");
			//String digest1 = rs.getString("serverDigestKey");
     		
     		if(digest.equalsIgnoreCase(digestKey)){
     			
     			st1.executeUpdate("update userfile set VerificationStatus='Verified' where id="+fileID);     			
     			out.println("File Verified");
     			
     		}else{
     			st1.executeUpdate("update userfile set VerificationStatus='Hacked' where id="+fileID);
     			out.println("File is Hacked");
     		}
		}
		
		
		
		
		
	}catch(Exception e){
		out.println(e);
	}finally{
		
		out.close();
	}
	
	
}
	

}
