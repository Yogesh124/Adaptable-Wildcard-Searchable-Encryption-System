<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="poll.RandomString"%>
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
<ul>
        <li class="last"><a href="CloudHome.jsp">Home </a></li>        
       
        <li><a href="CloudFiles.jsp">Files</a></li>
     
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
      <h2>Authorized Users</h2>
      
        <form action="CloudEncryption" method="post">
           <table border="0" cellpadding="10" cellspacing="1" style="width:50%; border:1px solid #ccc; margin-top:40px; margin-left: auto; margin-right: auto" >
                    
                    <tr class="tableheader">
                        <td colspan="3">Authorized Users</td>
                      
                          
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
                     <tr class="tablerow" style="display:none">
                    	 <td>Secret Key</td><td>:</td> <td><%= rs.getString("secKey") %></td>
                     </tr>
                      <tr class="tablerow">
                     	<td>Uploaded Date</td><td>:</td><td><%= uploadDate %></td>
                     </tr>
                     <tr class="tablerow">
                     	<td>Athorised Group</td><td>:</td>
                     	<td><%
                     	
                     	ArrayList<String> wordsList = new ArrayList<String>();
                     	String AuthUser = rs.getString("AuthorisedGroup");
                     	String[] strss = AuthUser.split(",");
                     	for (String word : strss) {
        					wordsList.add(word);
        				}
                     	int UsLen = wordsList.size();
                     	//out.println(wordsList.get(0));
                     	for(int i=0;i<wordsList.size();i++){
                     		
                     		int UID = Integer.parseInt(wordsList.get(i));
                     		
                     		
                     		
                     	GlobalFunction GF = new GlobalFunction();
                     	String GName = GF.getUserGroupName(AuthUser);
                     	 out.println(GName);
                     	Statement st1= con.createStatement();
                        ResultSet rs1 = st1.executeQuery("select * from user where id="+UID);
                        while(rs1.next()){
                        	%>
                        	<%= rs1.getString("fname")+" "+rs1.getString("lname") %>
                        	
                        	<%
                        }
                     	}

                     	%></td>
                     </tr>
                     <tr class="tablerow">
                    	 <td>Access Level</td><td>:</td> <td><%= rs.getString("AccessLevel") %></td>
                     </tr>
                      <tr class="tablerow">
                        <%
                       
           	RandomString RS = new RandomString();
           	String RND = RS.generateRandomString();
           	
           	%>
                     	<td>Cloud key</td><td>:</td><td><input type="text" name="CloudSecretKey" value="<%= RND %>"></input></td>
                     </tr>
                        
                       <tr class="tablerow">
                    <td colspan="3">&nbsp;</td>
                    </tr>
                 
                    <tr class="tableheader">
                    <td colspan="3"><input type="submit" value="Encrypt All Data" name="submit"></input></td>
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