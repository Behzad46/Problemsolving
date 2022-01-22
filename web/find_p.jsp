<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
 <%  
project.accessories ass=new accessories();             
String strkey = request.getParameter("strkey");
String data="";
 String strp;
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   strp=strkey;
   while(true){
       ass.query = "SELECT * From problemwhys WHERE id=?";
       ass.st = ass.con.prepareStatement(ass.query);
       ass.st.setString(1, strp);
       ass.rs1=ass.st.executeQuery();
       if (ass.rs1.next()) {
          if (ass.rs1.getString("levels")==null || ass.rs1.getString("levels")=="") {
            data = ":" + ass.rs1.getString(2).trim()+":" + ass.rs1.getString(1).trim();
            out.print(data);
            return; 
          }
          strp=ass.rs1.getString(4);
       }
   }   
}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.con!=null) ass.con.close();
}
 %>
