<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="poll.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="poll.GlobalFunction"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%@include file="title.jsp" %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="layout/styles/layout.css" type="text/css" />
<script type="text/javascript" src="layout/scripts/jquery.min.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.slidepanel.setup.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.ui.min.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.tabs.setup.js"></script>
</head>
<body>
<%
        if(request.getParameter("status")!=null){
        out.println("<script>alert('Successfully updates...')</script>");
        }
       
        
        %>
<div class="wrapper col0">
  <div id="topbar">
    <div id="slidepanel">
      
      
      
      <br class="clear" />
    </div>
    
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col1">
  <div id="header">
    <div id="logo">
     <%@include file="logo.jsp" %>
    </div>
    
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col2">
  <div id="topnav">
     <%@ include file="menu.jsp" %>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="featured_slide">
    <div id="featured_wrap">
      <ul id="featured_tabs">
        <li><a href="#fc1"></a></li>
        <li><a href="#fc2"></a></li>
        <li><a href="#fc3"></a></li>
        <li class="last"><a href="#fc4"></a></li>
      </ul>
      <div id="featured_content">
       <%@include file="slider.jsp" %>
      </div>
    </div>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div id="container">
    <div id="hpage" align="center">
      
      <h5 style="color: steelblue">Welcome <%=(String)session.getAttribute("fname")%></h5>
       
       <%
                    
                       
       					int Userid = Integer.parseInt(request.getParameter("userid"));
                        Connection con = ConnectionProvider.getConn();
                        
                       
                        Statement st= con.createStatement();
                        ResultSet rs = st.executeQuery("select * from user where id="+Userid);
                        while(rs.next()){
                        
                           
                            %>
                            <form method="post" action="EditAccount" name="updateForm">
           <table cellspacing="1" cellpadding="10" style="width:50%; line-height: 30px; margin-left: auto; margin-right: auto;">
                    
               <tr class="tableheader">
                   <td colspan="3">Update Account</td>                        
                    </tr>
                   
                    <tr class="tablerow">
                        <td><span style="color: brown; font-weight: bold;">First name</span> </td><td>:</td><td><input type="text" name="fname" value="<%= rs.getString("fname")%>"></td>                        
                    </tr>                    
                    <tr class="tablerow">
                        <td><span style="color: brown; font-weight: bold;">Last name </span></td><td>:</td><td><input type="text" name="lname" value="<%= rs.getString("lname")%>"> </td>                        
                    </tr>
                    <tr class="tablerow">
                        <td><span style="color: brown; font-weight: bold;">Gender </span></td><td>:</td><td>
                        <select name="gender" id="gender">
					<option name="0" value="0">-- Select --</option>
					<%
					
					String gn = rs.getString("gender");
					
					if(gn.equalsIgnoreCase("Male")){
						%>
						<option name="gender" value="Male" selected>Male</option>
						<option name="gender" value="FeMale">FeMale</option>
						<%
						}else{
							%>
							<option name="gender" value="Male">Male</option>
							<option name="gender" value="FeMale" selected>FeMale</option>
							<%						
					}
					%>
					
					</select></td>                        
                    </tr>
                    <tr class="tablerow">
                        <td><span style="color: brown; font-weight: bold;">Email </span></td><td>:</td><td><input type="text" name="email" value="<%= rs.getString("email")%>" disabled></td>                        
                    <input type="hidden" name="email" id="email" value="<%= rs.getString("email")%>">
                    </tr>
                     <tr class="tablerow">
                        <td><span style="color: brown; font-weight: bold;">Contact Number </span></td><td>:</td><td><input type="text" name="contactNo" value="<%= rs.getString("contactNo")%>"> </td>                        
                    </tr>
                    <tr class="tablerow">
                        <td><span style="color: brown; font-weight: bold;">Password </span></td><td>:</td><td><input type="text" name="password" value="<%= rs.getString("password")%>"> </td>                        
                    </tr>                    
                  
                    <tr class="tablerow">
                        <td><span style="color: brown; font-weight: bold;">Registration Date</span> </td><td>:</td><td><%= rs.getString("regDate")%> </td>                        
                    </tr>
                    <tr class="tablerow">
                            <td colspan="3">  &nbsp; </td>                   
                    </tr>
                    <tr class="tablerow" >
                        <td colspan="3"><input type="submit" value="Update" name="update"/></td>                        
                    </tr>
                   
                    
                </table>
                </form>
           <%
                        }
                    
                    %>
      
      
      <br class="clear" />
    </div>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col5">
  <div id="footer">
    <div id="newsletter">
      
    </div>
    <div class="footbox">
      
    </div>
    <div class="footbox">
      
    </div>
    <div class="footbox">
      
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col6">
  <div id="copyright">
    <p class="fl_left">Copyright &copy; - All Rights Reserved - </p>
    
    <br class="clear" />
  </div>
</div>
</body>
</html>