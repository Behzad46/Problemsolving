<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="javax.swing.JOptionPane"%>
<%@page import= " project.accessories"%>
<%@page import= " java.sql.*"%>
<%@page import= " java.io.*"%>

<%
    project.accessories ass=new accessories();        
    String data="";
    String uname1=request.getParameter("uname1");   
    String cp1=request.getParameter("cp1");   
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
    int updatequery=0;
    if(uname1!=null && uname1!="admin"){
        if(uname1!="" && uname1!="admin" ){
try{   
    
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   ass.query = "DELETE FROM passwords WHERE  username=?";
   ass.pst=ass.con.prepareStatement(ass.query);
   ass.pst.setString(1, uname1);
   updatequery=ass.pst.executeUpdate();
   
   ass.query = "SELECT * FROM problems WHERE usern=?";
   ass.pst=ass.con.prepareStatement(ass.query);
   ass.pst.setString(1, uname1);
   ass.rs1=ass.pst.executeQuery();
   if(ass.rs1.next()){
      ass.query1 = "DELETE FROM panel WHERE  id=?";
      ass.pst1=ass.con.prepareStatement(ass.query1);
      ass.pst1.setString(1, ass.rs1.getString("id"));
      updatequery=ass.pst1.executeUpdate();
      ass.pst1.close();
   }
   ass.query1 = "DELETE FROM problems WHERE  usern=?";
   ass.pst1=ass.con.prepareStatement(ass.query1);
   ass.pst1.setString(1, uname1);
   updatequery=ass.pst1.executeUpdate();
   
   ass.query1 = "DELETE FROM levelha WHERE  usern=?";
   ass.pst1=ass.con.prepareStatement(ass.query1);
   ass.pst1.setString(1, uname1);
   updatequery=ass.pst1.executeUpdate();
 
   String sql1 = "SELECT * FROM problemwhys WHERE usern=?";
   ass.pst=ass.con.prepareStatement(sql1);
   ass.pst.setString(1, uname1);
   ass.rs1=ass.pst.executeQuery();
   while( ass.rs1.next() ){
       ass.query = "DELETE FROM vaznha WHERE  id=?";
       ass.pst1=ass.con.prepareStatement(ass.query);
       ass.pst1.setString(1, ass.rs1.getString("id"));
       updatequery=ass.pst1.executeUpdate();
   }
   ass.rs1.close();
   ass.query = "DELETE FROM problemwhys WHERE  usern=?";
   ass.pst=ass.con.prepareStatement(ass.query);
   ass.pst.setString(1, uname1);
   updatequery=ass.pst.executeUpdate();

   ass.query = "DELETE FROM vaznha WHERE  usern=?";
   ass.pst=ass.con.prepareStatement(ass.query);
   ass.pst.setString(1, uname1);
   updatequery=ass.pst.executeUpdate();

   ass.query = "DELETE FROM rahkar WHERE  usern=?";
   ass.pst=ass.con.prepareStatement(ass.query);
   ass.pst.setString(1, uname1);
   updatequery=ass.pst.executeUpdate();

   ass.query = "UPDATE code_problem SET  tag=? WHERE code=?";
   ass.pst=ass.con.prepareStatement(ass.query);
   ass.pst.setInt(1, 0);
   ass.pst.setString(2, cp1.trim());
   ass.pst.executeUpdate();
   
   ass.query = "SELECT * FROM passwords"; 
   ass.pst = ass.con.prepareStatement(ass.query);
   ass.rs=ass.pst.executeQuery();
       if(ass.rs.next())
        {
        data = ":" + ass.rs.getString("username").trim() + ":" +ass.rs.getString("naghsh").trim() +":"+ ass.rs.getString("vahed").trim()
                +":"+ ass.rs.getString("password")+":"+String.valueOf(ass.rs.getLong("perno"))+":"+ ass.rs.getString("name").trim()
                +":"+ ass.rs.getString("family").trim()+":"+ ass.rs.getString("ghesmat").trim()
                +":"+String.valueOf(ass.rs.getInt("ptree"))
                +":"+ String.valueOf(ass.rs.getInt("telatha"))
                +":"+ String.valueOf(ass.rs.getInt("rahkar"))
                +":"+ String.valueOf(ass.rs.getInt("pvahed"))
                +":"+ String.valueOf(ass.rs.getInt("ppanel"))
                +":"+ String.valueOf(ass.rs.getInt("pperson"))
                +":"+ String.valueOf(ass.rs.getInt("ynrahkar"))
                +":"+ String.valueOf(ass.rs.getInt("tmojri"))
                +":"+ String.valueOf(ass.rs.getInt("rpt1"))
                +":"+ String.valueOf(ass.rs.getInt("rpt2"))
                +":"+ String.valueOf(ass.rs.getInt("rpt3"))
                +":"+ String.valueOf(ass.rs.getInt("padmin"));
       }
       out.print(data);

   if(updatequery!=0){
       out.println("Unable...");
   }
   } catch (Exception e) {
       e.printStackTrace();
   }finally{
    ass.pst.close();
    ass.con.close();
}
 }
    }
    
%>    