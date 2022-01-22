<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="javax.swing.JOptionPane"%>
<%@page import= " java.sql.*"%>
<%@page import= " java.io.*"%>
<%@page import= " project.accessories"%>

<%
    project.accessories ass=new accessories();
    String radif1=request.getParameter("radif1");
    Integer radifi,i;
    radifi=0;
    i=1;
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
try{   
   radifi=Integer.parseInt(radif1); 
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
            if (radifi!=0) {
                ass.query = "DELETE FROM helperlist  WHERE radif=?";
                ass.st = ass.con.prepareStatement(ass.query);
                ass.st.setInt(1, radifi);
                ass.st.executeUpdate();
            }
            ass.query1 = "SELECT *  FROM helperlist";
            ass.st1 = ass.con.prepareStatement(ass.query1);
            ass.rs1=ass.st1.executeQuery();
            while(ass.rs1.next()){
                ass.query2 = "UPDATE helperlist SET radif=? WHERE  radif=?";
                ass.st2 = ass.con.prepareStatement(ass.query2);
                ass.st2.setInt(1, i);
                ass.st2.setInt(2, ass.rs1.getInt("radif"));
                ass.st2.executeUpdate();
                ass.st2.close();
                i++;
            }
   } catch (Exception e) {
       e.printStackTrace();
   }finally{
    ass.con.close();
    }
    
%>    