<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
 <%  
project.accessories ass=new accessories();          
String username0_=(String)session.getAttribute("username0");   
Integer cvahed0_=(Integer)session.getAttribute("cvahed0");   
String val = request.getParameter("val1");     
String data="";
String sql="";
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   if(val==null ||val=="" ){
       data = ":" +"0";
       out.print(data);
    }else{
       sql = "SELECT * FROM passwords WHERE username=? "; 
       PreparedStatement pst = ass.con.prepareStatement(sql);
       pst.setString(1, val);
       ass.rs=pst.executeQuery();
       if(ass.rs.next())
        {
        //sql1 = "SELECT * FROM vaheds WHERE radif=? "; 
        //PreparedStatement pst1 = ass.con.prepareStatement(sql1);
        //pst1.setInt(1, ass.rs.getInt("cvahed"));
        //ass.rs1=pst1.executeQuery();
        //if(ass.rs1.next()){
        //   cv=ass.rs1.getString("vahed");
        //}
        data = ":" + ass.rs.getString("username").trim() + ":" +String.valueOf(ass.rs.getLong("cnaghsh")) +":"+ String.valueOf(ass.rs.getLong("cvahed"))
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
                +":"+ String.valueOf(ass.rs.getInt("padmin"))
                +":"+  ass.rs.getString("code");
       }
       out.print(data);
   }   
       
}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.rs!=null) ass.rs.close();
   if(ass.con!=null) ass.con.close();
}
 %>
