<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="javax.swing.JOptionPane"%>
<%@page import= " java.sql.*"%>
<%@page import= " java.io.*"%>
<%@page import= " project.accessories"%>

<%
    project.accessories ass=new accessories();
    Integer c010,c110,c210,r110,r210;
    Integer cvahed0_=(Integer)session.getAttribute("cvahed0");   
    String problem1=request.getParameter("problem1");
    String strkeyp="";
    strkeyp=ass.problemstr(problem1);
    String descp1=request.getParameter("descp1");
    descp1=ass.getu_f(descp1);
    String c11=request.getParameter("c11");
    String c21=request.getParameter("c21");
    String r11=request.getParameter("r11");
    String r21=request.getParameter("r21");
    String c01=request.getParameter("c01");
    if(c01==null || c01==""){
        c010=0;
    }else{
        c010=1;
    }
    if(c11==null || c11==""){
        c110=0;
    }else{
        c110=1;
    }
    if(c21==null || c21==""){
        c210=0;
    }else{
        c210=1;
    }
    if( r11.equals("1")){
        r110=1;
    }else{
        r110=0;
    }
    if(r21.equals("1")){
        r210=1;
    }else{
        r210=0;
    }
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
try{   
    
                ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
                ass.query = "SELECT * FROM panel WHERE cvahed=?";
                ass.st = ass.con.prepareStatement(ass.query);
                ass.st.setInt(1, cvahed0_);
                ass.rs=ass.st.executeQuery();
                while (ass.rs.next()) {  
                    ass.query1 = "UPDATE panel SET  ppalayesh=?,pelaat=?,pvazn=? WHERE id=?";
                    ass.st1 = ass.con.prepareStatement(ass.query1);
                    ass.st1.setInt(1, c010);
                    ass.st1.setInt(2, r110);
                    ass.st1.setInt(3, r210);
                    ass.st1.setString(4, ass.rs.getString("id"));
                    ass.st1.executeUpdate();
                }
                ass.query1 = "UPDATE panel SET  pproblem=?,ppayan=?,pdesc=? WHERE id=?";
                ass.st1 = ass.con.prepareStatement(ass.query1);
                ass.st1.setInt(1, c110);
                ass.st1.setInt(2, c210);
                ass.st1.setString(3, descp1);
                ass.st1.setString(4, strkeyp);
                ass.st1.executeUpdate();
                if (c210==1) {
                   ass.query1 = "UPDATE problems SET  datee=? WHERE id=?";
                   ass.st1 = ass.con.prepareStatement(ass.query1);
                   ass.st1.setString(1, ass.date_milady());
                   ass.st1.setString(2, strkeyp);
                   ass.st1.executeUpdate();
                }
   } catch (Exception e) {
       e.printStackTrace();
   }finally{
    ass.con.close();
    }
    
%>    