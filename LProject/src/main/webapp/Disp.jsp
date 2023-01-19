<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

 String url1 = "jdbc:mysql://localhost:3306/simpli-class";
 	String username1 = "root";
	 String password1 = "root";
Class.forName("com.mysql.jdbc.Driver");
Connection con =	DriverManager.getConnection(url1, username1, password1);

String name1 = (String)session.getAttribute("name");
if (name1.equalsIgnoreCase("student"))
{String sql1="Select student_name,id from students1";
PreparedStatement pstmt = con.prepareStatement(sql1);
ResultSet set =pstmt.executeQuery();
while(set.next()==true)
{
	out.println("<br>"+"Name of student "+set.getInt(2)+" is "+set.getString(1)+"<br>");
}
	
}else if(name1.equalsIgnoreCase("subject"))
{String sql1="Select subjects,id from students1 where subjects is not null";
PreparedStatement pstmt = con.prepareStatement(sql1);
ResultSet set =pstmt.executeQuery();
while(set.next()==true)
{
	out.println("<br>"+"Name of subject "+set.getInt(2)+" is "+set.getString(1)+"<br>");
}
	
}else if(name1.equalsIgnoreCase("teacher"))
{String sql1="Select teachers,id from students1 where teachers is not null";
PreparedStatement pstmt = con.prepareStatement(sql1);
ResultSet set =pstmt.executeQuery();
while(set.next()==true)
{
	out.println("<br>"+"Name of teacher "+set.getInt(2)+" is "+set.getString(1)+"<br>");
}
	
}else
{
	
}
%>
<br>
<br>
<label>To obtain proper class report of any student please click on the given link below</label>
<br><br>
<a href="Class-Report">For class report click here </a>
<br>
<br>
<label>To go back to home page ...  please click on the given link below</label>
<br><br>
<a href="Home">To go to HOME Page click here </a>
<br>
<br>
<br>
<br>
<label>To logout from this session  please click on the given link below</label>
<br><br>
<a href="Logout">To LOGOUT click here </a>
<br>
<br>


</body>
</html>