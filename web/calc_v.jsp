<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
 <% 
project.accessories ass=new accessories();           
Integer cvahed0_=(Integer)session.getAttribute("cvahed0");   
 String strkey;
 Integer jno,sumwgx,wgxx;
 Integer avg,div,tag;
 div=0;
 wgxx=0;
 strkey="";
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
       ass.query = "SELECT * From problemwhys";
       ass.st = ass.con.prepareStatement(ass.query);
       ass.rs1=ass.st.executeQuery();
            while (ass.rs1.next()) {
                if(ass.rs1.getInt("cvahed")==cvahed0_ && ass.rs1.getString("levels")!=null){
                    jno=0;
                    sumwgx=0;
                    tag=0;
                    strkey=ass.rs1.getString("id");
                    ass.query1 = "SELECT * From vaznha WHERE cvahed=? AND id=?";
                    ass.st1=ass.con.prepareStatement(ass.query1);                      
                    ass.st1.setInt(1, cvahed0_);
                    ass.st1.setString(2, strkey.trim());
                    ass.rs2=ass.st1.executeQuery();
                    while (ass.rs2.next()) {
                        tag=1;
                        sumwgx=sumwgx+ass.rs2.getInt("wgx");
                        jno=jno+1;
                    }
                    if(tag==0){
                       sumwgx=100;
                       jno=1;
                    }
                    ass.rs2.close();
                    ass.st1.close();
                    if  (jno>0) {
                        avg=sumwgx/jno; 
                        ass.query2 = "UPDATE problemwhys SET wgx=?,tv=?   WHERE  id=?";
                        ass.st2=ass.con.prepareStatement(ass.query2);                      
                        ass.st2.setInt(1, avg);
                        ass.st2.setInt(2, 1);
                        ass.st2.setString(3, strkey);
                        ass.st2.executeUpdate();
                        ass.st2.close();
                    }
                }    
            }
            ass.rs1.close();
            ass.st.close();
                    ass.query1 = "DELETE FROM levelha WHERE cvahed=?";
                    ass.st1=ass.con.prepareStatement(ass.query1);  
                    ass.st1.setInt(1, cvahed0_);
                    ass.st1.executeUpdate();
                    ass.query1 = "SELECT * From problemwhys WHERE cvahed=? order by levels ";
                    ass.st1=ass.con.prepareStatement(ass.query1);                      
                    ass.st1.setInt(1, cvahed0_);
                    ass.rs2=ass.st1.executeQuery();
                    while(ass.rs2.next()){
                        if(ass.rs2.getString("levels")!=null){
                            ass.query2 = "SELECT * From levelha WHERE levels=? AND cvahed=?";
                            ass.st2=ass.con.prepareStatement(ass.query2);  
                            ass.st2.setString(1, ass.rs2.getString("levels"));
                            ass.st2.setInt(2, cvahed0_);
                            ass.rs3=ass.st2.executeQuery();
                            if(!ass.rs3.next()){
                              ass.query3 = "INSERT INTO levelha (levels,cvahed) values (?,?) ";
                              ass.st3=ass.con.prepareStatement(ass.query3);                      
                              ass.st3.setString(1, ass.rs2.getString("levels"));
                              ass.st3.setInt(2, cvahed0_);
                              ass.st3.executeUpdate();
                              ass.st3.close();
                            }
                            ass.st2.close();
                        }    
                    }
                    ass.query1 = "SELECT * From levelha WHERE cvahed=?";
                    ass.st1=ass.con.prepareStatement(ass.query1);                      
                    ass.st1.setInt(1, cvahed0_);
                    ass.rs2=ass.st1.executeQuery();
                    while(ass.rs2.next()){
                          ass.query3 = "SELECT * From problemwhys WHERE cvahed=? AND levels=?   ";
                          ass.st3=ass.con.prepareStatement(ass.query3);                      
                          ass.st3.setInt(1, cvahed0_);
                          ass.st3.setString(2, ass.rs2.getString("levels"));
                          ass.rs3=ass.st3.executeQuery();
                          sumwgx=0;
                          while(ass.rs3.next()){
                             sumwgx=sumwgx+ass.rs3.getInt("wgx");
                             wgxx=ass.rs3.getInt("wgx");
                             strkey=ass.rs3.getString("id");
                          }   
                                div=100-sumwgx;
                                if(div<0){
                                    div=0;
                                }
                                div=wgxx+div;
                                ass.query2 = "UPDATE problemwhys SET wgx=? WHERE  id=? AND tv=?";
                                ass.st2=ass.con.prepareStatement(ass.query2);                      
                                ass.st2.setInt(1, div);
                                ass.st2.setString(2, strkey);
                                ass.st2.setInt(3, 1);
                                ass.st2.executeUpdate();
                                ass.st2.close();
                    } 
}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.con!=null) ass.con.close();
}
 %>
