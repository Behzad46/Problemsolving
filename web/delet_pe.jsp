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
String data="";
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
       ass.query = "SELECT * From panel WHERE cvahed=?";
       ass.st = ass.con.prepareStatement(ass.query);
       ass.st.setInt(1, cvahed0_);
       ass.rs1=ass.st.executeQuery();
       if (ass.rs1.next()) {
          if (ass.rs1.getInt("pelaat")==0  && (cnaghsh0_==1 || cnaghsh0_==5) ) {
              ass.rs1.close();
              ass.st.close();
              ass.con.close();
              data = ":" + "2";
              out.print(data);
              return; 
          }
       }
       ass.query = "SELECT * From problemwhys WHERE id=?";
       ass.st = ass.con.prepareStatement(ass.query);
       ass.st.setString(1, strkey);
       ass.rs1=ass.st.executeQuery();
       if (ass.rs1.next()) {
          if (ass.rs1.getInt("tv")==1  && (cnaghsh0_==1 || cnaghsh0_==5) ) {
              ass.rs1.close();
              ass.st.close();
              ass.con.close();
              data = ":" + "3";
              out.print(data);
              return; 
          }
          if ((cnaghsh0_==1 || cnaghsh0_==5) && (ass.rs1.getString("levels")==null || ass.rs1.getString("levels")=="")) {
              ass.rs1.close();
              ass.st.close();
              ass.con.close();
              data = ":" + "4";
              out.print(data);
              return; 
          }
          if ((cnaghsh0_==1 || cnaghsh0_==5) && (ass.rs1.getString("usern").trim().equals(username0_.trim())==false)) {
              ass.rs1.close();
              ass.st.close();
              ass.con.close();
              data = ":" + "5";
              out.print(data);
              return; 
          }
          }
          Integer tagid=0;
          ass.query = "SELECT * From problems WHERE id=?";
          ass.st = ass.con.prepareStatement(ass.query);
          ass.st.setString(1, strkey);
          ass.rs1=ass.st.executeQuery();
          if (ass.rs1.next()) {
              tagid=1;
          }
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
          ass.query = "DELETE FROM levelha WHERE  levels=?";
          ass.st=ass.con.prepareStatement(ass.query);                      
          ass.st.setString(1, strkey);
          ass.st.executeUpdate();
          if(tagid==1){
             data = ":" + "1"+":" + "6";
          }else{
              data = ":" + "1"+":" + "7";
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
