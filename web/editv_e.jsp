<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
 <%  
String username0_=(String)session.getAttribute("username0");   
Integer cvahed0_=(Integer)session.getAttribute("cvahed0");   
Integer cnaghsh0_=(Integer)session.getAttribute("cnaghsh0"); 
project.accessories ass=new accessories();          
String wgxx = request.getParameter("wgxx");
String strkey = request.getParameter("strkey");
String data="";
Integer sumwg,wgxxi,tag;
 String levelx,whyx,code_id;
 whyx="";
 code_id="";
 tag=0;
try{
   wgxxi=Integer.parseInt(wgxx);
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
       ass.query = "SELECT * From panel WHERE cvahed=?";
       ass.st = ass.con.prepareStatement(ass.query);
       ass.st.setInt(1, cvahed0_);
       ass.rs1=ass.st.executeQuery();
       if (ass.rs1.next()) {
          if ((ass.rs1.getInt("pvazn")==0 || ass.rs1.getInt("pproblem")==0 ||ass.rs1.getInt("ppayan")==1 ) && (cnaghsh0_==1 || cnaghsh0_==5)){
              ass.rs1.close();
              ass.st.close();
              ass.con.close();
              data = ":" + "1";
              out.print(data);
              return; 
          }
       }
       ass.query = "SELECT * From problemwhys WHERE id=?";
       ass.st = ass.con.prepareStatement(ass.query);
       ass.st.setString(1, strkey);
       ass.rs1=ass.st.executeQuery();
       if (ass.rs1.next()) {
          if (ass.rs1.getInt("tv")==1  && (cnaghsh0_==1 || cnaghsh0_==5) ) {
              ass.rs1.close();
              ass.st.close();
              ass.con.close();
              data = ":" + "2";
              out.print(data);
              return; 
          }
          if (ass.rs1.getString("levels")==null || ass.rs1.getString("levels")=="") {
              ass.rs1.close();
              ass.st.close();
              ass.con.close();
              data = ":" + "3";
              out.print(data);
              return; 
          }
          if (ass.rs1.getInt("tv")==1  && (cnaghsh0_==2 || cnaghsh0_==3) ) {
          code_id=ass.rs1.getString(10);
          whyx=ass.rs1.getString(2);
          sumwg=0;
          levelx="";
          strkey=ass.rs1.getString("id");
          sumwg=wgxxi;
          levelx=ass.rs1.getString("levels");
          ass.st.close();
          ass.rs1.close();
          ass.query = "SELECT * From problemwhys WHERE levels=?";
          ass.st = ass.con.prepareStatement(ass.query);
          ass.st.setString(1, levelx);
          ass.rs1=ass.st.executeQuery();
          while (ass.rs1.next()){
            if (ass.rs1.getInt("cvahed")==cvahed0_) {
                if(!ass.rs1.getString("id").equals(strkey)){
                   sumwg=sumwg+ass.rs1.getInt("wgx");
                }
            }
          }
          if  (sumwg>100) {
               ass.rs1.close();
               ass.st.close();
               ass.con.close();
               data = ":" + "4";
               out.print(data);
               return; 
          }
          if  (sumwg<100) {
              tag=1;
          }
          ass.query = "SELECT * From problemwhys WHERE id=?";
          ass.st = ass.con.prepareStatement(ass.query);
          ass.st.setString(1, strkey);
          ass.rs1=ass.st.executeQuery();
          if (ass.rs1.next()) {
             ass.query = "UPDATE problemwhys SET wgx=?,dates=?   WHERE  id=?";
             ass.st = ass.con.prepareStatement(ass.query);
             ass.st.setInt(1, wgxxi);
             ass.st.setString(2, ass.date_milady());
             ass.st.setString(3, strkey);
             ass.st.executeUpdate();
             ass.rs1.close(); 
             ass.st.close();
          }
          }else{
          code_id=ass.rs1.getString(10);
          whyx=ass.rs1.getString(2);
          sumwg=0;
          levelx="";
          strkey=ass.rs1.getString("id");
          sumwg=wgxxi;
          levelx=ass.rs1.getString("levels");
          ass.st.close();
          ass.rs1.close();
          ass.query = "SELECT * From vaznha WHERE levels=? AND usern=?";
          ass.st = ass.con.prepareStatement(ass.query);
          ass.st.setString(1, levelx);
          ass.st.setString(2, username0_);
          ass.rs1=ass.st.executeQuery();
          while (ass.rs1.next()){
            if (ass.rs1.getInt("cvahed")==cvahed0_) {
                if(!ass.rs1.getString("id").equals(strkey)){
                   sumwg=sumwg+ass.rs1.getInt("wgx");
                }
            }
          }
          if  (sumwg>100) {
               ass.rs1.close();
               ass.st.close();
               ass.con.close();
               data = ":" + "4";
               out.print(data);
               return; 
          }
          if  (sumwg<100) {
              tag=1;
          }
          ass.query = "SELECT * From vaznha WHERE usern=? AND id=?";
          ass.st = ass.con.prepareStatement(ass.query);
          ass.st.setString(1, username0_);
          ass.st.setString(2, strkey);
          ass.rs1=ass.st.executeQuery();
          if (ass.rs1.next()) {
             ass.query = "UPDATE vaznha SET wgx=?,dates=?   WHERE usern=? AND id=?";
             ass.st = ass.con.prepareStatement(ass.query);
             ass.st.setInt(1, wgxxi);
             ass.st.setString(2, ass.date_milady());
             ass.st.setString(3, username0_);
             ass.st.setString(4, strkey);
             ass.st.executeUpdate();
             ass.rs1.close(); 
             ass.st.close();
          } else {
             ass.query = "INSERT INTO vaznha (usern,id,levels,wgx,cvahed,dates)"+
                                         "values (?,?,?,?,?,?) ";
             ass.st = ass.con.prepareStatement(ass.query);
             ass.st.setString(1, username0_);
             ass.st.setString(2, strkey);
             ass.st.setString(3, levelx);
             ass.st.setInt(4, wgxxi);
             ass.st.setInt(5, cvahed0_);
             ass.st.setString(6, ass.date_milady());
             ass.st.executeUpdate();
             ass.rs1.close(); 
             ass.st.close();
          }
       }
       }
       if(tag==1){
         data = ":" + "5"+":" + whyx+":" + code_id;
         out.print(data);
       }else{
         data = ":" + "6"+":" + whyx+":" + code_id;
         out.print(data);
       }
}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.con!=null) ass.con.close();
}
 %>
