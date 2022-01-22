<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
 <%  
project.accessories ass=new accessories();          
String val = request.getParameter("val1");
String strkeyp="";
strkeyp=ass.problemstr(val);
Integer cvahed0_=(Integer)session.getAttribute("cvahed0");   
String data="";
String sql="";
String sql1="";
String ptxt="";
String cv="";
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   if(val==null ||val=="" ){
       sql = "SELECT * FROM panel WHERE  cvahed=?";
       PreparedStatement pst = ass.con.prepareStatement(sql);
       pst.setInt(1, cvahed0_);
       ass.rs=pst.executeQuery();
       if(ass.rs.next())
        {
        sql1 = "SELECT * FROM problemwhys WHERE id=? "; 
        PreparedStatement pst1 = ass.con.prepareStatement(sql1);
        pst1.setString(1, ass.rs.getString("id"));
        ass.rs1=pst1.executeQuery();
        if(ass.rs1.next()){
           ptxt=ass.rs1.getString("problemwhyx").trim();
        }
        sql1 = "SELECT * FROM vaheds WHERE radif=? "; 
        pst1 = ass.con.prepareStatement(sql1);
        pst1.setInt(1, ass.rs.getInt("cvahed"));
        ass.rs1=pst1.executeQuery();
        if(ass.rs1.next()){
           cv=ass.rs1.getString("vahed").trim();
        }
        data = ":" + ptxt + ":" +cv +":"+ ass.rs.getString("pdesc").trim()
                +":"+String.valueOf(ass.rs.getInt("pproblem"))
                +":"+ String.valueOf(ass.rs.getInt("ppayan"))
                +":"+ String.valueOf(ass.rs.getInt("pelaat"))
                +":"+ String.valueOf(ass.rs.getInt("pvazn"))
                +":"+String.valueOf(ass.rs.getInt("ppalayesh"));
       }
       out.print(data);
    }else{
       sql = "SELECT * FROM panel WHERE  cvahed=? AND id=? "; 
       PreparedStatement pst = ass.con.prepareStatement(sql);
       pst.setInt(1, cvahed0_);
       pst.setString(2, strkeyp);
       ass.rs=pst.executeQuery();
       if(ass.rs.next())
        {
        sql1 = "SELECT * FROM problemwhys WHERE id=? "; 
        PreparedStatement pst1 = ass.con.prepareStatement(sql1);
        pst1.setString(1, ass.rs.getString("id"));
        ass.rs1=pst1.executeQuery();
        if(ass.rs1.next()){
           ptxt=ass.rs1.getString("problemwhyx").trim();
        }
        sql1 = "SELECT * FROM vaheds WHERE radif=? "; 
        pst1 = ass.con.prepareStatement(sql1);
        pst1.setInt(1, ass.rs.getInt("cvahed"));
        ass.rs1=pst1.executeQuery();
        if(ass.rs1.next()){
           cv=ass.rs1.getString("vahed").trim();
        }
        data = ":" + ptxt + ":" +cv +":"+ ass.rs.getString("pdesc").trim()
                +":"+String.valueOf(ass.rs.getInt("pproblem"))
                +":"+ String.valueOf(ass.rs.getInt("ppayan"))
                +":"+ String.valueOf(ass.rs.getInt("pelaat"))
                +":"+ String.valueOf(ass.rs.getInt("pvazn"))
                +":"+String.valueOf(ass.rs.getInt("ppalayesh"));
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
