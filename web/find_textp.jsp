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
       ass.query = "SELECT * From panel WHERE id=?";
       ass.st = ass.con.prepareStatement(ass.query);
       ass.st.setString(1, strkey);
       ass.rs1=ass.st.executeQuery();
       if (ass.rs1.next()) {
          data = ":" + "1"+":" + ass.rs1.getString("pdesc").trim();
          out.print(data);
          return; 
       }else{
          ass.query = "SELECT * From problemwhys WHERE id=?";
          ass.st = ass.con.prepareStatement(ass.query);
          ass.st.setString(1, strkey);
          ass.rs1=ass.st.executeQuery();
          if (ass.rs1.next()) {
             ass.query1 = "SELECT * From passwords WHERE username=?";
             ass.st1 = ass.con.prepareStatement(ass.query1);
             ass.st1.setString(1, ass.rs1.getString("usern"));
             ass.rs2=ass.st1.executeQuery();
             if(ass.rs2.next()){
                data = ":" + "1"+":" +"علت مورد نظر توسط آقا/خانم "+ ass.rs2.getString("name").trim()+" "+ass.rs2.getString("family").trim()+" "+"عنوان شده است ";
                out.print(data);
                return; 
             }
          }           
       }
       
}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.con!=null) ass.con.close();
}
 %>
