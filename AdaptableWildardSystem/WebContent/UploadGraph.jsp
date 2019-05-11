<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.ArrayList"%>
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
 <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
          <script type="text/javascript" src="js/highcharts.js"></script>

  <%         
 Connection con = ConnectionProvider.getConn();
             ArrayList arr1=new ArrayList();
             ArrayList arr2=new ArrayList();
             
             ArrayList arr111=new ArrayList();
             ArrayList arr222=new ArrayList();
              ArrayList arr3=new ArrayList();
   // HashMap<String,String> n=new  HashMap<String, String>();
         Statement st;
         ResultSet rs;
         //String user_id = (String) session.getAttribute("username");
         //int fileid = Integer.parseInt(request.getParameter("fileid"));
         String sql="SELECT * FROM uploadgraph";
         st=con.createStatement();
         rs=st.executeQuery(sql);
         while(rs.next())
         {       
             arr1.add(rs.getString("fileid"));
             arr2.add(rs.getString("EncryptTime"));
             
             arr111.add(rs.getString("fileid"));
             arr222.add(rs.getString("uploadTime"));
            }
         
        String  arr11=arr1.toString().replace("[", "").replace("]", "").replace(", ", ",");
         String  arr22=arr2.toString().replace("[", "").replace("]", "").replace(", ", ",");
         
         String  arr1111=arr111.toString().replace("[", "").replace("]", "").replace(", ", ",");
         String  arr2222=arr222.toString().replace("[", "").replace("]", "").replace(", ", ",");
             
                 
    %>  
<script>
$(function () {
    $('#container').highcharts({
        title: {
            text: '-: File Encryption Time :-',
            x: -20 //center
        },
        subtitle: {
            text: '',
            x: -20
        },
        xAxis: {
            categories: [<%= arr11 %>]
        },
        yAxis: {
            title: {
                text: 'Time (ms)'
            },
            plotLines: [{
                value: 0,
                width: 0.5,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '°ms'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Time(ms)',
            data: [<%=arr22%>]
        }]
    });
});

</script>

<script>
$(function () {
    $('#container1').highcharts({
        title: {
            text: '-: File Upload Time :-',
            x: -20 //center
        },
        subtitle: {
            text: '',
            x: -20
        },
        xAxis: {
            categories: [<%= arr1111 %>]
        },
        yAxis: {
            title: {
                text: 'Time (ms)'
            },
            plotLines: [{
                value: 0,
                width: 0.5,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '°ms'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Time(ms)',
            data: [<%=arr2222%>]
        }]
    });
});

</script>
     

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
      
      
       <div class="article"> 
                         <div id="container" style="min-width: 630px; height: 400px; max-width: 900px; margin: 0 auto"></div>
                    </div>
                    <div class="article"> 
                         <div id="container1" style="min-width: 630px; height: 400px; max-width: 900px; margin: 0 auto"></div>
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