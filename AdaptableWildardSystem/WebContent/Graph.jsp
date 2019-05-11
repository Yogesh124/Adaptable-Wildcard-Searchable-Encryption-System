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
<script src="js/Chart.js"></script>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
</head>
<body>
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
         <%
                   
 Connection con = ConnectionProvider.getConn();
             ArrayList arr1=new ArrayList();
             ArrayList arr2=new ArrayList();
             
             ArrayList arr111=new ArrayList();
             ArrayList arr222=new ArrayList();
              ArrayList arr3=new ArrayList();
              
              
         Statement st;
         ResultSet rs;
         /* String user_id = (String) session.getAttribute("username"); */
         String user_id = (String)session.getAttribute("userId");
         String ids=request.getParameter("id");
         int id=Integer.parseInt(ids);
         
         String sql="SELECT * FROM graphtbl where user_id='"+user_id+"'and fileid='"+id+"'";
         st=con.createStatement();
         rs=st.executeQuery(sql);
         int cnt=0;
         while(rs.next())
         {       
             arr1.add(rs.getString("fileid"));
             arr2.add(rs.getString("EncryptTime"));
             System.out.println("Fileid"+arr1);
             System.out.println("EncryptTime"+arr2);
             cnt++;
             System.out.println("cnt : "+cnt);
             arr111.add(rs.getString("fileid"));
             arr222.add(rs.getString("uploadTime"));
             System.out.println("Fileid"+arr111);
             System.out.println("uploadTime"+arr222);      
            }
        
         
        String  arr11=arr1.toString().replace("[", "").replace("]", "").replace(", ", ",");
        String  arr22=arr2.toString().replace("[", "").replace("]", "").replace(", ", ",");
        System.out.println("Fileid"+arr11);
        System.out.println("EncryptTime"+arr22);
        
        String  arr1111=arr111.toString().replace("[", "").replace("]", "").replace(", ", ",");
        String  arr2222=arr222.toString().replace("[", "").replace("]", "").replace(", ", ",");
        System.out.println("Fileid"+arr1111);
        System.out.println("UploadTime"+arr2222);
            
        float aa = Float.parseFloat(arr22)/2;
        
        
        
       
                 
    %>
    
    
    <div style="width:30%; height:30px; float:left"><div style="background-color:#FFB6C1; float:left; width:10px; height:10px"> </div><div style="float:left; margin-left:10px">File id--<%= arr11 %></div></div>
				<%-- <div style="width:30%; height:30px; float:left"><div style="background-color:#E53D57; float:left; width:10px; height:10px"> </div><div style="float:left; margin-left:10px"><%= arr11 %></div></div> --%>
           <%--  <canvas id="canvas" height="500" width="700px"></canvas>
                 <script>

		var barChartData = {
			labels : ["Encryption Time","Upload Time"],
			datasets : [
				
				{
					
					fillColor : "rgba(245,187,229,1.5)",
 					strokeColor : "rgba(151,187,205,1)",
					data : [<%= arr22 %>,<%= arr222%>]
				}
			]
			
		}

	var myLine = new Chart(document.getElementById("canvas").getContext("2d")).Bar(barChartData);
        //var myLine = new Chart(document.getElementById("canvas").getContext("2d")).Line(barChartData);
	
	</script> --%>
	
	<div id="chartContainer" style="height: 400px; width: 700px;"></div>
<script type="text/javascript">
		window.onload = function () {
			var chart = new CanvasJS.Chart("chartContainer", {
				title: {
					text: "Basic Column Chart"
				},
				data: [{
					type: "column",
					dataPoints: [
						{ y: <%=arr22%>, label: "Encryption Time" },
						{ y: <%=Float.toString(aa)%>, label: "Upload Time" },
						
					]
				}]
			});
			chart.render();
		}
	</script>
	<script src="canvasjs.min.js"></script>
      
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