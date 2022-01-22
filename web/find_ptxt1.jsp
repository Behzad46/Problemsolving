<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " javax.swing.JOptionPane"%>
<%@page import= " project.accessories"%>
 <%  
project.accessories ass=new accessories();     
String strkeyt = request.getParameter("strkeyt");
String vahed_ = request.getParameter("vahed");
vahed_=ass.getu_f(vahed_);
strkeyt=ass.getu_f(strkeyt);
String data="";
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
       ass.query = "SELECT * FROM problems WHERE  vahed=? AND LTRIM(rtrim(problemtxt))=?";
       ass.st = ass.con.prepareStatement(ass.query);
       ass.st.setString(1, vahed_);
       ass.st.setString(2, strkeyt.trim());
       ass.rs1=ass.st.executeQuery();
       if (ass.rs1.next()) {
          data = ":" + ass.rs1.getString(1).trim();
          out.print(data);
          return; 
       }
}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.con!=null) ass.con.close();
}
 %>
