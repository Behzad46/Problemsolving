<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="javax.swing.JOptionPane"%>
<%@page import= " java.sql.*"%>
<%@page import= " java.io.*"%>
<%@page import= " project.accessories"%>

<%
    project.accessories ass=new accessories();
    Integer cvahed0_=(Integer)session.getAttribute("cvahed0");   
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
try{   
    
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   
   ass.query = "DELETE FROM levelha WHERE  cvahed=?";
   ass.st=ass.con.prepareStatement(ass.query);                      
   ass.st.setInt(1, cvahed0_);
   ass.st.executeUpdate();
   
   ass.query1 = "SELECT * FROM problemwhys WHERE cvahed=?";
   ass.st = ass.con.prepareStatement(ass.query1);
   ass.st.setInt(1, cvahed0_);
   ass.rs=ass.st.executeQuery();
       
   while(ass.rs.next()){
       if (ass.rs.getString("levels")!=null && ass.rs.getString("levels")!="") {
         ass.query2 = "SELECT * FROM levelha WHERE levels=?";
         ass.st1 = ass.con.prepareStatement(ass.query2);
         ass.st1.setString(1, ass.rs.getString("levels"));
         ass.rs1=ass.st1.executeQuery();
         if(ass.rs1.next()){
         }else{
            ass.query = "INSERT INTO levelha (levels,cvahed,usern) values (?,?,?)";
            ass.pst=ass.con.prepareStatement(ass.query);
            ass.pst.setString(1, ass.rs.getString("levels"));
            ass.pst.setInt(2, cvahed0_);
            ass.pst.setString(3, ass.rs.getString("usern"));
            ass.pst.executeUpdate();
         } 
       }  
   }      
         ass.pst.close();
         ass.rs1.close();
         ass.st.close();
         ass.st1.close();
         ass.rs.close();
   } catch (Exception e) {
       e.printStackTrace();
   }finally{
    ass.con.close();
    }
    
%>    