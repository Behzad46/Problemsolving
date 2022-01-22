<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
 <%  
project.accessories ass=new accessories();             
String perno0 = request.getParameter("perno");
Double perno_;
perno_=Double.parseDouble(perno0);
String data="";
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
       ass.query = "SELECT * From person WHERE perno=?";
       ass.st = ass.con.prepareStatement(ass.query);
       ass.st.setDouble(1, perno_);
       ass.rs1=ass.st.executeQuery();
       if (ass.rs1.next()) {
          data = ":" + "1";
       }else{
          data = ":" + "0"; 
       }
       out.print(data);
       return; 
}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.con!=null) ass.con.close();
}
 %>
