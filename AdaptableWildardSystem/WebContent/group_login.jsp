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
<script>


function AllowAlphabet() {
    if (!uRegi.fname.value.match(/^[a-zA-Z]+$/)
            && uRegi.fname.value != "") {
    	uRegi.fname.value = "";
    	uRegi.fname.focus();
        alert("Please Enter only alphabet in text");
    }
    
    if (!uRegi.lname.value.match(/^[a-zA-Z]+$/) 
    		&& uRegi.lname.value != "") {
    	uRegi.lname.value = "";
    	uRegi.lname.focus();
        alert("Please Enter only alphabets in text");
    }

}

function Validate()
{ 
    var y = document.ureg.contactNo.value;
   
   if(isNaN(y)||y.indexOf(" ")!=-1)
   {
	   
	   ureg.contactNo.value="";
	   ureg.contactNo.focus();
      alert("Enter Only Numeric value");
      return false;
   }
    if (y.length!=10)
   {
        alert("Enter 10 Number");
        return false;
   } 
   
   if (!y.match(/^[0-9]+$/) 
   		&& y != "") {
   	y = "";
   	ureg.contactNo.focus();
       alert("Enter only Digits in textbox");
   }

}

function validEmail() {
	var mail=document.ulogin.username.value;
	if(mail== ""){
        alert("Enter Email id");
        document.ulogin.username.focus();
        return false;
    }
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail))  
    {  
    }else{
    	alert("Enter Valid Email id");
    	 document.ulogin.username.focus();
       return false;
	}
}



function validEmail1() {
	var mail=document.uRegi.email.value;
	if(mail== ""){
        alert("Enter Email id");
        document.uRegi.email.focus();
        return false;
    }
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail))  
    {  
    }else{
    	alert("Enter Valid Email id");
    	 document.uRegi.email.focus();
       return false;
	}
}

function validuaernameandpass()
{

    var pass=document.ureg.passwords.value;
    

	 if(pass != "" ) {
         if(pass.length < 6) {
           alert("Password must contain at least 6 characters!");
           document.ureg.password.focus();
           return false;
         }
	}
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
	       <form action="GroupLogin" name="ulogin" method="post"> 
	        <table cellpadding="5" cellspacing="5" border="0" width="100%">
				<tr>
					<td colspan="3" class="ttlbgcolor"><div style="margin:5px">Group Admin Login !</div></td>
				</tr>
				<tr>
					
					<td><strong>Email</strong></td>
					<td><strong>:</strong></td>
					<td>
					<input type="text" name="username" id="username" required="required"/>
					
					</td>
				</tr>
				<tr>
					<td><strong>Password</strong></td>
					<td><strong>:</strong></td>
					<td><input type="password" name="password" id="password" required="required"/></td>
				</tr>
				<tr>
					<td colspan="3" align="center"><div style="margin-right:20px">&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="Login" name="submit" /></div>
					<a href="groupreg.jsp">New Register?</a>
					</td>
				</tr>
			</table>
			</form>
        
        </div>
       <!-- <div style="width:50%; float:left">
       <form action="GroupRegistration" name="uRegi" method="post"> 
	        <table cellpadding="5" cellspacing="5" border="0" width="100%">
				<tr>
					<td colspan="3" class="ttlbgcolor"><div style="margin:5px">New Group Registration !</div> </td>
				</tr>
				
				<tr>
					
					<td><strong>First Name</strong></td>
					<td><strong>:</strong></td>
					<td>
					<input type="text" name="fname" id="fname" onblur="AllowAlphabet()" required="required"/>
					<input type="hidden" name="Usertype" id="Usertype"  value="GroupOwner" />
					</td>
				</tr>
				<tr>
					
					<td><strong>Last Name</strong></td>
					<td><strong>:</strong></td>
					<td><input type="text" name="lname" id="lname" onblur="AllowAlphabet()" required="required"/></td>
				</tr>
				
				
				<tr>
					
					<td><strong>Email</strong></td>
					<td><strong>:</strong></td>
					<td><input type="text" name="email" id="email" onblur="return validEmail1()" required="required"/></td>
				</tr>
				
				<tr>
					<td><strong>Password</strong></td>
					<td><strong>:</strong></td>
					<td><input type="password" name="passwords" id="passwords"  onblur="return validuaernameandpass()" required="required"/></td>
				</tr>
				<tr>
				<tr>
					<td><strong>Group Name</strong></td>
					<td><strong>:</strong></td>
					<td><input type="text" name="groupname" id="passwords" required="required"/></td>
				</tr>
					<td colspan="3" align="center"><div style="margin-right:20px">&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="Register" name="submit" /></div></td>
				</tr>
			</table>
			</form>
       
       
       </div> -->
	       
      
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