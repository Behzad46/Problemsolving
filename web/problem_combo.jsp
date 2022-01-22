<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import= " project.accessories"%>
<%@page language="java" import ="java.sql.*" %> 
 <%  
Integer cvahed0_=(Integer)session.getAttribute("cvahed0");   
project.accessories ass=new accessories();          
String buffer="<select id='problem'"
         + "  onchange='ini_item()' class='formStyle'>";
 
 String problem_="";
 String cp_="";
try
  {
      Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
      ass.con = DriverManager.getConnection(ass.url,ass.id,ass.pass);  
      ass.query = "SELECT * From problems WHERE cvahed=?";
      ass.st = ass.con.prepareStatement(ass.query);
      ass.st.setInt(1, cvahed0_);
      ass.rs=ass.st.executeQuery();
      while(ass.rs.next()){
          cp_=ass.rs.getString(1).trim();
          problem_=ass.rs.getString(2).trim();
          buffer=buffer+"<option>"+cp_+"-"+problem_+"</option>";  
          ass.query1 = "SELECT * FROM panel WHERE  id=?";
          ass.st1 = ass.con.prepareStatement(ass.query1);
          ass.st1.setString(1, ass.rs.getString("id"));
          ass.rs1=ass.st1.executeQuery();
          if (!ass.rs1.next()) {
             ass.query1 = "INSERT INTO panel (id,cvahed,pproblem,pelaat,pvazn,ppayan,pdesc) values (?,?,?,?,?,?,?)";
             ass.st1 = ass.con.prepareStatement(ass.query1);
             ass.st1.setString(1, ass.rs.getString("id"));
             ass.st1.setInt(2, cvahed0_);
             ass.st1.setInt(3, 0);
             ass.st1.setInt(4, 0);
             ass.st1.setInt(5, 0);
             ass.st1.setInt(6, 0);
             ass.st1.setString(7, "-");
             ass.st1.executeUpdate();
          }
      }  
      buffer=buffer+"</select>"; 
      out.print(buffer);
  }
 catch(Exception e)
  {
     System.out.println(e);
  } 
 
 
 %>
  