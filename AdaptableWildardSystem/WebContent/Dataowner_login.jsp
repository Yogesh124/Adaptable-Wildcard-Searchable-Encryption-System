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

       

         if(document.getElementById("username").value == ""){
         alert("Enter email");
         document.ulogin.username.focus();
         return false;
         }
        
         if(document.getElementById("password").value == ""){
         alert("Enter Password");
         document.ulogin.password.focus();
         return false; 

         }
       
         return true;

    } 
    function Regvalidation()
    {

       

         if(document.getElementById("fname").value == ""){
         alert("Enter Correct FirstName");
         document.uRegi.fname.focus();
         return false;
         }
        ///////password 

        if(document.getElementById("lname").value == ""){
         alert("Enter LastName");
         document.uRegi.lname.focus();
         return false; 

         }
        if(document.getElementById("gender").value == "0"){
            document.uRegi.gender.focus();
           alert("Please select gender");
           return false; 
        }
         
        
         if(document.getElementById("contactNo").value == ""){
             alert("Enter ContactNumber");
             document.uRegi.contactNo.focus();
             return false; 

             }
         if(document.getElementById("email").value == ""){
             alert("Enter Email");
             document.uRegi.email.focus();
             return false; 

             }
         
         if(document.getElementById("passwords").value == ""){
         alert("Enter Password");
         document.uRegi.passwords.focus();
         return false; 

         }
       
         return true;

    }
</script>
<body>
<%
if(request.getParameter("logout")!=null){
	   out.println("<script>alert('Successfully logout...');</script>"); 
	}

if(request.getParameter("success")!=null){
	   out.println("<script>alert('Successfully registered...');</script>"); 
	}

if(request.getParameter("user")!=null){
   out.println("<script>alert('Incorrect login details...'); document.ulogin.email.focus();</script>"); 
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
      
      
      <div style="width:50%; float:left">
	       <form action="UserLogin" name="ulogin" method="post" onsubmit="return validation()"> 
	        <table cellpadding="5" cellspacing="5" border="0" width="100%">
				<tr>
					<td colspan="3" class="ttlbgcolor"><div style="margin:5px">TPA Login !</div></td>
				</tr>
				<tr>
					
					<td><strong>Email</strong></td>
					<td><strong>:</strong></td>
					<td>
					<input type="text" name="username" id="username" />
					<input type="hidden" name="Usertype" id="Usertype" value="TPA" />
					</td>
				</tr>
				<tr>
					<td><strong>Password</strong></td>
					<td><strong>:</strong></td>
					<td><input type="password" name="password" id="password"/></td>
				</tr>
				<tr>
					<td colspan="3" align="center"><div style="margin-right:20px">&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="Login" name="submit" /></div></td>
				</tr>
			</table>
			</form>
        
        </div>
       <div style="width:50%; float:left; display:none">
       <form action="Registration" name="uRegi" method="post" onsubmit="return Regvalidation()"> 
	        <table cellpadding="5" cellspacing="5" border="0" width="100%">
				<tr>
					<td colspan="3" class="ttlbgcolor"><div style="margin:5px">New Data Owner Registration !</div> </td>
				</tr>
				<tr>
					
					<td><strong>First Name</strong></td>
					<td><strong>:</strong></td>
					<td>
					<input type="text" name="fname" id="fname" />
					<input type="hidden" name="Usertype" id="Usertype" value="DataOwner" />
					
					
					</td>
				</tr>
				<tr>
					
					<td><strong>Last Name</strong></td>
					<td><strong>:</strong></td>
					<td><input type="text" name="lname" id="lname"/></td>
				</tr>
				<tr>
					
					<td><strong>Gender</strong></td>
					<td><strong>:</strong></td>
					<td><select name="gender" id="gender">
					<option name="0" value="0">-- Select --</option>
					<option name="male" value="Male">Male</option>
					<option name="female" value="FeMale">FeMale</option>
					</select></td>
				</tr>
				<tr>
					
					<td><strong>Contact No.</strong></td>
					<td><strong>:</strong></td>
					<td><input type="text" name="contactNo" id="contactNo" /></td>
				</tr>
				<tr>
					
					<td><strong>Email</strong></td>
					<td><strong>:</strong></td>
					<td><input type="text" name="email" id="email" /></td>
				</tr>
				
				<tr>
					<td><strong>Password</strong></td>
					<td><strong>:</strong></td>
					<td><input type="password" name="passwords" id="passwords"/></td>
				</tr>
				<tr>
					<td colspan="3" align="center"><div style="margin-right:20px">&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="Register" name="submit" /></div></td>
				</tr>
			</table>
			</form>
       
       
       </div>
      
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