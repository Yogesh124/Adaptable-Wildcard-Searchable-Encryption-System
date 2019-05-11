
package poll;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;

public class function {
	
	public int getvotesCount(int poll_id,int vote_ans) throws Exception{
	int cnt=0;
		
		
		Connection con=ConnectionProvider.getConn();
		Statement st =con.createStatement();
		ResultSet rs = st.executeQuery("select count(vote_ans) from poll_result where poll_id='"+poll_id+"' and vote_ans='"+vote_ans+"'");
		while(rs.next()){
			
			cnt=rs.getInt("count(vote_ans)");
		}
		
		
	return cnt;	
	}

}
