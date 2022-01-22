<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
 <%  
project.accessories ass=new accessories();               
String username0_=(String)session.getAttribute("username0");   
Integer cnaghsh0_=(Integer)session.getAttribute("cnaghsh0"); 
String radif = request.getParameter("radif");
String strkey = request.getParameter("strkey");
String data="";
 String wgxx,whyx;
 wgxx="";
 whyx="";
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
       ass.query = "SELECT * From problemwhys WHERE id=?";
       ass.st = ass.con.prepareStatement(ass.query);
       ass.st.setString(1, strkey);
       ass.rs1=ass.st.executeQuery();
       if (ass.rs1.next()) {
          if (ass.rs1.getInt("tv")==1  && (cnaghsh0_==1 || cnaghsh0_==5) ) {
              ass.rs1.close();
              ass.st.close();
              ass.con.close();
              data = ":" + "0";
              out.print(data);
              return; 
          }
          if (ass.rs1.getString("levels")==null || ass.rs1.getString("levels")=="") {
              ass.rs1.close();
              ass.st.close();
              ass.con.close();
              data = ":" + "0";
              out.print(data);
              return; 
          }
          if (!ass.rs1.getString("usern").equals(username0_) && (cnaghsh0_==1 || cnaghsh0_==5)) {
              ass.rs1.close();
              ass.st.close();
              ass.con.close();
              data = ":" + "0";
              out.print(data);
              return; 
          }
          whyx=ass.rs1.getString(2);
          wgxx=String.valueOf(ass.rs1.getInt(3));
       }
       ass.st.close();
       ass.rs1.close();
       ass.query = "UPDATE problemwhys SET code_id=? WHERE  id=?";
       ass.st=ass.con.prepareStatement(ass.query);                      
       ass.st.setString(1, radif);
       ass.st.setString(2, strkey);
       ass.st.executeUpdate();
       ass.st.close();
       data = ":" + "1"+":" + whyx+":" + wgxx;
       out.print(data);
}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.con!=null) ass.con.close();
}
 %>
