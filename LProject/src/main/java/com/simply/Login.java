package com.simply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/View")
public class Login extends HttpServlet {
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
 HttpSession session = req.getSession(true);
	
	
	
	String name =req.getParameter("name");
 String s1=req.getParameter("standard");
 int standard=Integer.parseInt(s1);
String division=req.getParameter("division");
session.setAttribute("standardog", standard);
session.setAttribute("nameog", name);
session.setAttribute("divisionog", division);

try {
	ModelLogin m = new ModelLogin();
	m.setName(name);
	m.setDivision(division);
	m.setStandard(standard);
	
	boolean b =m.check();
	if(b==true) {
		resp.sendRedirect("/LProject/Home.html");
	}else {
		resp.sendRedirect("/LProject/IncorrectDetails.html");
	}
	
	
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}


}
}
