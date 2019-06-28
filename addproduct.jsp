<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "javax.servlet.http.Part.*,javax.servlet.*" %>
<%@ page import = "javax.servlet.http.HttpServletRequest,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>www.auction.com</title>
</head>
<body background="stock-vector-illustration-of-different-shopping-bag-on-sale-background-115316110.jpg">
<form action="addproduct.jsp" method="post">
<table border="2" frame="box" rules="none" Align="center">
<tr>
<td>
<a href="frameset.jsp" >back to home</a>
</td>
</tr>
<tr>
<center><th colspan="2"><h1>Add Your Product</h1></th> </center>
</tr>
<tr>
<td>
<center><h4>Enter Product Name:</h4></center>
</td>
<td>
<input type="text" name="productname" value="name" size="15" maxlength="50">
</td>
</tr>
<tr>
<td><center><h4>Enter Product Details:</h4></center></td>
<td><input type="text" name="productdetail" value="name" size="15" maxlength="50"></td>
  </tr>
<tr>
<td><center><h4>Minimum bid Amount:</h4></center></td>
<td><input type="number" name="minimumbid" value="name" size="15" maxlength="50" ></td>
</tr>
<tr>
<td><center><h4>Enter Auction Time:</h4></center></td>
       <td><input type="number" name="auctiontime" values="(in hours)" >
     </td>
</tr>
<tr>
<td><center><h4>
Select Category</center></h4>
</td>
<td><center>
<select name="category">
<option value= "clothing">Clothing</option>
<option value= "fashion"> Fashion</option>
<option value= "eletronics"> Electronics</option>
</select> </center>                           
</td></tr>
<tr>
<td><center>
<h4>Upload Image</h4></center>
</td>
<td>
    <input type = "file" name = "image" size = "100" >
         </td></tr>
<tr>
<td colspan=2>
<center><input type="submit" name="submit" value="Add">
</td>
</tr>
</table></center>
</form>
</body>
</html>
<%
if(request.getParameter("submit")!=null)
{
String productname,productdetail,username,minimumbid, auctiontime,category;
productname= request.getParameter("productname").toString();
productdetail= request.getParameter("productdetail").toString();
session.setAttribute( "productbid", productdetail );
minimumbid= request.getParameter("minimumbid").toString();
auctiontime= request.getParameter("auctiontime").toString();
session.setAttribute( "auctime", auctiontime );

category= request.getParameter("category").toString();
username= session.getAttribute("productowner").toString();
Part part = request.getPart("image");
String fileName = extractFileName(part);
String savePath= "C:\\Users\\User\\workspace\\first\\WebContent\\images\\" + File.separator + fileName;
File fileSavedir = new  File(savePath);


part.write(savePath + File.separator);


String USER = "root";
String PASS = "";


Connection conn = null;
Statement stmt = null;

try{
     Class.forName("com.mysql.jdbc.Driver");
     conn = DriverManager.getConnection("jdbc:mysql://localhost/maindb",USER,PASS);
     stmt=conn.createStatement();
     int i=stmt.executeUpdate("insert into add_pro values('"+productname+"','"+productdetail+"','"+minimumbid+"','"+username+"','"+auctiontime+"','"+category+"','"+savePath+"')");
     if(i>0)
      {
       out.println("Your product is added");
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
         catch(SQLException se){
            se.printStackTrace();
           }
}
}
%>
//<%! 

//public String extractFileName (Part part) {  
// String contentDisp = part.getHeader(" content-disposition ") ;
 //   String[] items = contentDisp.split(";");  
  //  for (String s : items) {  
    //    if (s.trim().startsWith("filename")) {  
        //    return s.substring(s.indexOf("=") + 2, s.length()-1);  
      //  }  
    //}  
   // return " ";  
//} %>

  


 