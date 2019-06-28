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
<body background="fuck.jpg">
<form action="newuser.jsp" method="post">
<table border="2" frame="box" rules="none" align="center">
<tr>
<th colspan="2"><h1><center>REGISTRATION FORM</center></h1></th>
</tr>
<tr>
<td><center><h4>First Name:</h4></center></td>
<td><input type="text" name="firstname" value="name" size="15" maxlength="50"></td></tr>
<tr>
<td><center><h4>Last Name:</h4></center></td>
<td><input type="text" name="lastname" value="name" size="15" maxlength="50"></td>
</tr>
<tr>
<td><center><h4>Address:</h4></center></td>
<td><textarea rows="3" cols="25" name="useraddress">address</textarea></td>
<br>
</tr>
<tr>
<td><center><h4>Gender:</h4></center></td>
       <td><input type="radio" name="gender" value="m">male
       <input type="radio" name="gender" value="f">female
       <input type="radio" name="gender" value="o">other</td>
<br>
</tr>
<tr>
<td><center><h4>Phone no.</h4></center></td>
<td><input type="number" name="phoneno" value="name" size="15" maxlength="50"></td>
</tr>
<tr>
<tr>
<td><center><h4>Email ID</h4></center></td>
<td><input type="text" name="emailid" value="name" size="50" maxlength="50"></td>

</tr>
<tr>
<td><center><h4>Create password</h4></center></td>
<td><input type="password" name="createpassword" value="name" size="15" maxlength="50"></td>
</tr>
<tr>
<td><center><h4>Confirm Password</h4></center></td>
<td><input type="password" name="confirmpassword" value="name" size="15" maxlength="50"></td>
</tr>
<tr>
<td>
<a href="login.jsp">back to login</a>
</td>
<td>
<center><input type="submit" name="submit" value="submit">
</td>
</tr>
</table>
</body>
</html>
<%
if(request.getParameter("submit")!=null)
{
String firstname,lastname,useraddress,gender, phoneno,emailid,createpassword ,confirmpassword;
firstname= request.getParameter("firstname").toString();
lastname= request.getParameter("lastname").toString();
useraddress= request.getParameter("useraddress").toString();
gender= request.getParameter("gender").toString();
phoneno= request.getParameter("phoneno").toString();
emailid= request.getParameter("emailid").toString();
createpassword= request.getParameter("createpassword").toString();
confirmpassword= request.getParameter("confirmpassword").toString();
String USER = "root";
String PASS = "";


     Connection conn = null;
     Statement stmt = null;

try{
     Class.forName("com.mysql.jdbc.Driver");
     conn = DriverManager.getConnection("jdbc:mysql://localhost/maindb",USER,PASS);
     stmt=conn.createStatement();
     int i=stmt.executeUpdate("insert into info values('"+firstname+"','"+lastname+"','"+useraddress+"','"+gender+"','"+emailid+"','"+createpassword+"','"+phoneno+"','"+confirmpassword+"')");
     if(i>0)
      {
       out.println("You are sucessfully registered");
      }
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
finally{
     try{
         if(stmt!=null)
         stmt.close();
        }
        catch(SQLException se2){
        }
     try{
         if(conn!=null)
         conn.close();
        }
        catch(SQLException se)
         {
          se.printStackTrace();
         }
       }
}	         
%>
	