<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.oreilly.servlet.MultipartRequest" %>
    <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload</title>
</head> 
<body>
<%  
final int newsize = 1024 * 1024 * 100;
MultipartRequest m = new MultipartRequest(request,"C:\\apache-tomcat-7.0.82\\wtpwebapps\\project\\data",newsize);   
%>

<jsp:forward page="addproduct.jsp"></jsp:forward>
</body>
</html>