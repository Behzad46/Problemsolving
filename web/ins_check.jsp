<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import= " project.accessories"%>
<%@page language="java" import ="java.sql.*" %> 
 <%  
 project.accessories ass=new accessories();         
 Integer cvahed0_=(Integer)session.getAttribute("cvahed0");   
 String data="";
try
  {
      Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
      ass.con = DriverManager.getConnection(ass.url,ass.id,ass.pass); 
      ass.query = "SELECT * FROM panel WHERE  cvahed=?";
      ass.st = ass.con.prepareStatement(ass.query);
      ass.st.setInt(1, cvahed0_);
      ass.rs=ass.st.executeQuery();
      if(ass.rs.next()){
          if (ass.rs.getInt(3)==1){
             if (ass.rs.getInt(4)==1){
                 data = ":" + "3"+":" + "1";
             }else{
                 data = ":" + "3"+":" + "0";
             }
              
          }else{
              data = ":" + "2";
          }
      }  
      out.print(data);
  }
 catch(Exception e)
  {
     System.out.println(e);
  } 
 
 
 %>
  