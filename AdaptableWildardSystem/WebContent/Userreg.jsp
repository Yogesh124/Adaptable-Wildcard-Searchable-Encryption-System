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
    function AllowAlphabet() {
        if (!ureg.fname.value.match(/^[a-zA-Z]+$/)
                && ureg.fname.value != "") {
        	ureg.fname.value = "";
        	ureg.fname.focus();
            alert("Please Enter only alphabet in text");
        }
        
        if (!ureg.lname.value.match(/^[a-zA-Z]+$/) 
        		&& ureg.lname.value != "") {
        	ureg.lname.value = "";
        	ureg.lname.focus();
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
    
    function validEmail1() {
    	var mail=document.ulogin.username.value;
    	if(mail== ""){
    		document.ulogin.username.focus();
    		document.ulogin.username="";
    		alert("Enter Email id");
            
            return false;
        }
        if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail))  
        {  
        }else{
        	document.ulogin.username="";
        	document.ulogin.username.focus();
        	alert("Enter Valid Email id");
        	 
           return false;
    	}
    }

    function validEmail(){
    	var mail=document.ureg.email.value;
    	if(mail== ""){
    		document.ureg.email.focus();
    		document.ureg.email="";
    		alert("Enter  Email id");
            
            return false;
        }
        if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail))  
        {  
        }else{
        	document.ureg.email.focus();
        	document.ureg.email="";
        	alert("Enter Valid Email id");
        	 
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
if(request.getParameter("expired")!=null){
	   out.println("<script>alert('Your membership is expired...'); document.ulogin.email.focus();</script>"); 
	}
if(request.getParameter("Activation")!=null){
	   out.println("<script>alert('Account activation in process !!. please contact to group admin.'); document.ulogin.email.focus();</script>"); 
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
      
       <!-- <div style="width:50%; float:left">
	       <form action="UserLogin" name="ulogin" method="post"> 
	        <table cellpadding="5" cellspacing="5" border="0" width="100%">
				<tr>
					<td colspan="3" class="ttlbgcolor"><div style="margin:5px">User Login !</div></td>
				</tr>
				<tr>
					
					<td><strong>Email</strong></td>
					<td><strong>:</strong></td>
					<td>
					<input type="text" name="username" id="username" onblur="return validEmail1()" required="required"/>
					<input type="hidden" name="Usertype" id="Usertype" value="User"/>
					</td>
				</tr>
				<tr>
					<td><strong>Password</strong></td>
					<td><strong>:</strong></td>
					<td><input type="password" name="password" id="password" required="required"/></td>
				</tr>
				<tr>
					<td colspan="3" align="center"><div style="margin-right:20px">&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="Login" name="submit" /></div></td>
				</tr>
			</table>
			</form>
        
        </div> -->
       <div style="width:50%; float:left">
       <form action="Registration" name="ureg" method="post" onsubmit="return validation()"> 
	        <table cellpadding="5" cellspacing="5" border="0" width="100%">
				<tr>
					<td colspan="3" class="ttlbgcolor"><div style="margin:5px">New User Registration !</div> </td>
				</tr>
				<tr>
					
					<td><strong>Group</strong></td>
					<td><strong>:</strong></td>
					<td><select name="GroupName" id="GroupName">
					<option name="0" value="0">-- Select --</option>
					<%
					Connection con = ConnectionProvider.getConn();
                     	Statement st1= con.createStatement();
                     	GlobalFunction GF = new GlobalFunction();
                        ResultSet rs1 = st1.executeQuery("select * from groupuser");
                        while(rs1.next()){
                        	
                        	int NumberOfUserUnGroup = Integer.parseInt(GF.getNumberOfUserInGroup(rs1.getString("id")));
                        	if(NumberOfUserUnGroup<10 && NumberOfUserUnGroup>=0){
                        	%>
                        	<option name="<%= rs1.getString("groupname") %>" value="<%= rs1.getString("id") %>"><%= rs1.getString("groupname") %></option>
                        	
                        	<%
                        	}
                        }

                     	%>
					
					</select></td>
				</tr>
				<tr>
					
					<td><strong>First Name</strong></td>
					<td><strong>:</strong></td>
					<td>
					<input type="text" name="fname" id="fname" onkeyup="AllowAlphabet()" required="required"/>
					<input type="hidden" name="Usertype" id="Usertype" value="User" />
					</td>
				</tr>
				<tr>
					
					<td><strong>Last Name</strong></td>
					<td><strong>:</strong></td>
					<td><input type="text" name="lname" id="lname" onkeyup="AllowAlphabet()" required="required"/></td>
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
					<td><input type="text" name="contactNo" id="contactNo" onchange="return Validate()" required="required"/></td>
				</tr>
				<tr>
					
					<td><strong>Email</strong></td>
					<td><strong>:</strong></td>
					<td><input type="text" name="email" id="email" onchange="return validEmail()" required="required"/></td>
				</tr>
				
				<tr>
					<td><strong>Password</strong></td>
					<td><strong>:</strong></td>
					<td><input type="password" name="passwords" id="passwords" onchange="return validuaernameandpass()" required="required"/></td>
				</tr>
				<tr>					
					<td><strong>Duration</strong></td>
					<td><strong>:</strong></td>
					<td><select name="userduration" id="userduration">
					<option value="0">-- Select --</option>
					<option value="15">15 Days</option>
					<option value="30">30 Days</option>
					</select></td>
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