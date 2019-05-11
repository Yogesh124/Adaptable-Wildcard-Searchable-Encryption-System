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
<script>

    function ValidateQuetion(Fileid) {

        //alert(Fileid);
        var answer = prompt("Enter Secret Key");
      
        if (answer !== null) {
            $("#hidden_link").trigger('click');
            window.location.replace("DownloadServlet?Fileid=" + Fileid +"&secKey=" + answer);
        }
        else
        {

        }
    }
    
</script>
</head>

<body>
<%
if(request.getParameter("fail")!=null){
	   out.println("<script>alert('Incorrect secret code.');</script>"); 
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
       <h2>Cloud Permission</h2>
       
       <form action="VerifyCloudKey" method="post">
           <table border="0" cellpadding="10" cellspacing="1" style="width:50%; border:1px solid #ccc; margin-top:40px; margin-left: auto; margin-right: auto" >
                    
                    <tr class="tableheader">
                        <td colspan="3">Cloud Permission</td>
                      
                          
                    </tr>
                    <%
                   // boolean Authorised=false;
                    int FileId = Integer.parseInt(request.getParameter("Fileid"));
                       
                        Connection con = ConnectionProvider.getConn();
                       
                       
                        Statement st= con.createStatement();
                        ResultSet rs = st.executeQuery("select * from userfile where id="+FileId);
                        while(rs.next()){
                        int Fileid = rs.getInt("id");
                        
                        
                        
                        String fileName = rs.getString("fileName");
                       
                        String uploadDate = rs.getString("uploadDate");
                       
                       
                        String type = rs.getString("type");
                        
                            %>
                        
                    
                    <tr class="tablerow">
                       <td>File ID</td><td>:</td><td><%= Fileid %>
                       <input type="hidden" name="fileID" id="fileID" value="<%= Fileid %>"></input>
                       </td>
                    </tr>
                    <tr class="tablerow">
                       <td>File Name</td><td>:</td><td><%= fileName %></td>
                    </tr>
                    
                     
                    
                        <tr class="tablerow">
                       
                     	<td>Enter Cloud key</td><td>:</td><td><input type="text" name="CloudSecretKey"></input></td>
                     </tr>
                       <tr class="tablerow">
                    <td colspan="3">&nbsp;</td>
                    </tr>
                 
                    <tr class="tableheader">
                    <td colspan="3"><input type="submit" value="Submit" name="submit"></input></td>
                    </tr>
                    <%
                        
                        }
                    
                    %>
                    
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