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


    
    function UserActivation(UserID) {

        //alert(Fileid);
    	 $('#loading').html('<img src="images/loading_spinner.gif" style="width:100px; height:100px">').css("display","block");
         $.ajax({
             url:'UserActivation',
             type:'POST',
             datatype:'json',
             data:{"UserID":UserID},
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
      
       <h2>User Activation</h2>
       
       
        <table border="0" cellpadding="10" cellspacing="1" style="width:100%; border:1px solid #ccc; margin-top:40px" >
                    
                    <tr class="tableheader">
                        <td>Sr. No</td>
                        <td>Name</td>
                                           
                        <td>Email</td>                       
                        <td>Contact Number</td>                       
                        <td>Reg. Date</td>
                        <td>Expire Date</td> 
                         <td>Action</td>                           
                         
                          
                    </tr>
                    <%
                   // boolean Authorised=false;
                    int UserId = Integer.parseInt((String)session.getAttribute("userId"));
                    
                       GlobalFunction GF = new GlobalFunction();
                        Connection con = ConnectionProvider.getConn();
                       
                        int srno = 1;
                        Statement st= con.createStatement();
                        ResultSet rs = st.executeQuery("select * from user where  GroupID='"+UserId+"' and Status=0");
                        while(rs.next()){
                       // int Fileid = rs.getInt("id");
                        
                        
                        
                       
                       // String user = GF.getFullName(Integer.parseInt(rs.getString("uploadedBy")));
                       
                        
                       // if(!UserSecretKey.equalsIgnoreCase("0")){
                            %>
                        
                    
                    <tr class="tablerow">
                        <td><%= srno++ %></td>
                        <td><%= rs.getString("fname")+" "+rs.getString("lname") %></td>
                       
                        
                        <td><%= rs.getString("email") %></td>
                         <td><%= rs.getString("contactNo") %></td>
                         
                        <td><%= rs.getString("regDate") %></td>
                        <td><%= rs.getString("expire_date") %></td>
                         <td><% 
                         String Au = rs.getString("AuthorisedGroup");
                         if(Au.equalsIgnoreCase("0")){
                        	 %>
                        	 <a onclick="UserActivation(<%= rs.getString("id") %>)" style="color:maroon;">Activate</a></td>
                        	 <%
                        	 
                         }else{
                        	 out.println("<span style='color:green'>Active</span>");
                         }
                         
                          %></td>
                       
                         
                    </tr>
                    <%}
                       //}
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