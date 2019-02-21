<%@page import="java.sql.*;" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update</title>
</head>
<body>
<%
String name=request.getParameter("tname");
String branch=request.getParameter("branch");
String college=request.getParameter("college");
try{
Class.forName("com.mysql.jdbc.Driver");

Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useSSL=false", "root",
		"root");


String query = " update trainee_details set branch=?,college_name=? where trainee_name=?";
PreparedStatement pstmt = conn.prepareStatement(query);

pstmt.setString (1,branch);
pstmt.setString (2,college);
pstmt.setString (3,name);
int status=0;
status=pstmt.executeUpdate();
if(status==0)
	out.println("Error in the insert the record");
else
response.sendRedirect("read.jsp");
conn.close();
}
catch (Exception e) {
	out.println(e);
}
%>
</body>
</html>