<%@page import="DB.DB_Control"%>
<%@ page language="java" import="java.sql.*"%>
<%
	String check1 = request.getParameter("one");
	String check2 = request.getParameter("two");
	String check3 = request.getParameter("three");
	System.out.println(check1 + " " + check2 + " " + check3);

	DB_Control db = (DB_Control) session.getAttribute("database");
	ResultSet main_rs = db.getMainRs("computer", check1, check2, check3);
	session.setAttribute("main_rs", main_rs);
	response.sendRedirect("main_view.jsp");
%>