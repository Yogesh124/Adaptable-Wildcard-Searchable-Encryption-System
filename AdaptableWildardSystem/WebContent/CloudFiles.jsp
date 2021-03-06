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
    
    
    function GenerateTag(Fileid) {

        //alert(Fileid);
    	 $('#loading').html('<img src="images/loading_spinner.gif" style="width:100px; height:100px">').css("display","block");
         $.ajax({
             url:'GenerateTag',
             type:'POST',
             datatype:'json',
             data:{"Fileid":Fileid},
             success:function(data){
                 $('#loading').css("display","none");
                 alert(data);
                 
             }
             
             
             
             
         });
    }
    
    
</script>
</head>

<body>
<%

if(request.getParameter("success")!=null){
	   out.println("<script>alert('Successfully Encrypted.');</script>"); 
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
   <%@ include file="CloudMenu.jsp"%>
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
      <h2>View All Files</h2>
      
      
       <table border="0" cellpadding="10" cellspacing="1" style="width:100%; border:1px solid #ccc; margin-top:40px" >
                    
                    <tr class="tableheader">
                        <td>Sr. No</td>
                        <td>File ID</td>
                        <td>File Name</td>
                        
                        <td>Server Tag</td>
                        <td>Group Name</td>
                       
                        <td>Type</td>
                        <td style="display:none">Secret Key</td>
                        <td>Uploaded Date</td>
                        
                          
                    </tr>
                    <%
                   // boolean Authorised=false;
                       GlobalFunction GF = new GlobalFunction();
                        Connection con = ConnectionProvider.getConn();
                       
                        int srno = 1;
                        Statement st= con.createStatement();
                        ResultSet rs = st.executeQuery("select * from userfile");
                        while(rs.next()){
                        int Fileid = rs.getInt("id");
                        
                        
                        
                        String fileName = rs.getString("fileName");
                        String uploadedBy = rs.getString("uploadedBy");
                        String uploadDate = rs.getString("uploadDate");
                        String grpid=GF.GroupName(uploadedBy);
                        
                        
                        //String grpid = GF.getGroupName(Integer.parseInt(rs.getString("uploadedBy")));
                        System.out.print("Grp id is "+grpid);
                        
                        
                        //String user = GF.getGroupName(Integer.parseInt(rs.getString("uploadedBy")));
                        String grpname= GF.UserGroupName(grpid);
                      //String grpname = GF.getUserGroupName(Integer.parseInt(user));
                      
                      
                        
                        //System.out.println("user id is "+user);
                        System.out.println("grp name id is "+grpname);
                       
                        String type = rs.getString("type");
                        String UserSecretKey = rs.getString("UserSecretKey");
                        //if(!UserSecretKey.equalsIgnoreCase("0")){
                            %>
                        
                    
                    <tr class="tablerow">
                        <td><%= srno++ %></td>
                        <td><%= Fileid %></td>
                        <td><%= fileName %></td>
                        
                        <td><%= rs.getString("serverDigestKey") %></td>
                        <td><%= grpname %></td>
                         <td>.<%= type %></td>
                         <td style="display:none"><%= rs.getString("secKey") %></td>
                        <td><%= uploadDate %></td>
                        
                       
                         
                    </tr>
                    <%
                    }
                       // }
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