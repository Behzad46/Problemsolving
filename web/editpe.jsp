<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
 <%  
String username0_=(String)session.getAttribute("username0");   
Integer cvahed0_=(Integer)session.getAttribute("cvahed0");   
Integer cnaghsh0_=(Integer)session.getAttribute("cnaghsh0"); 
project.accessories ass=new accessories(); 
String whyx = request.getParameter("whyx");
whyx=ass.getu_f(whyx);

String strkey = request.getParameter("strkey");
String data="";
 String wgxx,code_id;
 wgxx="0";
 code_id="";
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
              data = ":" + "1";
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
              data = ":" + "2";
              out.print(data);
              return; 
          }
          if ((cnaghsh0_==1 || cnaghsh0_==5) && (ass.rs1.getString("levels")==null || ass.rs1.getString("levels")=="")) {
              ass.rs1.close();
              ass.st.close();
              ass.con.close();
              data = ":" + "3";
              out.print(data);
              return; 
          }
          if ((cnaghsh0_==1 || cnaghsh0_==5) && (ass.rs1.getString("usern").trim().equals(username0_.trim())==false)) {
              ass.rs1.close();
              ass.st.close();
              ass.con.close();
              data = ":" + "4";
              out.print(data);
              return; 
          }
          code_id=ass.rs1.getString(10);
       }
          if (ass.rs1.getInt("tv")==1  && (cnaghsh0_==2 || cnaghsh0_==3) ) {
             ass.query1 = "SELECT * From problemwhys WHERE  id=?";
             ass.st1 = ass.con.prepareStatement(ass.query1);
             ass.st1.setString(1, strkey);
             ass.rs2=ass.st1.executeQuery();
             if(ass.rs2.next()) {
               wgxx=String.valueOf(ass.rs2.getInt(3));
             }
             ass.st1.close();
             ass.rs2.close();
          }else{
             ass.query1 = "SELECT * From vaznha WHERE usern=? AND id=?";
             ass.st1 = ass.con.prepareStatement(ass.query1);
             ass.st1.setString(1, username0_);
             ass.st1.setString(2, strkey);
             ass.rs2=ass.st1.executeQuery();
             if(ass.rs2.next()) {
               wgxx=String.valueOf(ass.rs2.getInt(5));
             }
             ass.st1.close();
             ass.rs2.close();
          }
       ass.query = "UPDATE problemwhys SET problemwhyx=? WHERE  id=?";
       ass.st=ass.con.prepareStatement(ass.query);                      
       ass.st.setString(1, whyx);
       ass.st.setString(2, strkey);
       ass.st.executeUpdate();
       ass.st.close();
       ass.query = "UPDATE problems SET problemtxt=? WHERE  id=?";
       ass.st=ass.con.prepareStatement(ass.query);                      
       ass.st.setString(1, whyx);
       ass.st.setString(2, strkey);
       ass.st.executeUpdate();
       ass.st.close();
       ass.query = "UPDATE rahkar SET elaat=? WHERE  id=?";
       ass.st=ass.con.prepareStatement(ass.query);                      
       ass.st.setString(1, whyx);
       ass.st.setString(2, strkey);
       ass.st.executeUpdate();
       ass.st.close();
       data = ":" + "5"+":" + wgxx+":" + code_id;
       out.print(data);
}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.con!=null) ass.con.close();
}
 %>
