<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
 <%  
String username0_=(String)session.getAttribute("username0");      
Integer cvahed0_=(Integer)session.getAttribute("cvahed0");   
String code0_=(String)session.getAttribute("code0"); 
String naghsh0_=(String)session.getAttribute("naghsh0"); 
Integer cnaghsh0_=(Integer)session.getAttribute("cnaghsh0"); 
project.accessories ass=new accessories();     
String whyx = request.getParameter("elaatt");
whyx=ass.getu_f(whyx);
String wgxx = request.getParameter("vazn");
String strkey = request.getParameter("strkey");
String yn = request.getParameter("yn");
String cid = request.getParameter("cid");
Integer idx;
String rsx,code_id;
code_id="";
rsx="";
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
       ass.query4 = "SELECT count(*) AS idx FROM problemwhys";
       ass.st4 = ass.con.prepareStatement(ass.query4);
       ass.rs5=ass.st4.executeQuery();
       if (ass.rs5.next()){
          idx=ass.rs5.getInt("idx");
          idx=idx+1;
          for (int i = 0; i < 1000000; i++) {
               rsx=code0_.trim()+String.valueOf(idx);
               ass.query5 = "SELECT * FROM problemwhys WHERE id=?";
               ass.st5=ass.con.prepareStatement(ass.query5);
               ass.st5.setString(1, rsx.trim());
               ass.rs6=ass.st5.executeQuery();
               if (!ass.rs6.next()) {
                   ass.rs6.close();
                   ass.st5.close();
                   break;
               } else {
                   idx=idx+1;
               }
           }
       }    else {
            idx=1;
            rsx=code0_.trim()+String.valueOf(idx);
       }
           ass.query3 = "SELECT * From problemwhys WHERE id=?";
           ass.st3 = ass.con.prepareStatement(ass.query3);
           ass.st3.setString(1, strkey);
           ass.rs4=ass.st3.executeQuery();
           if(ass.rs4.next()){
               code_id=ass.rs4.getString("code_id");
           }
           code_id=code_id.trim()+"."+cid;
           ass.query5 = "INSERT INTO problemwhys (id,problemwhyx,levels,cvahed,usern,naghsh,dates,code_id)"+
                                    "values (?,?,?,?,?,?,?,?) ";
            ass.st5=ass.con.prepareStatement(ass.query5);                      
            ass.st5.setString(1, rsx);
            ass.st5.setString(2, whyx);
            ass.st5.setString(3, strkey);
            ass.st5.setInt(4, cvahed0_);
            ass.st5.setString(5, username0_);
            ass.st5.setString(6, naghsh0_);
            ass.st5.setString(7, ass.date_milady());
            ass.st5.setString(8, code_id);
            ass.st5.executeUpdate();
            ass.st5.close();
}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.con!=null) ass.con.close();
}
 %>
