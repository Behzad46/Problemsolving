<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
<%@page import= " java.text.NumberFormat"%>
 <%  
project.accessories ass=new accessories();          
String strkey = request.getParameter("strkey"); 
String problemtxt = request.getParameter("problemtxt"); 
Integer cvahed0_=(Integer)session.getAttribute("cvahed0");
String te;
te=ass.ctelatha(cvahed0_, strkey,problemtxt);
String title_="";
String elaat_="";
String data = ":" +"0";
Double vazn_=0.0;
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   String sql1 = "SELECT * from resultx WHERE cvahed=? ORDER BY vazn DESC";
   ass.pst=ass.con.prepareStatement(sql1);
   ass.pst.setInt(1, cvahed0_);
   ass.rs=ass.pst.executeQuery();
   while( ass.rs.next() ){
    title_=ass.rs.getString("problemtxt").trim();
    elaat_=ass.rs.getString("elaat").trim();
    vazn_=ass.rs.getDouble("vazn");
    vazn_=Math.rint(vazn_*100);
    data =data+ ":" +elaat_+":"+String.valueOf(vazn_);
   }
   out.print(data);
}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.rs!=null) ass.rs.close();
   if(ass.rs1!=null) ass.rs1.close();
   if(ass.con!=null) ass.con.close();
   if(ass.con1!=null) ass.con1.close();
}
%>
