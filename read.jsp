<%@ page import="java.sql.*;" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Read Data</title>
</head>
<body>
<div align="center">

<a href="index.jsp">Back</a>
<h1>Trainee_Details</h1>
<table border="1">

<tr>
<th>SI.NO</th>
<th>Trainee_Name</th>
<th>Branch</th>
<th>College</th>
<th>Action</th>

</tr>
<%
try {
	int count=1;
	//String tname=request.getParameter("uname");
	String tname="trainee_details";
	Class.forName("com.mysql.jdbc.Driver");

	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useSSL=false", "root",
			"root");

	Statement stmt = conn.createStatement();

	ResultSet rs = stmt.executeQuery("SELECT * FROM "+tname);
	
	out.println("<h1>---"+tname+"---</h1>");
	
	
	//out.println("<table border='1'> ");


	while (rs.next()) {
out.println("<tr>");
out.println("<td>"+(count++)+"</td>");
out.println("<td>"+rs.getString(1)+"</td>");
out.println("<td>"+rs.getString(2)+"</td>");
out.println("<td>"+rs.getString(3)+"</td>");
	/*	while(j<=a) {
			out.println("<td>"+rs.getString(j)+"</td>");
				j++;
		}*/
	
	%>
	<td> <a href="edit.jsp?tname=<%=rs.getString(1) %>">Edit</a> | <a href="delete.jsp?tname=<%=rs.getString(1) %>">Delete</a></td>
		</tr>
	
<%	}
	//out.println("</table>");
	rs.close();
	stmt.close();
	conn.close();
} catch (Exception e) {
	out.println(e);
}
%>



</table>

</div>

</body>
</html>