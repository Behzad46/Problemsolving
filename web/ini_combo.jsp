<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
 <%  
 
project.accessories ass=new accessories();          
 String buffer="<select id='uname'"
         + "  onchange='ini_item()' style='position:absolute;top:10px;left:65%;font:13pt Arial;border:none;"
         + "border:solid thin;border-color:#aaaa00;box-shadow: 2px 2px 1px #000000;text-align:right;background-color: #EBE6E2;width:10%'>";
 
 try
  {
      String uname_="";
      Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
      ass.con = DriverManager.getConnection(ass.url,ass.id,ass.pass);  
      Statement stmt = ass.con.createStatement();  
      ass.rs = stmt.executeQuery("Select * from passwords ");  
      while(ass.rs.next()){
          uname_=ass.rs.getString(1);
          buffer=buffer+"<option>"+uname_+"</option>";  
      }  
      buffer=buffer+"</select>"; 
      out.print(buffer);
  }
 catch(Exception e)
  {
     System.out.println(e);
  } 
 
 
 %>
  