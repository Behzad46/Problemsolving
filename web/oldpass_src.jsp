<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
 <%  
project.accessories ass=new accessories();          
String opass_ = request.getParameter("opass");
String username0_=(String)session.getAttribute("username0");   
String data="";
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
       ass.query = "SELECT * From passwords WHERE username=? AND password=?";
       ass.st = ass.con.prepareStatement(ass.query);
       ass.st.setString(1, username0_);
       ass.st.setString(2, opass_);
       ass.rs1=ass.st.executeQuery();
       if (!ass.rs1.next()) {
           ass.rs1.close();
           ass.st.close();
           ass.con.close();
           data = ":" + "1";
           out.print(data);
           return; 
       }
}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.con!=null) ass.con.close();
}
 %>
