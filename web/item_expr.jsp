<%@page import="javax.swing.JOptionPane"%>
<%@page language="java" import ="java.sql.*" %> 
 <%  
  String buffer="<select id='exp' name='exp' onchange='ini_items()' Style='position:absolute; top:12%;right:4%;font: 14px Arial'>";
 
 try
  {
      buffer=buffer+"<option>"+"select ... "+"</option>";
      buffer=buffer+"<option>"+"minor damages "+"</option>";
      buffer=buffer+"<option>"+"heavy damage "+"</option>";
      buffer=buffer+"<option>"+"no damage "+"</option>";
      buffer=buffer+"</select>"; 
      out.print(buffer);
  }
 catch(Exception e)
  {
     System.out.println(e);
  } 
 
 
 %>
