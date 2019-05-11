package poll;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class search
 */
@WebServlet("/search")
public class search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		HashSet<String> set = new HashSet<String>(); 
		HttpSession session = request.getSession();
		try{
		String arr[] = search.split(" ");
		Connection con = ConnectionProvider.getConn();
		for(int i=0;i<arr.length;i++)
		{
			String str = AESAlgorithm.encrypt(arr[i], "AES");
			System.out.println(str);
			PreparedStatement ps = con.prepareStatement("select * from enckey1");
			//ps.setString(1, str);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				System.out.println("1");
				String wild = rs.getString("wildcard");
				if(wild.equals(str)){
				set.add(rs.getString("fileid"));
				}
			}
		}
		
		session.setAttribute("set", set);
		System.out.println(set);
	
		response.sendRedirect("search.jsp?done");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String search = request.getParameter("search");
		HashSet set = new HashSet(); 
		HttpSession session = request.getSession();
		try {
			search = AESAlgorithm.encrypt(search.trim(), "AES");
			Connection con = ConnectionProvider.getConn();
			PreparedStatement ps = con.prepareStatement("select * from enckey where root1=? OR root2=? OR root3=?");
			ps.setString(1, search);
			ps.setString(2, search);
			ps.setString(3, search);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				set.add(rs.getString("fileid")); 
			}
			
			
			PreparedStatement ps1 = con.prepareStatement("select * from enckey where r1s1=? OR r1s2=? OR r1s3=? OR r1s4=?");
			ps1.setString(1, search);
			ps1.setString(2, search);
			ps1.setString(3, search);
			ps1.setString(4, search);
			ResultSet rs1 = ps1.executeQuery();
			while(rs1.next())
			{
				 
				set.add(rs1.getString("fileid"));
				String root = rs1.getString("root1");
			
				Store(root, con, set);
			}
			
			
			
			PreparedStatement ps2 = con.prepareStatement("select * from enckey where r2s1=? OR r2s2=? OR r2s3=? OR r2s4=?");
			ps2.setString(1, search);
			ps2.setString(2, search);
			ps2.setString(3, search);
			ps2.setString(4, search);
			ResultSet rs2 = ps2.executeQuery();
			while(rs2.next())
			{
				 
				set.add(rs2.getString("fileid"));
				String root = rs2.getString("root2");
			
				Store(root, con, set);
			}
			
			
			
			PreparedStatement ps3 = con.prepareStatement("select * from enckey where r3s1=? OR r3s2=? OR r3s3=? OR r3s4=?");
			ps3.setString(1, search);
			ps3.setString(2, search);
			ps3.setString(3, search);
			ps3.setString(4, search);
			ResultSet rs3 = ps3.executeQuery();
			while(rs3.next())
			{
				
				set.add(rs3.getString("fileid"));
				String root = rs3.getString("root3");
			
				Store(root, con, set);
			}
			
			
			session.setAttribute("set", set);
			System.out.println(set);
		
			response.sendRedirect("search.jsp?done");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void Store(String root,Connection con,HashSet set)throws Exception
	{
		PreparedStatement ps2 = con.prepareStatement("select * from enckey where root1=? OR root2=? OR root3=?");
		ps2.setString(1, root);
		ps2.setString(2, root);
		ps2.setString(3, root);
		ResultSet rs2 = ps2.executeQuery();
		while(rs2.next())
		{
			 
			set.add(rs2.getString("fileid"));
		}
	}

}
