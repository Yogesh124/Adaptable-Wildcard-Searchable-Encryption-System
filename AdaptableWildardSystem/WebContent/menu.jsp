<%
if(session.getAttribute("Usertype")==null){
	
	%>
	<ul>
        <li class="last"><a href="index.jsp">Home </a></li>
        <li><a href="User_login.jsp">User</a></li>
         <li><a href="Cloud_login.jsp">Cloud</a></li>
         <li><a href="group_login.jsp">Group</a></li>
        <li><a href="Dataowner_login.jsp">TPA</a></li>
        <li><a href="Proxy_login.jsp">Proxy</a></li>
      </ul>
	<% 
	
}else if(session.getAttribute("Usertype").toString().equalsIgnoreCase("TPA")){
	
	%>
	<ul>
        <li class="last"><a href="TPAHome.jsp">Home </a></li>        
       
        
        <li><a href="TPAVerification.jsp">Verify Files</a></li>
         
      
        <li class="no_bg ped"><a href="logoutServlet">Logout</a></li>
        
      </ul>
	<%
		}else if(session.getAttribute("Usertype").toString().equalsIgnoreCase("User")){
	%>
	
	
	<ul>
        <li class="last"><a href="Home.jsp">Home </a></li>        
       <li><a href="UploadFile.jsp">Upload</a></li>
       <li><a href="search.jsp">Search</a></li>
        <li><a href="DataOwnerFiles.jsp">Files</a></li>
         <li><a href="UserCloudFiles.jsp">Group Files</a></li>
        <li ><a href="VerifyFiles.jsp">Verify</a></li>
        <li ><a href="UGraph.jsp">Graph</a></li> 
       <li><a href="Account.jsp">My Account</a></li>
       <li><a href="logoutServlet">Logout</a></li>
        <!-- <li><a href="FileSecretKey.jsp" style="display:none">File Secret Key</a></li> -->
        
        
        
        
      </ul>
	
	<% 
	
	

}else if(session.getAttribute("Usertype").toString().equalsIgnoreCase("admin")){
	
	%>
	<ul>
        <li class="last"><a href="AdminHome.jsp">Home </a></li>        
       
        <li><a href="view_user.jsp">View User</a></li>
     
        <li class="no_bg ped"><a href="logoutServlet">Logout</a></li>
        
      </ul>
	<% 
	
}else if(session.getAttribute("Usertype").toString().equalsIgnoreCase("GroupOwner")){
	
	%>
	<ul>
        <li class="last"><a href="GroupAdminHome.jsp">Home </a></li>        
       
        <li><a href="view_user.jsp">View User</a></li>
        <li><a href="UserActivation.jsp">Activation</a></li>
     
        <li class="no_bg ped"><a href="logoutServlet">Logout</a></li>
        
      </ul>
	<% 
	
}

%>


