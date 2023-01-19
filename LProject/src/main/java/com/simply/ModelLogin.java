package com.simply;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ModelLogin {
	public String url1 = "jdbc:mysql://localhost:3306/simpli-class";
	public 	String username1 = "root";
		public String password1 = "root";
	
	
	
int id;
String name;
int standard;
String division;
private Connection con;
private PreparedStatement pstmt;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int getStandard() {
	return standard;
}
public void setStandard(int standard) {
	this.standard = standard;
}
public String getDivision() {
	return division;
}
public void setDivision(String division) {
	this.division = division;
}

public ModelLogin ()throws Exception
{ 
	Class.forName("com.mysql.jdbc.Driver");
	con =	DriverManager.getConnection(url1, username1, password1);
}
public boolean check() throws Exception {
	String sql = "Select * from students1 where student_name=? and standard=? and division=?";
	pstmt=con.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setInt(2, standard);
	pstmt.setString(3, division);
	ResultSet set =pstmt.executeQuery();
	if(set.next()==true)
	{  
		return true;
	}else
	{
	return false;
	}
	
	
}



}
