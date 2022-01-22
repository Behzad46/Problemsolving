<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
 <%  
project.accessories ass=new accessories();             
String username0_=(String)session.getAttribute("username0");   
Integer cnaghsh0_=(Integer)session.getAttribute("cnaghsh0"); 
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
          if (((cnaghsh0_==1 || cnaghsh0_==5) && ((ass.rs1.getString("usern").trim().equals(username0_.trim())==false)
                  || ass.rs1.getInt("tv")==1)) || ((cnaghsh0_==2 || cnaghsh0_==3) && (ass.rs1.getInt("tv")==1))) {
              ass.rs1.close();
              ass.st.close();
              ass.con.close();
              data = ":" + "1";
              out.print(data);
              return; 
          }else{
          data = ":" + "0";
          out.print(data);
          return; 
       }
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
