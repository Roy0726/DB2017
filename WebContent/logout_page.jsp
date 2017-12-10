<%@page import="DB.DB_Control"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="DB.DB_Control"%>
<%
   Object obj = session.getAttribute("database");
   DB_Control db = (DB_Control) obj;
   
   if (db.getStmt() != null)
      db.getStmt().close();
   
   if (db.getConn() != null)
      db.getConn().close();
   
   // 1: 기존의 세션 데이터를 모두 삭제
   session.invalidate();
   // 2: 로그인 페이지로 이동시킴.
   response.sendRedirect("Login.html");
%>