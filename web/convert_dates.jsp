<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import= " project.accessories"%>

 <%  
    project.accessories ass=new accessories();
    String dss=request.getParameter("dss"); 
    String ds_;
    ds_=ass.ltof_date(dss);
    String data="";
    data = ":" + ds_;
    out.print(data);
 
 %>
  