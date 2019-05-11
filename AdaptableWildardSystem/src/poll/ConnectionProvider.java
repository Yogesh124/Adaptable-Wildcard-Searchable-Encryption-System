

package poll;
import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConnectionProvider {
    private static Connection con=null;
    private static Connection con1=null;
    public static String path="";
	static{
		File file = new File("");
		path = file.getAbsolutePath();
	}
    public static Connection getConn(){
        try{
            
        if(con==null){
         Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wildcard","root","1234"); 
        return con;
        }else{
           return con;  
        }
       
    }   catch(Exception e){
        e.printStackTrace();
    }
        return con;
    } 
    
       
}
