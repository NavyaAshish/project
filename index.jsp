<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ page language= "java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<head>
<title>www.auction.com</title>
</head>
<body background="Magazines-24 (11).JPG">
<% 
if(request.getParameter("submit")!=null){

	String username,pass;
    username= request.getParameter("username").toString();
    session.setAttribute( "productowner", username);
    pass= request.getParameter("pass").toString();
  
    String USER = "root";
    String PASS = "";
 
    Connection conn = null;
    Statement stmt = null;

   try{
       Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection("jdbc:mysql://localhost/maindb",USER,PASS);
       stmt=conn.createStatement();
       ResultSet rs=stmt.executeQuery("select * from info where Email ='"+username+"' and Pass='"+pass+"'");
       boolean status=false;
       status=rs.next();
       
      if(status) 
      {
    	    %>
	         <jsp:forward page="frameset.jsp" /> 
           <% 
      } 
      else  
      { %> <h2><font color="white" align="right">  USERNAME or PASSWORD you entered is wrong</font></h2>
	   <%--    <jsp:forward page="login.jsp" /> --%>
	  
	  <% 
	  } 
	  rs.close();  
      stmt.close();
      conn.close();
      }catch(SQLException se)
         {se.printStackTrace();
      }catch(Exception e)
         {e.printStackTrace();
      }
     finally{
       try{
           if(stmt!=null)
            stmt.close();
          }catch(SQLException se2){
  }
  
       try{
           if(conn!=null)
           conn.close();
          }catch(SQLException se){
            se.printStackTrace();}
          }
 }	         
 	        

       %>

   
<form action="index.jsp" method="POST">
<table border="1" frame="box" rules="none" align="right" width="40%" height="500%">
<tr><td><h2><font color="white" align="right">   USERNAME:</h2></td>
<td><center><input type="text" name="username" value="" size="15" maxlength="50"></center>
</td>
</tr>
<tr>
<td><h2><font color="white" align="right"> PASSWORD</h2></td>
<td><center><input type="password" name="pass"></center></td>
</tr>
<br><tr><td colspan="2">
<center><input type="submit" name="submit" value="        login       "></td></center>
</tr>
<tr>
<td colspan="2"><a href="newuser.jsp"  target="_blank"><font color="white" align="right">New user?</a></td>
<td colspan="2"><a href="adminlog.jsp"  target="_blank"><font color="white" align="right">Admin?</a></td>
</tr>
</table>
</form>
</body>
</html>
