<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import= " project.accessories"%>

 <%  
    project.accessories ass=new accessories();
    String dee=request.getParameter("dee"); 
    String de_;
    de_=ass.ltof_date(dee);
    String data="";
    data = ":" + de_;
    out.print(data);
 
 %>
  