<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import= " project.accessories"%>
<%@page language="java" import ="java.sql.*" %> 
 <%  
 project.accessories ass=new accessories();         
 Integer cvahed0_=(Integer)session.getAttribute("cvahed0");   
 String buffer="<select id='problems'"
         + "onchange='ini_item()' style='position:absolute;top:102px;left:2%;font:16px arial;width:20%;height:3.5%;'>";
 
 String problem_="";
 String cp_="";
try
  {
      Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
      ass.con = DriverManager.getConnection(ass.url,ass.id,ass.pass); 
      ass.query = "SELECT * FROM problems WHERE  cvahed=?";
      ass.st = ass.con.prepareStatement(ass.query);
      ass.st.setInt(1, cvahed0_);
      ass.rs=ass.st.executeQuery();
      //buffer=buffer+"<option>"+"Select ..."+"</option>"; 
      while(ass.rs.next()){
          ass.query1 = "SELECT * FROM panel WHERE  id=?";
          ass.st1 = ass.con.prepareStatement(ass.query1);
          ass.st1.setString(1, ass.rs.getString(1).trim());
          ass.rs1=ass.st1.executeQuery();
          if(ass.rs1.next()){
          if (ass.rs1.getInt(6)==1 && ass.rs1.getInt(7)==0){
             cp_=ass.rs.getString(1).trim();
             problem_=ass.rs.getString(2).trim();
             buffer=buffer+"<option>"+cp_+"-"+problem_+"</option>";
          }
          ass.st1.close();
          ass.rs1.close();
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
  