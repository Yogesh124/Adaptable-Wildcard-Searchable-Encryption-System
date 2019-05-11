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
       <h2>View Graph </h2>
       
       <table border="0" cellpadding="10" cellspacing="1" style="width:100%; border:1px solid #ccc; margin-top:40px" >
                    
                    <tr class="tableheader">
                        <td>File Id</td>
                        <td>File Name</td>
                        <td>Upload Graph</td>
                        <td>Download Graph</td>
                        
                        
                          
                    </tr>
                    <%
                   // boolean Authorised=false;
                       GlobalFunction GF = new GlobalFunction();
                        Connection con = ConnectionProvider.getConn();
                        int Userid = Integer.parseInt((String)session.getAttribute("userId"));
                        int srno = 1;
                        System.out.println("userid:"+Userid);
                        Statement st= con.createStatement();
                        System.out.println("Before Query");
                        ResultSet rs = st.executeQuery("select * from userfile where uploadedBy='"+Userid+"'");
                        while(rs.next()){
                        int Fileid = rs.getInt("id"); 
                        
                        
                /*         String remail = rs.getString("remail"); */
                        String fileName = rs.getString("fileName");
                        
                        
                            %>
                            
                    
                    <tr class="tablerow">
                        <td><%= Fileid %></td>
                        <%-- <td><%= remail %></td> --%>
                        <td><%= fileName %></td>
                        <td>
                        <a  href="Graph.jsp?id=<%=Fileid%>&file=<%=fileName%>" style="color:maroon; ">Upload Graph</a>
        				</td>
        				<td>
                        <a  href="Graph2.jsp?id=<%=Fileid%>&file=<%=fileName%>" style="color:maroon; ">Download Graph</a>
        				</td>
                    
                        
                    <%
                        
                        }
                    
                    %>
                    
                </table>
      
      
      
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