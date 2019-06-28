<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<body background="img_h.jpg" link="#FFFFFF" vlink="#FFFFFF">

<a href="addproduct.jsp" target="_blank" ><h3>Add your product<h3></h3></a>
<br>
<br>
<br>
<br>
<a href="deleteproduct.jsp" target="_blank"><h3>Delete your product<h3></h3></a>
<%
String username= session.getAttribute("productowner").toString(); 
if("iamadmin".equals(username)) 
   {
   %> <form action="main1.jsp" method="post">
   <br>
   <br>
    product detail:<input type="text" name="product_detail">
    <br>
    <br>
      <input type="submit" name="submit" value=" DECLARE RESULTS! ">
  <% }
 if(request.getParameter("submit")!=null){

	String productdetail;
    productdetail= request.getParameter("product_detail").toString();

  
    String USER = "root";
    String PASS = "";
 
    Connection conn = null;
    Statement stmt = null;

   try{
       Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection("jdbc:mysql://localhost/maindb",USER,PASS);
       stmt=conn.createStatement();
       ResultSet rs=stmt.executeQuery("select max(amount),Email from bid where Product_detail='"+productdetail+"'");
       while (rs.next())
    {  
    out.println(rs.getString(1));
    out.println(rs.getString(2));
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
 	 </form>
 	 </body>
 	 </html>
