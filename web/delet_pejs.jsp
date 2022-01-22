<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
 <%  
project.accessories ass=new accessories();          
String username0_=(String)session.getAttribute("username0");   
Integer cvahed0_=(Integer)session.getAttribute("cvahed0");   
Integer cnaghsh0_=(Integer)session.getAttribute("cnaghsh0"); 
String strkey = request.getParameter("strkey");
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
          ass.query = "DELETE FROM problemwhys WHERE  id=?";
          ass.st=ass.con.prepareStatement(ass.query);                      
          ass.st.setString(1, strkey);
          ass.st.executeUpdate();
          ass.query = "DELETE FROM problems WHERE  id=?";
          ass.st=ass.con.prepareStatement(ass.query);                      
          ass.st.setString(1, strkey);
          ass.st.executeUpdate();
          ass.query = "DELETE FROM rahkar WHERE  id=?";
          ass.st=ass.con.prepareStatement(ass.query);                      
          ass.st.setString(1, strkey);
          ass.st.executeUpdate();
          ass.query = "DELETE FROM panel WHERE  id=?";
          ass.st=ass.con.prepareStatement(ass.query);                      
          ass.st.setString(1, strkey);
          ass.st.executeUpdate();
          ass.query = "DELETE FROM vaznha WHERE  id=?";
          ass.st=ass.con.prepareStatement(ass.query);                      
          ass.st.setString(1, strkey);
          ass.st.executeUpdate();
          return; 
}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.con!=null) ass.con.close();
}
 %>
