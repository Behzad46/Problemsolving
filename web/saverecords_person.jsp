<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="javax.swing.JOptionPane"%>
<%@page import= " java.sql.*"%>
<%@page import= " java.io.*"%>
<%@page import= " project.accessories"%>

<%
    project.accessories ass=new accessories();
    Double perno10;
    String perno1=request.getParameter("perno1");
    String name1=request.getParameter("name1");
    name1=ass.getu_f(name1);
    String family1=request.getParameter("family1");
    family1=ass.getu_f(family1);
    String ghesmat1=request.getParameter("ghesmat1");
    ghesmat1=ass.getu_f(ghesmat1);
    if(perno1==null || perno1==""){
        perno10=0.0;
    }else{
        perno10=Double.parseDouble(perno1);
    }
    
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
    int updatequery=0;
try{   
    
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   ass.query1 = "SELECT * FROM person WHERE perno=?";
   ass.st = ass.con.prepareStatement(ass.query1);
   ass.st.setDouble(1, perno10);
   ass.rs=ass.st.executeQuery();
       
   if(ass.rs.next()){
         ass.query = "UPDATE person SET  perno=?,names=?,family=?,ghesmat=? WHERE perno=?";
         ass.pst=ass.con.prepareStatement(ass.query);
         ass.pst.setDouble(1, perno10);
         ass.pst.setString(2, name1);
         ass.pst.setString(3, family1);
         ass.pst.setString(4, ghesmat1);
         ass.pst.setDouble(5, perno10);
         ass.pst.executeUpdate();
   }else{
         ass.query = "INSERT INTO person (perno,names,family,ghesmat) values (?,?,?,?)";
         ass.pst=ass.con.prepareStatement(ass.query);
         ass.pst.setDouble(1, perno10);
         ass.pst.setString(2, name1);
         ass.pst.setString(3, family1);
         ass.pst.setString(4, ghesmat1);
         ass.pst.executeUpdate();
   }      
         ass.pst1.close();
         ass.rs1.close();
         ass.st.close();
         ass.rs.close();

   if(updatequery!=0){
       out.println("Unable...");
   }
   } catch (Exception e) {
       e.printStackTrace();
   }finally{
    ass.con.close();
    }
    
%>    