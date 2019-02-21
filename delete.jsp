<%@page import="java.sql.*;" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Page</title>
</head>
<body>

<%String t=request.getParameter("tname");
out.println("<h1>"+t+"</h1>");
try {
	int count=1;
	//String tname=request.getParameter("uname");
	String tname="trainee_details";
	Class.forName("com.mysql.jdbc.Driver");

	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useSSL=false", "root",
			"root");
int status=0;

	Statement stmt = conn.createStatement();
status=stmt.executeUpdate("delete from trainee_details where trainee_name='"+t+"'");
if(status==0)
	out.println("Error in deleteing the record");
else
	{out.println("Successfully deleted from the table");
response.sendRedirect("read.jsp");
	}stmt.close();
	conn.close();
}
catch (Exception e) {
	out.println(e);
}


%>
</body>
</html>