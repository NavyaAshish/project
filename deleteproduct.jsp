<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
 .tab{
	font-family: Tahoma;
	font-size: 14px;
	color:#BDB76B ;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>www.auction.com</title>
</head>
<body background="auction-gavel-24128526.jpg">
<form action="deleteproduct.jsp" method="post">
<table class="tab" rules="none" Align="left" width="50%" height="200%">
<tr>
<td colspan="2">
<a href="frameset.jsp" >back to home</a>
</td>
</tr>
<tr>
<td rowspan="2"> </th>
<td colspan="2"> </th>

<font size="150" color="white"><center>Delete Your Product</center></font></td>
</tr>
<tr>
<td><h3><center>Enter Product detail:</h3></center></td>
<td><input type="text" name="productdetail" value="name" size="15" maxlength="50"></td></tr>
<tr><br><br>
<br>
<td colspan="4">  <center><input type="submit" name="userid" value="            DELETE           " size="20"></center></td>
</tr>
</table>
</body>
</html>
<% 
if(request.getParameter("userid")!=null)
{
	
String username,productdetail;
productdetail= request.getParameter("productdetail").toString();
username= session.getAttribute("productowner").toString();
String USER = "root";
String PASS = "";
Connection conn = null;
Statement stmt = null;
out.println(username);
try{
   Class.forName("com.mysql.jdbc.Driver");
   conn = DriverManager.getConnection("jdbc:mysql://localhost/maindb",USER,PASS);
   stmt=conn.createStatement();
   
   if("iamadmin".equals(username)) 
   {
    stmt.executeUpdate("delete from add_pro where product_detail='"+productdetail+"'");
    }
    else
    {
	stmt.executeUpdate("delete from add_pro where email='"+username+"' and product_detail='"+productdetail+"'");
    }
   stmt.close();
   conn.close();
   }catch(SQLException se)
    {
      se.printStackTrace();
    }catch(Exception e)
      {
        e.printStackTrace();
      }
 finally{
    try 
      {
         if(stmt!=null)
         stmt.close();
      }
       catch(SQLException se2){
       } 
    try{
        if(conn!=null)
        conn.close();
       }
    catch(SQLException se){
     se.printStackTrace();
     }
     }
 
 }	         
 %>

