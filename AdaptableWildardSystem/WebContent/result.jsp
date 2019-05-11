<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="poll.function"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<%
if(request.getParameter("status")!=null){
   out.println("<script>alert('Vote successfully send !...')</script>"); 
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
      
      
      
      <table cellspacing="3" cellpadding="3" border="0" style="width:70%" align="center">
        <tr>
					<td colspan="3" bgcolor="D7231C"><span style="color: #FFFFFF;font-weight: bold;"><div style="margin:5px">Results !</div> </span></td>
		</tr>
        
        </table>
        <div style="width:65%; border:0px solid #ccc; height:auto; margin-left:auto; margin-right:auto">
	        
	         <%
	         String task_type = "";
        Date today = new Date();
        SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
        String date = DATE_FORMAT.format(today);
        
       
        
        int i=1;
Connection con=ConnectionProvider.getConn();
Statement st =con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM polls");

int total=0;


while(rs.next()){
	int poll_id = rs.getInt("id");
	
	
	function fn= new function();
	int cnt1 = fn.getvotesCount(poll_id,1);
	int cnt2 = fn.getvotesCount(poll_id,2);
	int cnt3 = fn.getvotesCount(poll_id,3);
	int cnt4 = fn.getvotesCount(poll_id,4);
	
	total = cnt1+cnt2+cnt3+cnt4;
	int pec1 = 0;
	int pec2 = 0;
	int pec3 = 0;
	int pec4 = 0;
	if(total!=0){
		
	
	
	pec1 = (cnt1*100)/total;
	pec2 = (cnt2*100)/total;
	pec3 = (cnt3*100)/total;
	pec4 = (cnt4*100)/total;
	}
	
	
	
%>
        <div style="width:100%;  margin:10px; border:1px solid #ccc">
	       <table cellpadding="3" cellspacing="3" border="0" style="width:100%">
	       	<tr>
	       		<td colspan="3"><strong>Question : <%=rs.getString("question") %></strong></td>
	       	</tr>
	       	<tr>
	       		<td colspan="3"><strong>Posted by : </strong> <%=rs.getString("username") %></td>
	       	</tr>
	       	<tr>
	       		<td colspan="3"><strong>Start Date :</strong> <%=rs.getString("startDate") %>&nbsp;&nbsp;|&nbsp;<strong>End Date : </strong><%=rs.getString("endDate") %></td>
	       	</tr>
	       	<tr>
	       		<td>1) <%=rs.getString("opt1") %></td>
	       		<td>&nbsp;</td>
	       		<td><%= cnt1 %> (<%= pec1 %>%)</td>
	       	</tr>
	       	
	       	<tr>
	       		<td>2) <%=rs.getString("opt2") %></td>
	       		<td>&nbsp;</td>
	       		<td><%= cnt2 %> (<%= pec2 %>%)</td>
	       	</tr>
	       	
	       	<tr>
	       		<td>3) <%=rs.getString("opt3") %></td>
	       		<td>&nbsp;</td>
	       		<td><%= cnt3 %> (<%= pec3 %>%)</td>
	       	</tr>
	       	
	       	<tr>
	       		<td>4) <%=rs.getString("opt4") %></td>
	       		<td>&nbsp;</td>
	       		<td><%= cnt4 %> (<%= pec4 %>%)</td>
	       	</tr>
	       	<tr>
	       	
	       		<td colspan="3">&nbsp;</td>
	       		
	       	</tr>
	       	<tr>
	       		<td>Total Summery</td>
	       		<td>&nbsp;</td>
	       		<td><%= total %></td>
	       	</tr>
	       
	       </table>
	</div>
        <% 	}%>
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