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
String wgxx = request.getParameter("vazn");
String strkey = request.getParameter("strkey");
String yn = request.getParameter("yn");
String cid = request.getParameter("cid");
whyx=ass.getu_f(whyx);
String data="";
Integer idx,wgxxi,sumwg,yni,tag;
 String rsx,code_id;
 code_id="";
 rsx="";
 sumwg=0;
 tag=0;
try{
   wgxxi=Integer.parseInt(wgxx);
   yni=Integer.parseInt(yn);
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
       ass.query2 = "SELECT * From panel WHERE cvahed=?";
       ass.st2 = ass.con.prepareStatement(ass.query2);
       ass.st2.setInt(1, cvahed0_);
       ass.rs3=ass.st2.executeQuery();
       if (ass.rs3.next()) {
          if ((ass.rs3.getInt("pelaat")==0 || ass.rs3.getInt("pproblem")==0) && (cnaghsh0_==1) ) {
              ass.rs1.close();
              ass.rs2.close();
              ass.rs3.close();
              ass.st2.close();
              ass.con.close();
              data = ":" + "1";
              out.print(data);
              return; 
          }
       }
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
       if(yni==1){
           ass.query5 = "select SUM(wgx) as sumwg from vaznha  WHERE levels=?  AND usern=?";
           ass.st5=ass.con.prepareStatement(ass.query5);
           ass.st5.setString(1, strkey);
           ass.st5.setString(2, username0_);
           ass.rs6=ass.st5.executeQuery();
           if (ass.rs6.next()) {
               sumwg= ass.rs6.getInt("sumwg");
           }
           sumwg=sumwg+wgxxi;
           if  (sumwg>100) {
               ass.rs1.close();
               ass.rs2.close();
               ass.rs3.close();
               ass.st2.close();
               ass.rs5.close(); 
               ass.st4.close();
               ass.con.close();
               data = ":" + "2";
               out.print(data);
               return; 
           }
           if  (sumwg<100) {
               tag=1;
           }           
           ass.query6 = "SELECT * From vaznha WHERE usern=? AND id=?";
           ass.st6=ass.con.prepareStatement(ass.query6);
           ass.st6.setString(1, username0_);
           ass.st6.setString(2, rsx);
           ass.rs7=ass.st6.executeQuery();
           if (ass.rs7.next()) {
              ass.query3 = "UPDATE vaznha SET wgx=? AND dates=? WHERE usern=? AND id=?";
              ass.st4=ass.con.prepareStatement(ass.query3);
              ass.st4.setInt(1, wgxxi);
              ass.st4.setString(2, ass.date_convert());
              ass.st4.setString(3, username0_);
              ass.st4.setString(4, rsx);
              ass.st4.executeUpdate();
           }else{
              ass.query3 = "INSERT INTO vaznha (usern,id,levels,wgx,cvahed,dates) values (?,?,?,?,?,?) ";
              ass.st4=ass.con.prepareStatement(ass.query3);
              ass.st4.setString(1, username0_);
              ass.st4.setString(2, rsx);
              ass.st4.setString(3, strkey);
              ass.st4.setInt(4, wgxxi);
              ass.st4.setInt(5, cvahed0_);
              ass.st4.setString(6, ass.date_convert());
              ass.st4.executeUpdate();
              
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
            ass.st5.setString(7, ass.date_convert());
            ass.st5.setString(8, code_id);
            ass.st5.executeUpdate();
            ass.st5.close();
       }else{
           ass.query5 = "select SUM(wgx) as sumwg from vaznha  WHERE levels=?  AND usern=?";
           ass.st5=ass.con.prepareStatement(ass.query5);
           ass.st5.setString(1, strkey);
           ass.st5.setString(2, username0_);
           ass.rs6=ass.st5.executeQuery();
           if (ass.rs6.next()) {
               sumwg= ass.rs6.getInt("sumwg");
           }
           if  (sumwg==100) {
               ass.rs1.close();
               ass.st.close();
               ass.rs2.close();
               ass.st1.close();
               ass.rs3.close();
               ass.st2.close();
               ass.rs5.close(); 
               ass.st4.close();
               ass.con.close();
               data = ":" + "3";
               out.print(data);
               return; 
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
            ass.st5.setString(7, ass.date_convert());
            ass.st5.setString(8, code_id);
            ass.st5.executeUpdate();
            ass.st5.close();
       }
       if  (tag==1) {
          data = ":" +"4"+":"+ code_id+":" + rsx;
          out.print(data);
       }else{
          data = ":" +"0"+":"+ code_id+":" + rsx;
          out.print(data);
       }
}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.con!=null) ass.con.close();
}
 %>
