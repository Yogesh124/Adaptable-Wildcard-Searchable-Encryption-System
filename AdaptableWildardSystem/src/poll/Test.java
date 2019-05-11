package poll;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.tomcat.dbcp.dbcp.DbcpException;

public class Test {

	public static void main(String[] args)throws Exception{
		// TODO Auto-generated method stub

		Connection con = ConnectionProvider.getConn();
		PreparedStatement ps = con.prepareStatement("select * from enckey1");
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			String str = AESAlgorithm.decrypt(rs.getString("wildcard"), "AES");
			System.out.println(str);
		}
	}

}
