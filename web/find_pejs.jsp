<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
 <%  
project.accessories ass=new accessories();             
String strkey = request.getParameter("strkey");
String data="";
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
       ass.query = "SELECT * From problemwhys WHERE id=?";
       ass.st = ass.con.prepareStatement(ass.query);
       ass.st.setString(1, strkey);
       ass.rs1=ass.st.executeQuery();
       if (ass.rs1.next()) {
          data = ":" + ass.rs1.getString(2).trim();
          out.print(data);
          return; 
       }else{
          data = ":" + "0";
          out.print(data);
          return; 
       }
}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.con!=null) ass.con.close();
   ass.st.close();
   ass.rs1.close();
}
 %>
