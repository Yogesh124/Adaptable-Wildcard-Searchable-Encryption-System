<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="poll.RandomString"%>
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

<style type="">
.r1{
border-style: solid;
    border-color: #cccc00;
}

.r2{
border-style: solid;
    border-color: #cc6600;
}

.r3{
border-style: solid;
    border-color: #cc9900;
}

</style>
</head>
<body>
 <%
        if(request.getParameter("status")!=null){
        out.println("<script>alert('Successfully Upload.')</script>");
        }
       
 if(request.getParameter("dedup")!=null){
     out.println("<script>alert('Duplicate file.')</script>");
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
 	<%@ include file="menu.jsp"%>
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
      
      
       <%
                int Userid = Integer.parseInt((String)session.getAttribute("userId"));
            
            %>
           
           		<form action="FileUploadHandler" method="post" enctype="multipart/form-data">
           	<table cellpadding="10" cellspacing="1" border="0" width="500" height="150" style="margin: auto; margin-top:20px">
           
           	<tr class="tableheader">
           	<td colspan="2">File Upload</td>
           	</tr>
           	<tr class="tablerow">
           	<td>Select File</td>
           	<td><input type="file" name="fileName" class="input-text" /></td>
           	</tr>
           	
           	
           	<tr class="tablerow">
           	<td>Identity</td>
           	<td>
				<select name="identity">
				<option value="0">Normal</option>
				<%
				Connection con = ConnectionProvider.getConn();
				PreparedStatement ps = con.prepareStatement("select * from user where not GroupID=?");
				ps.setString(1, session.getAttribute("grupid").toString());
				ResultSet rs = ps.executeQuery();
				while(rs.next())
				{
					
					%>
					<option value="<%=rs.getString("id")%>"><%=rs.getString("fname") %>&nbsp;<%=rs.getString("lname") %></option>
					<% 
				}
				%>
				</select>
				</td>
           	</tr>
           	
           	
           	<tr class="tablerow" style="display:none">
           	<td>Secret Key</td>
           	<td>
           	<%
           	RandomString RS = new RandomString();
           	String RND = RS.generateRandomString();
           	
           	%>
           	<input type="text" name="SecKey" id="SecKey" value="<%= RND  %>" class="input-text" /></td>
           	</tr>
           	
           	 
           	<!-- <tr>
           	<td>WildCard 1</td>
           	<td><input name="root1" placeholder=" Root 1" class="r1" required/></td>
          
           	         
           	</tr>
           	<tr>
           	<td></td>
           	<td>
           	<input name="r1sub1" placeholder=" R1Sub1" class="r1" required>
           	<input name="r1sub2" placeholder=" R1Sub2" class="r1" required>
           	</td>
           	
           
           	</tr>
           	
           	
           	
           	
           	<tr>
           	<td></td>
           	<td>
           	<input name="r1sub3" placeholder=" R1Sub3" class="r1" required>
           	<input name="r1sub4" placeholder=" R1Sub4" class="r1" required>
           	</td>
           	</tr>
           	
           	<tr><td>&nbsp;</td></tr>
           	
           	<tr>
           	<td>WildCard 2</td>
           	 	<td><input name="root2" placeholder=" Root 2" class="r2" required/></td>
           	</tr>
           	<tr>
           	<td></td>
           		<td>
           	<input name="r2sub1" placeholder=" R2Sub1" class="r2" required>
           	<input name="r2sub2" placeholder=" R2Sub2" class="r2" required>
            
           	</td>
           	</tr>
           	<tr>
           	<td></td>
           	 	<td>
           	<input name="r2sub3" placeholder=" R2Sub3" class="r2" required>
           	<input name="r2sub4" placeholder=" R2Sub4" class="r2" required>
           	</td>
           	</tr>
           	
           	<tr><td>&nbsp;</td></tr>
           	
           	<tr>
           	<td>WildCard 3</td>
           	<td><input name="root3" placeholder=" Root 3" class="r3" required/></td> 
           	</tr>
           	<tr>
           	<td></td>
           		<td>
           	<input name="r3sub1" placeholder=" R3Sub1" class="r3" required>
           	<input name="r3sub2" placeholder=" R3Sub2" class="r3" required>
           	</td>
           	</tr>
           	<tr>
           	<td></td>
           		<td>
           	<input name="r3sub3" placeholder=" R3Sub3" class="r3" required>
           	<input name="r3sub4" placeholder=" R3Sub4" class="r3" required>
           	</td>
           	</tr> -->
           	
           	<tr class="tableheader">
           	<td colspan="2"><input type="submit" value="Upload" class="input-button" /></td>
           	</tr>
           	
           	</table>
           	 </form>
      
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