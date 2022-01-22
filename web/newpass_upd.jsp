<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %>
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
 <%  
project.accessories ass=new accessories();         
String npass_ = request.getParameter("npass");
String username0_=(String)session.getAttribute("username0");   
String data="";
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
       ass.query = "UPDATE passwords SET  password=? WHERE username=?";
       ass.st = ass.con.prepareStatement(ass.query);
       ass.st.setString(1, npass_);
       ass.st.setString(2, username0_);
       ass.st.executeUpdate();
       data = ":" + "1";
       out.print(data);
       return; 
}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.con!=null) ass.con.close();
}
 %>
