<%@page import="DB.DB_Control"%>
<%@ page language="java" import="java.sql.*"%>
<%
	String c1 = request.getParameter("one");
	String c2 = request.getParameter("two");
	String c3= request.getParameter("three");
	
	String s1 = request.getParameter("sub01");
	String s2 = request.getParameter("sub02");
	
	
	session.setAttribute("c1",c1);
	session.setAttribute("c2",c2);
	session.setAttribute("c3",c3);
	session.setAttribute("s1", s1);
	session.setAttribute("s2", s2);
	DB_Control db = (DB_Control) session.getAttribute("database");
	ResultSet main_rs = db.getMainRs("computer", c1, c2, c3);
	session.setAttribute("main_rs", main_rs);
	response.sendRedirect("main_view.jsp");
%>