<%@ page import="java.sql.*;" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name=request.getParameter("tname");
String branch=request.getParameter("branch");
String college=request.getParameter("college");
Class.forName("com.mysql.jdbc.Driver");

Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useSSL=false", "root",
		"root");


String query = " insert into trainee_details values ( ?, ?, ?)";
PreparedStatement pstmt = conn.prepareStatement(query);
pstmt.setString (1,name);
pstmt.setString (2,branch);
pstmt.setString (3,college);
int status=0;
status=pstmt.executeUpdate();
if(status==0)
	out.println("Error in the insert the record");
else
response.sendRedirect("read.jsp");
conn.close();


%>
</body>
</html>