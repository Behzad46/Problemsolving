<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
 <%  
project.accessories ass=new accessories();          
String idx = request.getParameter("idx");
String radifx = request.getParameter("radifx");
String mojrix = request.getParameter("mojrix");
mojrix=ass.getu_f(mojrix);
Integer radifxi;
try{
   radifxi=Integer.parseInt(radifx); 
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   ass.query = "UPDATE rahkar SET mojri=? WHERE id=? AND radif=?";
   ass.st=ass.con.prepareStatement(ass.query); 
   ass.st.setString(1, mojrix);
   ass.st.setString(2, idx);
   ass.st.setInt(3, radifxi);  
   ass.st.executeUpdate();
   ass.st.close();
   return; 
}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.con!=null) ass.con.close();
}
 %>
