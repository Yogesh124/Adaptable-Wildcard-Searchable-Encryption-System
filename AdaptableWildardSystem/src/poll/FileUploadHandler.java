
package poll;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import poll.AESFileEncryption;

@WebServlet("/FileUploadHandler")
public class FileUploadHandler extends HttpServlet {
   private final String UPLOAD_DIRECTORY = ConnectionProvider.path;//"C:/upload";
   private final String UPLOAD_DIRECTORY1 = "E:/upload/proxy";
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
	   
	   HttpSession session = request.getSession();
       //process only if its multipart content
       if(ServletFileUpload.isMultipartContent(request)){
           try {
        	   
        	   long startUT = 0, endtimeUT = 0;
               long elapsedTimeMillisUT = 0;
               float elapsedTimeSecUT = 0;
               
               long startET = 0, endtimeET = 0;
               long elapsedTimeMillisET = 0;
               float elapsedTimeSecET = 0;
               
               
               
        	   startUT=System.currentTimeMillis();
        	   
        	   
               List<FileItem> multiparts = new ServletFileUpload(
                                        new DiskFileItemFactory()).parseRequest(request);
               DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
               Date date = new Date();            
               String Addeddate=dateFormat.format(date);
               String u_id=(String)session.getAttribute("userId");
               int UserID = Integer.parseInt(u_id);
               Connection con = ConnectionProvider.getConn(); 
               GlobalFunction GF = new GlobalFunction();
               
               String FileName = "";
               String Userid = "";
               String SecKey = "";
               String identity = "";
               String FileExtention = "";
               String FileData = "";
               long FileSize = 0;
               
               String root1 = "";
               String r1s1 = "";
               String r1s2 = "";
               String r1s3 = "";
               String r1s4 = "";
               
               String root2 = "";
               String r2s1 = "";
               String r2s2 = "";
               String r2s3 = "";
               String r2s4 = "";
               
               String root3 = "";
               String r3s1 = "";
               String r3s2 = "";
               String r3s3 = "";
               String r3s4 = "";
               String encData="";
               
               //String digest = "test";
               
               
               for(FileItem item : multiparts){
                   if(!item.isFormField()){
                	   
                       String name = new File(item.getName()).getName();
                       item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
                       
                       FileName = item.getName();
                       FileExtention = item.getContentType();
                       startUT=System.currentTimeMillis();
                       FileName = item.getName();
                       FileSize = item.getSize();
                       float Fsize = (float)FileSize / 60;
                       elapsedTimeSecUT = Fsize / 1000F;
                       
                       
                   }else{
                	   
                	   String UKey = item.getFieldName();
                	   
                	  
                	   
                	   
                	   if(UKey.equalsIgnoreCase("SecKey")){
                		   SecKey = item.getString();
                		   
                	   }
                	   if(UKey.equalsIgnoreCase("identity")){
                		   identity = item.getString();
                		   
                	   }
                	   
                	  /* if(UKey.equalsIgnoreCase("root1")){
                		   root1 = item.getString();
                		   
                	   }
                	   if(UKey.equalsIgnoreCase("r1sub1")){
                		   r1s1 = item.getString();
                		   
                	   }
                	   if(UKey.equalsIgnoreCase("r1sub2")){
                		   r1s2 = item.getString();
                		   
                	   }
                	   if(UKey.equalsIgnoreCase("r1sub3")){
                		   r1s3 = item.getString();
                		   
                	   }
                	   if(UKey.equalsIgnoreCase("r1sub4")){
                		   r1s4 = item.getString();
                		   
                	   }
                	   
                	   
                	   
                	   

                	   if(UKey.equalsIgnoreCase("root2")){
                		   root2 = item.getString();
                		   
                	   }
                	   if(UKey.equalsIgnoreCase("r2sub1")){
                		   r2s1 = item.getString();
                		   
                	   }
                	   if(UKey.equalsIgnoreCase("r2sub2")){
                		   r2s2 = item.getString();
                		   
                	   }
                	   if(UKey.equalsIgnoreCase("r2sub3")){
                		   r2s3 = item.getString();
                		   
                	   }
                	   if(UKey.equalsIgnoreCase("r2sub4")){
                		   r2s4 = item.getString();
                		   
                	   }
                	   
                	   
                	   

                	   if(UKey.equalsIgnoreCase("root3")){
                		   root3 = item.getString();
                		   
                	   }
                	   if(UKey.equalsIgnoreCase("r3sub1")){
                		   r3s1 = item.getString();
                		   
                	   }
                	   if(UKey.equalsIgnoreCase("r3sub2")){
                		   r3s2 = item.getString();
                		   
                	   }
                	   if(UKey.equalsIgnoreCase("r3sub3")){
                		   r3s3 = item.getString();
                		   
                	   }
                	   if(UKey.equalsIgnoreCase("r3sub4")){
                		   r3s4 = item.getString();
                		   
                	   }*/
                	   
                   }
               }
               
              
               
              /* root1 = AESAlgorithm.encrypt(root1, "AES");
               r1s1 = AESAlgorithm.encrypt(r1s1, "AES");
               r1s2 = AESAlgorithm.encrypt(r1s2, "AES");
               r1s3 = AESAlgorithm.encrypt(r1s3, "AES");
               r1s4 = AESAlgorithm.encrypt(r1s4, "AES");
               
               root2 = AESAlgorithm.encrypt(root2, "AES");
               r2s1 = AESAlgorithm.encrypt(r2s1, "AES");
               r2s2 = AESAlgorithm.encrypt(r2s2, "AES");
               r2s3 = AESAlgorithm.encrypt(r2s3, "AES");
               r2s4 = AESAlgorithm.encrypt(r2s4, "AES");
               
               root3 = AESAlgorithm.encrypt(root3, "AES");
               r3s1 = AESAlgorithm.encrypt(r3s1, "AES");
               r3s2 = AESAlgorithm.encrypt(r3s2, "AES");
               r3s3 = AESAlgorithm.encrypt(r3s3, "AES");
               r3s4 = AESAlgorithm.encrypt(r3s4, "AES");*/
               
               
             /*  System.out.println(root1+"=="+r1s1+"=="+r1s2+"=="+r1s3+"=="+r1s4);
               System.out.println(root2+"=="+r2s1+"=="+r2s2+"=="+r2s3+"=="+r2s4);
               System.out.println(root3+"=="+r3s1+"=="+r3s2+"=="+r3s3+"=="+r3s4);
           */    
               
               endtimeUT = System.currentTimeMillis();
               
               String pp = UPLOAD_DIRECTORY+"/"+FileName;
               
               File path = new File(pp);
               
               BufferedReader br = new BufferedReader(new FileReader(UPLOAD_DIRECTORY+"/"+FileName));
               try {
                   StringBuilder sb = new StringBuilder();
                   String line = br.readLine();
                   startET=System.currentTimeMillis();

                   while (line != null) {
                       sb.append(line);
                       sb.append(System.lineSeparator());
                       line = br.readLine();
                   }
                   
                   startET=System.currentTimeMillis();
                   
                    encData = sb.toString();

                   AESAlgorithm tes = new AESAlgorithm();
                   AESFileEncryption AES = new AESFileEncryption();
                   AES.fileEncrypt(path);
                   
                  // FileData = tes.encrypt(encData,"mySalt");
                   
                   
                   
                   endtimeET = System.currentTimeMillis();
                   
                   elapsedTimeMillisET = endtimeET - startET;
                   elapsedTimeSecET = (elapsedTimeMillisET / 500F);
                   System.out.println("Encryption Time-------"+elapsedTimeSecET);
                   
                   //System.out.println("-----FileData----"+FileData);
                   
               } finally {
                   br.close();
                  
               }
               
               
               MessageDigest md = MessageDigest.getInstance("MD5");
               System.out.println("-----afterObj----"+UPLOAD_DIRECTORY+"/"+FileName);
       		String digest = GF.getDigest(new FileInputStream(UPLOAD_DIRECTORY+"/"+FileName), md, 2048);
       		
       		System.out.println("-----digest----"+digest);
       		endtimeUT = System.currentTimeMillis();
       		elapsedTimeMillisUT = (endtimeUT - startUT);
       		System.out.println("Upload Time--------"+elapsedTimeSecUT);
       		
       		
       		PreparedStatement ppp1 = con.prepareStatement("select * from userfile where digestKey=?");
       		ppp1.setString(1, digest);
       		ResultSet rrr1 = ppp1.executeQuery();
       		if(!rrr1.next())
       		{
               System.out.println("Connection created ");
               PreparedStatement st=con.prepareStatement("insert into userfile(uploadedBy,fileName,uploadDate,type,FileSize,digestKey,secKey,identity) values(?,?,?,?,?,?,?,?)");
               
               st.setInt(1,UserID);
               st.setString(2, FileName);
                st.setString(3, Addeddate);
                st.setString(4, FileExtention);                 
                st.setLong(5, FileSize);
                st.setString(6, digest);
               // st.setString(7, FileData);
                st.setString(7, SecKey);
                st.setString(8, identity);
                
            /*st.executeUpdate();*/
            int s = st.executeUpdate();
            if(s>0){
            	int lfid = GF.getLatestFileID();
            	
            	GF.setGraphTime(lfid, elapsedTimeSecUT, elapsedTimeSecET,UserID);
            	
            	String stop = Stopwords.removeStopWords(encData.replaceAll("[?><';:&$#@!]", ""));
            	String wildcard[] = stop.split(" ");
            	for(int i=0;i<wildcard.length;i++)
            	{
            		String enc = AESAlgorithm.encrypt(wildcard[i], "AES");
            		
            		PreparedStatement ppp = con.prepareStatement("insert into enckey1(fileid,wildcard) values(?,?)");
            		ppp.setInt(1, lfid);
            		ppp.setString(2, enc);
            		ppp.executeUpdate();
            	}
            	//storeWildcars(Integer.toString(lfid), root1, r1s1, r1s2, r1s3, r1s4, root2, r2s1, r2s2, r2s3, r2s4, root3, r3s1, r3s2, r3s3, r3s4);
            	
            }
            CopyToServer1 CTS = new CopyToServer1();
			CTS.CopyToFolder1(FileName);
            
            int lfid = GF.getLatestFileID();
            
            System.out.println("lf id "+lfid);
            System.out.println("elapsedTimeMillisUT "+elapsedTimeMillisUT);
            System.out.println("elapsedTimeSecUT "+elapsedTimeSecUT);
            System.out.println("u id "+u_id);
            System.out.println("File name "+FileName);   
              request.setAttribute("message", "File Uploaded Successfully");
              
              request.getRequestDispatcher("/UploadFile.jsp?status=success").forward(request, response);
       	 }else
         {
      	   
       		response.sendRedirect("UploadFile.jsp?dedup");
         }
              
           } catch (Exception ex) {
              request.setAttribute("message", "File Upload Failed due to " + ex);
           }          
        
       }else{
           request.setAttribute("message",
                                "Sorry this Servlet only handles file upload request");
       }
   
