<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import= " project.accessories"%>
<%@page language="java" import ="java.sql.*" %> 
 <%  
 project.accessories ass=new accessories();            
 String buffer="<select id='vaheds'"
         + "onchange='ini_problem()' style='position:absolute;top:96px;left:2%;font:16px arial;width:20%;height:3.5%;'>";
 
 try
  {
      String vahed_="";
      Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
      ass.con = DriverManager.getConnection(ass.url,ass.id,ass.pass);  
      Statement stmt = ass.con.createStatement();  
      ass.rs = stmt.executeQuery("Select * from vaheds ORDER BY radif");  
      buffer=buffer+"<option>"+"Select ..."+"</option>"; 
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
  