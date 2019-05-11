<%
if(session.getAttribute("Usertype")==null){
	
%>
	
	
	<ul>
        <li class="last"><a href="index.jsp">Home </a></li>
        <li><a href="User_login.jsp">User</a></li>
         <li><a href="Cloud_login.jsp">Cloud</a></li>
        <li><a href="Dataowner_login.jsp">Data Owner</a></li>
       
        
      </ul>
	
	<% 
	
}else{
	
	%>
	
	
	<ul>
        <li class="last"><a href="DataOwnerHome.jsp">Home </a></li>        
        <li><a href="UploadFile.jsp">Upload</a></li>
        <li><a href="DataOwnerFiles.jsp">Files</a></li>
       <li><a href="DOAccount.jsp">My Account</a></li>
        <li class="no_bg ped"><a href="logoutServlet">Logout</a></li>
        
      </ul>
	
	<% 
	
	
}

%>


