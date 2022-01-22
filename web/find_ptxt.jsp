<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " javax.swing.JOptionPane"%>
<%@page import= " project.accessories"%>
 <%  
project.accessories ass=new accessories(); 
String strkeyt = request.getParameter("strkeyt");
String strkeyp="";
strkeyp=ass.problemstr(strkeyt);
String data="";
try{
       data=":" + strkeyp;
       out.print(data);
       return; 
}
catch(Exception e){
    e.printStackTrace();
}
 %>
