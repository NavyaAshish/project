<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
div.gallery {
    margin: 5px;
    border: 1px solid #ccc;
    float: right;
    width: 180px;
}
div.gallery:hover {
    border: 1px solid #777;
}

div.gallery img {
    width: 100%;
    height: auto;
}
div.desc {
    padding: 15px;
    text-align: center;
}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>www.auction.com</title>
</head>
<body background="auc1.jpg" style="background-repeat:no-repeat;">

<form target="right">
<%
String USER = "root";
String PASS = "";


     Connection conn = null;
     Statement stmt = null;

try{
   
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost/maindb",USER,PASS);
    stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery("Select Upload_image,Product_name from add_pro;");
    while (rs.next())
    {  String s=rs.getString(1);
    %>
    <div class="gallery">
    <a target="_blank" href="bid.jsp">
    <img src="<%=s %>" width="200" height="200">
  </a>
  <% String m=rs.getString(2); 
     session.setAttribute( "productbid",s);%>
  <div class="desc"><%=m%></div>
  </div>
	 <%
	  }
	   rs.close();
       stmt.close();
       conn.close();
   }catch(SQLException se)
      {
        se.printStackTrace();
      }
    catch(Exception e)
      {
        e.printStackTrace();
      } 

    finally
        {
          try
              {
                if(stmt!=null)
                stmt.close();
              }
          catch(SQLException se2)
           { }
 
          try
              {
                if(conn!=null)
                conn.close();
               }
          catch(SQLException se)
          {
             se.printStackTrace();
          }
       }


	         
%>
</form>
</div>
</div>
</body>
</html>
	