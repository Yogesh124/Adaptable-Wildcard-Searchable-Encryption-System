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
<script>
    function AcceptKeyRequest(ReqTID,Userid,RequestFrom){
        
    	
        $('#loading').html('<img src="images/loading_spinner.gif" style="width:100px; height:100px">').css("display","block");
        $.ajax({
            url:'AcceptKeyRequest',
            type:'POST',
            datatype:'json',
            data:{"ReqTID":ReqTID,"Userid":Userid,"RequestFrom":RequestFrom},
            success:function(data){
                $('#loading').css("display","none");
                alert("Request Successfully sent.");
                
            }
            
            
            
            
        });
        
    }
    
    
    
</script>
</head>

<body>
<%

if(request.getParameter("failCloud")!=null){
	   out.println("<script>alert('Incorrect cloud key!');</script>"); 
	}
if(request.getParameter("failDataOwner")!=null){
	   out.println("<script>alert('Incorrect DataOwner key!');</script>"); 
	}
if(request.getParameter("failFileKey")!=null){
	   out.println("<script>alert('Incorrect File Secret key!');</script>"); 
	}
if(request.getParameter("updated")!=null){
	   out.println("<script>alert('File Successfully Updated...');</script>"); 
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
        <h2>View All Request</h2>
        
        
         <table border="0" cellpadding="10" cellspacing="1" style="width:100%; border:1px solid #ccc; margin-top:40px" >
                    
                    <tr class="tableheader">
                        <td>Sr. No</td>
                        <td>File ID</td>
                        <td>File Name</td>
                        
                        <td>Request From</td>
                      
                        
                        <td style="display:none">Secret Key</td>
                       
                        <td style="display:none">Action</td>
                         <td>Request</td>
                          
                    </tr>
                    <%
                   // boolean Authorised=false;
                    int UserID = Integer.parseInt((String)session.getAttribute("userId"));
                       GlobalFunction GF = new GlobalFunction();
                        Connection con = ConnectionProvider.getConn();
                       // int Userid = Integer.parseInt((String)session.getAttribute("userId"));
                        int srno = 1;
                        Statement st= con.createStatement();
                        ResultSet rs = st.executeQuery("select * from filerequest where Userto="+UserID);
                        while(rs.next()){
                        int Fileid = rs.getInt("fileID");
                       
                        String fileName = GF.getFileName(Fileid);
                       
                        
                        
                        
                        int  Authorised = GF.checkAuthorised(Fileid,UserID);
                        //String AGroupID = GF.getUserGroupID(UserID);
                        Boolean cos = GF.checkFileRequest(Fileid, UserID);
						System.out.println("--"+cos);
                        int RequestFromID = GF.getRequestFromUserID(UserID, Fileid);
                        String user = GF.getFullName(RequestFromID);
						String DevidedKey = GF.getSharedKey(UserID, Fileid);
                        
                        
                     // out.println("------"+Authorised);
                        String strss = Integer.valueOf(Authorised).toString();
                        String strss1 = Integer.valueOf(UserID).toString();
                       
                        	if(cos==true){	
                        
                        
                            %>
                        
                    
                    <tr class="tablerow">
                        <td><%= srno++ %></td>
                        <td><%= Fileid %></td>
                        <td><%= fileName %></td>
                        
                        <td><%= user %></td>
                        
                        
                       
                        
                        <td style="display:none">
                        <a  id="beforevalid<%= Fileid %>" href="#" onclick="ValidateQuetion('<%= Fileid %>');" style="color:maroon;">Download</a>
                        <a  style="display:none" href="CloudPermission.jsp?Fileid=<%= Fileid %>" style="color:maroon;">View File</a></td>
                        <td>
                        <%
                        String St = rs.getString("Status");
                        if(St.equalsIgnoreCase("*")){
                        %>
                        <a style="color:blue" onclick="AcceptKeyRequest(<%= rs.getInt("id") %>,<%= UserID %>,<%= RequestFromID %>)">Accept</a>
                        <%
                        }else{
                        	out.println("Done.");
                        }
                        %>
                        
                        </td>
                         
                    </tr>
                    <%
                        }
                        }
                    
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