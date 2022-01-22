<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="javax.swing.JOptionPane"%>
<%@page import= " java.sql.*"%>
<%@page import= " java.io.*"%>
<%@page import= " project.accessories"%>

<%
    project.accessories ass=new accessories();
    String radif1=request.getParameter("radif1");
    String fname1=request.getParameter("fname1");
    String lname1=request.getParameter("lname1");
    String email1=request.getParameter("email1");
    fname1=ass.getu_f(fname1);
    lname1=ass.getu_f(lname1);
    email1=ass.getu_f(email1);
    Integer radifi;
    radifi=0;
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
try{   
   radifi=Integer.parseInt(radif1);
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
                ass.query = "SELECT count(*) AS radifx FROM helperlist";
                ass.st = ass.con.prepareStatement(ass.query);
                ass.rs=ass.st.executeQuery();
                
                if (ass.rs.next()) {  
                    if (radifi!=0) {
                            ass.query1 = "UPDATE helperlist SET firstname=?,lastname=?,email=? WHERE  radif=?";
                            ass.st1 = ass.con.prepareStatement(ass.query1);
                            ass.st1.setString(1, fname1);
                            ass.st1.setString(2, lname1);
                            ass.st1.setString(3, email1);
                            ass.st1.setInt(4, radifi);
                            ass.st1.executeUpdate();
                            ass.st1.close();
                    }else{
                        ass.query3 = "INSERT INTO helperlist (radif,firstname,lastname,email)"
                        + " values (?,?,?,?) ";
                        ass.st1 = ass.con.prepareStatement(ass.query3);
                        ass.st1.setInt(1, ass.rs.getInt("radifx")+1);
                        ass.st1.setString(2, fname1);
                        ass.st1.setString(3, lname1);
                        ass.st1.setString(4, email1);
                        ass.st1.executeUpdate();
                    }
                        }
   } catch (Exception e) {
       e.printStackTrace();
   }finally{
    ass.con.close();
    }
    
%>    