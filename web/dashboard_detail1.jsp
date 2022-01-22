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
//te=ass.ctelatha(cvahed0_, strkey,problemtxt);
String title_="";
String elaat_="";
String data = ":" +"0";
Double vazn_=0.0;
Integer tag=0;
while(true){
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   String sql1 = "SELECT * from resultx WHERE cvahed=? ORDER BY vazn DESC";
   ass.pst=ass.con.prepareStatement(sql1);
   ass.pst.setInt(1, cvahed0_);
   ass.rs=ass.pst.executeQuery();
   while( ass.rs.next() ){
    tag=1;   
    title_=ass.rs.getString("problemtxt").trim();
    elaat_=ass.rs.getString("elaat").trim();
    vazn_=ass.rs.getDouble("vazn");
    vazn_=Math.rint(vazn_*100);
    data =data+ ":" +elaat_+":"+String.valueOf(vazn_);
   }
   out.print(data);
   break;
}

catch(Exception e){
    e.printStackTrace();}
   ass.pst.close(); 
   ass.rs.close();
   ass.con.close();
if(tag==1){
    break;
}   
}
%>
