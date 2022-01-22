<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %>
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
 <%  
project.accessories ass=new accessories();           
  String buffer="<select id='naghsh' onclick='chkp()' onchange='ini_member()' class='formStyle'>";

 
 try
  {
      String naghsh_="";
      Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
      ass.con = DriverManager.getConnection(ass.url,ass.id,ass.pass);  
      Statement stmt = ass.con.createStatement();  
      ass.rs = stmt.executeQuery("Select * from naghsh ORDER BY code");
      buffer=buffer+"<option>"+"Select a Role..."+"</option>";  
      while(ass.rs.next()){
          naghsh_=ass.rs.getString(2).trim();
          buffer=buffer+"<option>"+naghsh_+"</option>";  
      }  
      buffer=buffer+"</select>"; 
      out.print(buffer);
  }
 catch(Exception e)
  {
     System.out.println(e);
  } 
 
 
 %>
