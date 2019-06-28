<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>www.auction.com</title>
</head>
<body background="bid.jpg">
<form action="bid.jsp" method="post">
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<table border="2" align="right" frame="box" rules="none" cellspacing="12" cellpadding="12">
<tr>
<td>
<center>Enter your amount:</center></td>
<td><input type="text" name="amount" value="name" size="15" maxlength="50"></td>
<tr>
<td><center>Enter your emailid:</center></td>
<td>
<center><input type="text" name="email" value="name" size="15" maxlength="50"></center></td>
</tr>
<tr>
<td colspan="4" rowspan="2">
<center><input type="submit" name="name" value="        BID        " size="15" maxlength="50"></center>
</td>
</tr>
<br>
<% 
if(request.getParameter("name")!=null){

	String email,productdetail,amount;
    amount= request.getParameter("amount").toString();
    email= request.getParameter("email").toString();
    productdetail= session.getAttribute("productbid").toString();

    String USER = "root";
    String PASS = "";
 
    Connection conn = null;
    Statement stmt = null;

   try{
       Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection("jdbc:mysql://localhost/maindb",USER,PASS);
       stmt=conn.createStatement();
       int i=stmt.executeUpdate("insert into bid values('"+email+"','"+productdetail+"','"+amount+"')");
       if(i>0)
       {
        out.println("You are registered for bidding");
       } 
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



</form>
</body>
</html>