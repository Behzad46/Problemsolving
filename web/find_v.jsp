<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
 <%  
project.accessories ass=new accessories();               
String username0_=(String)session.getAttribute("username0"); 
Integer cnaghsh0_=(Integer)session.getAttribute("cnaghsh0"); 
Integer cvahed0_=(Integer)session.getAttribute("cvahed0");   
String strkey = request.getParameter("strkey");
String data="";
Integer tag=0;
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   ass.query = "SELECT * FROM problemwhys WHERE cvahed=? AND id=? ORDER BY code_id";
   ass.st = ass.con.prepareStatement(ass.query);
   ass.st.setInt(1, cvahed0_);
   ass.st.setString(2, strkey);
   ass.rs=ass.st.executeQuery();
   while( ass.rs.next()){
        if (ass.rs.getInt("tv")==1) {
            tag=1;
            break;
        }
   }
    if(cnaghsh0_==2 && tag==1){
       ass.query = "SELECT * From problemwhys WHERE id=?";
       ass.st = ass.con.prepareStatement(ass.query);
       ass.st.setString(1, strkey);
       ass.rs1=ass.st.executeQuery();
       if (ass.rs1.next()) {
          data = ":" + String.valueOf(ass.rs1.getInt(3));
       }else{
          data = ":" + "0"; 
       }
       out.print(data);
       return; 
    }else{
       ass.query = "SELECT * From vaznha WHERE id=? AND usern=?";
       ass.st = ass.con.prepareStatement(ass.query);
       ass.st.setString(1, strkey);
       ass.st.setString(2, username0_.trim());
       ass.rs1=ass.st.executeQuery();
       if (ass.rs1.next()) {
          data = ":" + String.valueOf(ass.rs1.getInt(5));
       }else{
          data = ":" + "0"; 
       }
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
