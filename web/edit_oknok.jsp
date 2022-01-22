<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
 <%  
project.accessories ass=new accessories();               
String idx = request.getParameter("idx");
String radifx = request.getParameter("radifx");
String oknokx = request.getParameter("oknokx");
Integer radifxi,oknokxi;
try{
   radifxi=Integer.parseInt(radifx); 
   oknokxi=Integer.parseInt(oknokx); 
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   ass.query = "UPDATE rahkar SET oknok=? WHERE id=? AND radif=?";
   ass.st=ass.con.prepareStatement(ass.query); 
   if(oknokxi==1){
      ass.st.setInt(1, 0); 
   }else{
      ass.st.setInt(1, 1);  
   }
   ass.st.setString(2, idx);
   ass.st.setInt(3, radifxi);  
   ass.st.executeUpdate();
   ass.st.close();
}
catch(Exception e){
    e.printStackTrace();}
finally{
   ass.con.close();
   ass.st.close();
}
 %>