      // request.getRequestDispatcher("/UploadFile.jsp?status=success").forward(request, response);
       
   } 
 
   public void storeWildcars(String fileid,String root1,String r1s1,String r1s2,String r1s3,String r1s4,String root2,String r2s1,String r2s2,String r2s3,String r2s4,String root3,String r3s1,String r3s2,String r3s3,String r3s4)throws Exception
   {
	   
	   Connection con = ConnectionProvider.getConn();
	   PreparedStatement ps = con.prepareStatement("insert into enckey(fileid,root1,r1s1,r1s2,r1s3,r1s4,root2,r2s1,r2s2,r2s3,r2s4,root3,r3s1,r3s2,r3s3,r3s4) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	   ps.setString(1 , fileid);
	   ps.setString(2 , root1);
	   ps.setString(3 , r1s1);
	   ps.setString(4 , r1s2);
	   ps.setString(5 , r1s3);
	   ps.setString(6 , r1s4);
	   ps.setString(7 , root2);
	   ps.setString(8 , r2s1);
	   ps.setString(9 , r2s2);
	   ps.setString(10 , r2s3);
	   ps.setString(11 , r2s4);
	   ps.setString(12 , root3);
	   ps.setString(13 , r3s1);
	   ps.setString(14 , r3s2);
	   ps.setString(15 , r3s3);
	   ps.setString(16 , r3s4);
	   ps.executeUpdate();
   }
}