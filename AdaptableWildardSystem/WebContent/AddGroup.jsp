<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%@include file="title.jsp" %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="layout/styles/layout.css" type="text/css" />
<script type="text/javascript" src="layout/scripts/jquery.min.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.slidepanel.setup.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.ui.min.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.tabs.setup.js"></script>
<script language = "Javascript">
                    
    function validation()
    {

       

         if(document.getElementById("fname").value == ""){
         alert("Enter Correct FirstName");
         document.addnewuser.fname.focus();
         return false;
         }
        ///////password 

        if(document.getElementById("lname").value == ""){
         alert("Enter LastName");
         document.addnewuser.lname.focus();
         return false; 

         }
        if(document.getElementById("gender").value == "0"){
            document.addnewuser.gender.focus();
           alert("Please select gender");
           return false; 
        }
         
        
         if(document.getElementById("contactNo").value == ""){
             alert("Enter ContactNumber");
             document.addnewuser.contactNo.focus();
             return false; 

             }
         if(document.getElementById("email").value == ""){
             alert("Enter Email");
             document.addnewuser.email.focus();
             return false; 

             }
         
         if(document.getElementById("password").value == ""){
         alert("Enter Password");
         document.addnewuser.password.focus();
         return false; 

         }
       
         return true;

    }      
</script>
</head>
<body>
<%
if(request.getParameter("success")!=null){
	   out.println("<script>alert('Successfully created...');</script>"); 
	}

if(request.getParameter("Exist")!=null){
   out.println("<script>alert('Griup already exists...'); document.uRegister.email.focus();</script>"); 
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
     <ul>
        <li class="last"><a href="AdminHome.jsp">Home </a></li>        
       
        <li><a href="AddGroup.jsp">Add Group</a></li>
     
        <li class="no_bg ped"><a href="Cloud_login.jsp">Logout</a></li>
        
      </ul>
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
      
      <form action="AddGroup" method="post"> 
	        <table cellpadding="5" cellspacing="5" border="0" width="350" >
				<tr>
					<td colspan="3" class="ttlbgcolor"><div style="margin:5px">Add New Group !</div> </td>
				</tr>
				<tr>
					
					<td><strong>Group Name</strong></td>
					<td><strong>:</strong></td>
					<td><input type="text" name="GroupName" id="GroupName" /></td>
				</tr>
				
				<tr>
				
				<tr>
					<td colspan="3" align="center"><div style="margin-right:20px">&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="Save" name="submit" /></div></td>
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