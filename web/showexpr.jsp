<%@page import="project.accessories"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " project.RegularExpressions"%>
<%@page import= " javax.swing.JOptionPane"%>
 <%  
String val = request.getParameter("val1");     

project.RegularExpressions reg=new RegularExpressions();  
String data="";
boolean result;
try{
   result= reg.regExpMatches( val ); 
   if(result){
       data=":" +"1"+":"+"The string \"" + val + "\" MATCHES";
   }else{
       data=":"+"0"+":"+"The string \"" + val + "\" DOES NOT matches.";
   }
   out.print(data);
}
catch(Exception e){
    e.printStackTrace();}
 %>
