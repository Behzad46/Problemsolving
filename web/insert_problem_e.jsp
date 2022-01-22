<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
 <%  
String username0_=(String)session.getAttribute("username0");   
Integer cvahed0_=(Integer)session.getAttribute("cvahed0");   
String code0_=(String)session.getAttribute("code0"); 
String naghsh0_=(String)session.getAttribute("naghsh0"); 
project.accessories ass=new accessories();     
String whyx = request.getParameter("problemt");
whyx=ass.getu_f(whyx);

 String rsx="";
 Integer idx;
 String data="";

try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
       ass.query = "SELECT * From problemwhys ";
       ass.st = ass.con.prepareStatement(ass.query);
       ass.rs1=ass.st.executeQuery();
       ass.query1 = "SELECT * From problems";
       ass.st1 = ass.con.prepareStatement(ass.query1);
       ass.rs2=ass.st1.executeQuery();
       ass.query2 = "SELECT count(*) AS idx FROM problemwhys";
       ass.st2 = ass.con.prepareStatement(ass.query2);
       ass.rs3=ass.st2.executeQuery();
       if (ass.rs3.next()){
          idx=ass.rs3.getInt("idx");
          idx=idx+1;
          for (int i = 0; i < 1000000; i++) {
               rsx=code0_.trim()+String.valueOf(idx);
               ass.query3 = "SELECT * FROM problemwhys WHERE id=?";
               ass.st3=ass.con.prepareStatement(ass.query3);
               ass.st3.setString(1, rsx.trim());
               ass.rs4=ass.st3.executeQuery();
               if (!ass.rs4.next()) {
                   ass.rs4.close();
                   ass.st3.close();
                   break;
               } else {
                   idx=idx+1;
               }
           }
       }    else {
            idx=1;
            rsx=code0_.trim()+String.valueOf(idx);
       }
            ass.query = "INSERT INTO problemwhys (id,problemwhyx,wgx,cvahed,usern"+
                                ",naghsh,dates,datee,code_id) values (?,?,?,?,?,?,?,?,?) ";
            ass.st=ass.con.prepareStatement(ass.query);
            ass.st.setString(1, rsx);
            ass.st.setString(2, whyx);
            ass.st.setInt(3, 0);
            ass.st.setInt(4, cvahed0_);
            ass.st.setString(5, username0_);
            ass.st.setString(6, naghsh0_);
            ass.st.setString(7, ass.date_milady());
            ass.st.setString(8, "");
            ass.st.setString(9, "1");
            ass.st.executeUpdate();
            ass.query1 = "INSERT INTO problems (id,problemtxt,cvahed,usern"+
                                ",naghsh,dates,datee) values (?,?,?,?,?,?,?) ";
            ass.st1=ass.con.prepareStatement(ass.query1);
            ass.st1.setString(1, rsx);
            ass.st1.setString(2, whyx);
            ass.st1.setInt(3, cvahed0_);
            ass.st1.setString(4, username0_);
            ass.st1.setString(5, naghsh0_);
            ass.st1.setString(6, ass.date_milady());
            ass.st1.setString(7, "");
            ass.st1.executeUpdate();
             ass.query1 = "INSERT INTO panel (id,cvahed,pproblem,pelaat,pvazn,ppayan,pdesc) values (?,?,?,?,?,?,?)";
             ass.st1 = ass.con.prepareStatement(ass.query1);
             ass.st1.setString(1, rsx);
             ass.st1.setInt(2, cvahed0_);
             ass.st1.setInt(3, 0);
             ass.st1.setInt(4, 0);
             ass.st1.setInt(5, 0);
             ass.st1.setInt(6, 0);
             ass.st1.setString(7, "-");
             ass.st1.executeUpdate();
             ass.st1.close();
            data = ":" + rsx;
            out.print(data);

}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.con!=null) ass.con.close();
}
 %>
