<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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

int standard = (int)session.getAttribute("standardog");
String name=(String) session.getAttribute("nameog");
String division=(String) session.getAttribute("divisionog");


String url1 = "jdbc:mysql://localhost:3306/simpli-class";
	String username1 = "root";
 String password1 = "root";
Class.forName("com.mysql.jdbc.Driver");
Connection con =	DriverManager.getConnection(url1, username1, password1);

String sql1="Select subject,teacher from students2 where standard=?";
PreparedStatement pstmt = con.prepareStatement(sql1);
pstmt.setInt(1, standard);
ResultSet set =pstmt.executeQuery();
out.print("Name of student is "+ name+"<br>");
out.print("Student standard is "+ standard+"<br>");
out.print("Division of student is  "+ division+"<br>");
while(set.next()==true)
{  
	out.println("<br>"+"Subject :"+set.getString(1)+"<br>"+"   Teacher alloted for this subject is "+set.getString(2)+"<br>");
}



%>
<br>
<label>To go back to home page ...  please click on the given link below</label>
<br><br>
<a href="Home">To go to HOME Page click here </a>
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