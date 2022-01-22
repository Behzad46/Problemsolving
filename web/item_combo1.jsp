<%@page import="javax.swing.JOptionPane"%>
<%@page import= " project.accessories"%>
<%@page language="java" import ="java.sql.*" %> 
 <%  
project.accessories ass=new accessories();           
String username0_=(String)session.getAttribute("username0"); 
Integer cvahed0_=(Integer)session.getAttribute("cvahed0");   
  String buffer="<select id='uname' name='uname' onchange='ini_item()' class='formStyle'>";
 
 try
  {
      String uname_="";
      Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
      ass.con = DriverManager.getConnection(ass.url,ass.id,ass.pass);  
       if(username0_.trim().equals("admin")){
         Statement stmt = ass.con.createStatement(); 
         ass.rs = stmt.executeQuery("Select * from passwords ORDER BY code");   
      }else{
       ass.query = "SELECT * From passwords WHERE cvahed=? ORDER BY username";
       ass.st = ass.con.prepareStatement(ass.query);
       ass.st.setInt(1, cvahed0_);
       ass.rs=ass.st.executeQuery();
      }
      buffer=buffer+"<option>"+"Select User Name... "+"</option>";  
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
  