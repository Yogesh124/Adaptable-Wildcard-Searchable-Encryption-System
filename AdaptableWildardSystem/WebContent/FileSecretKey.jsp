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
    function AcceptKeyRequest(Fileid,Userid,RequestFrom){
        
    	
        $('#loading').html('<img src="images/loading_spinner.gif" style="width:100px; height:100px">').css("display","block");
        $.ajax({
            url:'AcceptKeyRequest',
            type:'POST',
            datatype:'json',
            data:{"Fileid":Fileid,"Userid":Userid,"RequestFrom":RequestFrom},
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
      
      <h2>Requested Secret Key Of File</h2>
      
       <table border="0" cellpadding="10" cellspacing="1" style="width:100%; border:1px solid #ccc; margin-top:40px" >
                    
                    <tr class="tableheader">
                        <td>Sr. No</td>
                        <td>File ID</td>
                        <td>File Name</td>
                       <td>File Secret Key</td>
                        <td>DateOwner Key</td>
                        <td>Public Key</td>
                        <td style="display:none">Secret Key</td>
                       
                        <td style="display:none">Action</td>
                        
                          
                    </tr>
                    <%
                   // boolean Authorised=false;
                    int UserID = Integer.parseInt((String)session.getAttribute("userId"));
                       GlobalFunction GF = new GlobalFunction();
                        Connection con = ConnectionProvider.getConn();
                       // int Userid = Integer.parseInt((String)session.getAttribute("userId"));
                        int srno = 1;
                        Statement st= con.createStatement();
                        ResultSet rs = st.executeQuery("select * from filerequest where fromUser="+UserID+" GROUP BY fromUser,fileID ");
                        
                        //System.out.println("select * from filerequest where fromUser="+UserID+" GROUP BY fromUser,fileID ");
                        
                        while(rs.next()){
                        int id = rs.getInt("id");
                        int UserTo = rs.getInt("Userto");
                        int fileID = rs.getInt("fileID");
                        String SKey = "********";
                        
                        String DataOwnerKey = GF.getDataOwnerKey(fileID);
                        String CloudPublicKey = GF.getPublicKey(fileID);
                        //int UserID
                        
                   
                        	
                        
                        String fileName = GF.getFileName(fileID);
                            %>
                        
                    
                    <tr class="tablerow">
                        <td><%= srno++ %></td>
                        <td><%= fileID %></td>
                        <td><%= fileName %></td>
                        
                       
                        <td>
						<%
                       //String DevidedKey[] = new String[8] ;
                        Statement sta= con.createStatement();
                        
						Statement stq= con.createStatement();
                       
						 ArrayList<String> secK=new ArrayList<String>(); //creating arraylist  
                        ResultSet rsq = stq.executeQuery("select * from filerequest where fileID="+fileID+" and fromUser="+UserID);
                        while(rsq.next()){
                        	String UserFileSecKey = rsq.getString("Status");
                        	out.println(UserFileSecKey);
                          
                        }
                  %>
						</td>
                         <td><%= DataOwnerKey %></td>
                         <td><%= CloudPublicKey %></td>
                       
                       
                        
                         
                    </tr>
                    <%
                        
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