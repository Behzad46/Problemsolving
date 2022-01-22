<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %>
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
 <%  
project.accessories ass=new accessories();               
String username0_=(String)session.getAttribute("username0"); 
Integer cvahed0_=(Integer)session.getAttribute("cvahed0");   

  String buffer="<select id='vaheds' onclick='chkp()' class='formStyle'>";

 try
  {
      String vahed_="";
      Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
      ass.con = DriverManager.getConnection(ass.url,ass.id,ass.pass);  
      Statement stmt = ass.con.createStatement(); 
      ass.rs = stmt.executeQuery("Select * from vaheds ORDER BY radif");   
      buffer=buffer+"<option>"+"Select a Committee..."+"</option>";   
      while(ass.rs.next()){
          vahed_=ass.rs.getString(2).trim();
           buffer=buffer+"<option>"+vahed_+"</option>";  
      }  
      buffer=buffer+"</select>"; 
      out.print(buffer);
  }
 catch(Exception e)
  {
     System.out.println(e);
  } 
 
 
 %>
  