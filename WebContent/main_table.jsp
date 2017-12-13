<%@page import="DB.DB_Control"%>

<%@ page language="java" import="java.sql.*"%>

<%@ page import="syllabus.Syllabus" %>
<%@ page import="syllabus.SearchLecture" %>

<%@ page import="java.util.ArrayList"%>

<%

   String id = (String)session.getAttribute("id");
   String c1 = request.getParameter("one");
   String c2 = request.getParameter("two");
   String c3 = request.getParameter("three");
   

   String s1 = request.getParameter("sub01");
   String s2 = request.getParameter("sub02");

   

   session.setAttribute("c1", c1);
   session.setAttribute("c2", c2);
   session.setAttribute("c3", c3);
   session.setAttribute("s1", s1);
   session.setAttribute("s2", s2);

   DB_Control db = (DB_Control) session.getAttribute("database");

   ArrayList<SearchLecture> main_rs = db.getMainRs(id, "computer",s1, s2, c1, c2, c3);
   
   session.setAttribute("main_rs", main_rs);

   response.sendRedirect("main_view.jsp");

%>