<%@page import="java.sql.*;" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Page</title>
</head>
<body>
<div align="center">
<%String t=request.getParameter("tname");
out.println("<h1>"+t+"</h1>");
int count=1;
String tname="trainee_details";
try{
Class.forName("com.mysql.jdbc.Driver");

Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useSSL=false", "root",
"root");

Statement stmt = conn.createStatement();

ResultSet rs = stmt.executeQuery("SELECT * FROM  trainee_details where trainee_name='"+request.getParameter("tname")+"'");

//out.println("<h1>---"+tname+"---</h1>");

out.println("<table border='1'> ");


while (rs.next()) {
out.println("<tr>");
//out.println("<td>"+(count++)+"</td>");
//out.println("<td>"+rs.getString(1)+"</td>");
//out.println("<td>"+rs.getString(2)+"</td>");
//out.println("<td>"+rs.getString(3)+"</td>");
/*	while(j<=a) {
		out.println("<td>"+rs.getString(j)+"</td>");
			j++;
	}*/

%>


<form action="editaction.jsp">
<table>
<tr><th>Name </th><td><input type="text" name="tname" readonly="readonly" value="<%=rs.getString(1) %> " placeholder="Enter the traineename"></d></td></tr>
<tr><th>Branch</th><td><input type="text" name="branch" value="<%=rs.getString(2) %>"></td></tr>
<tr><th>College</th><td><input type="text" name="college" value="<%=rs.getString(3) %>"></td></tr>
<tr><td><input type="reset" value="Clear"/></td><td><input type="submit" value="Insert"/></td></tr>
</table>
</form>
<%
}
out.println("</table>");
rs.close();
stmt.close();
conn.close();
} catch (Exception e) {
out.println(e);
}

%>
</div>
</body>
</html>