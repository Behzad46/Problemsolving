<%@page import="javax.swing.JOptionPane"%>
<%
String crow_0 = request.getParameter("crow0");  
session.setAttribute("crow", Integer.parseInt(crow_0));
%>