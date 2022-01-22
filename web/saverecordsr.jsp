<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="javax.swing.JOptionPane"%>
<%@page import= " java.sql.*"%>
<%@page import= " java.io.*"%>
<%@page import= " project.accessories"%>

<%
    project.accessories ass=new accessories();
    String radif1=request.getParameter("radif1");
    String rahkar1=request.getParameter("rahkar1");
    String rdesc1=request.getParameter("rdesc1");
    rahkar1=ass.getu_f(rahkar1);
    String elaat1=request.getParameter("elaat1");
    elaat1=ass.getu_f(elaat1);
    String strkeyid=request.getParameter("strkeyid");
    String strkeyp=request.getParameter("strkeyp");
    String username0_=(String)session.getAttribute("username0"); 
    Integer cvahed0_=(Integer)session.getAttribute("cvahed0");   
    rahkar1=ass.getu_f(rahkar1);
    elaat1=ass.getu_f(elaat1);
    String c_id;
    Integer radifi;
    radifi=0;
    c_id="";
    String data="";
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
try{   
   radifi=Integer.parseInt(radif1);
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
                ass.query = "SELECT count(*) AS radifx FROM rahkar WHERE id=? AND cvahed=? ";
                ass.st = ass.con.prepareStatement(ass.query);
                ass.st.setString(1, strkeyid);
                ass.st.setInt(2, cvahed0_);
                ass.rs=ass.st.executeQuery();
                if (ass.rs.next()) {  
                    if (radifi!=0) {
                       ass.query = "SELECT * FROM rahkar  WHERE id=? AND radif=?"; 
                       ass.st1 = ass.con.prepareStatement(ass.query);
                       ass.st1.setString(1, strkeyid);
                       ass.st1.setInt(2, radifi);
                       ass.rs1=ass.st1.executeQuery();
                       if (ass.rs1.next()) {
                            if (!ass.rs1.getString("usern").trim().equals(username0_.trim())) {
                                ass.rs1.close();
                                ass.rs1.close();
                                ass.con.close();
                                data = ":" + "1";
                                out.print(data);
                                return;
                            }
                            ass.query1 = "UPDATE rahkar SET rahkar=?,rdesc=? WHERE id=? AND radif=?";
                            ass.st1 = ass.con.prepareStatement(ass.query1);
                            ass.st1.setString(1, rahkar1);
                            ass.st1.setString(2, rdesc1);
                            ass.st1.setString(3, strkeyid);
                            ass.st1.setInt(4, radifi);
                            ass.st1.executeUpdate();
                            ass.st1.close();
                        }
                    }else{
                        ass.query2 = "SELECT * FROM problemwhys  WHERE id=? "; 
                        ass.st2 = ass.con.prepareStatement(ass.query2);
                        ass.st2.setString(1, strkeyid);
                        ass.rs2=ass.st2.executeQuery();
                        if(ass.rs2.next()){
                            c_id=ass.rs2.getString("code_id");
                        }
                        ass.query3 = "INSERT INTO rahkar (radif,id,elaat,usern,cvahed,rahkar,rdesc,oknok,mojri,dates,datee,code_id,problem_id)"
                        + " values (?,?,?,?,?,?,?,?,?,?,?,?,?) ";
                        ass.st1 = ass.con.prepareStatement(ass.query3);
                        ass.st1.setInt(1, ass.rs.getInt("radifx")+1);
                        ass.st1.setString(2, strkeyid);
                        ass.st1.setString(3, elaat1);
                        ass.st1.setString(4, username0_);
                        ass.st1.setInt(5, cvahed0_);
                        ass.st1.setString(6, rahkar1);
                        ass.st1.setString(7, rdesc1);
                        ass.st1.setInt(8, 0);
                        ass.st1.setString(9, "");
                        ass.st1.setString(10, ass.date_milady());
                        ass.st1.setString(11, "");
                        ass.st1.setString(12, c_id);
                        ass.st1.setString(13, strkeyp);
                        ass.st1.executeUpdate();
                    }
                    data = ":" + "0";
                    out.print(data);
                }
   } catch (Exception e) {
       e.printStackTrace();
   }finally{
    ass.con.close();
    }
    
%>    