<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
 <% 
project.accessories ass=new accessories();           
Integer cvahed0_=(Integer)session.getAttribute("cvahed0"); 
 try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
       ass.query = "UPDATE problemwhys SET tv=?,wgx=?  WHERE  cvahed=?";
       ass.st = ass.con.prepareStatement(ass.query);
       ass.st.setInt(1, 0);
       ass.st.setInt(2, 0);
       ass.st.setInt(3, cvahed0_);
       ass.st.executeUpdate();
       ass.st.close();
}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.con!=null) ass.con.close();
}
 %>
