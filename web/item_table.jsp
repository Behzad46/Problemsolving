<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " javax.swing.JOptionPane"%>
<%@page import= " project.accessories"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<!--The following script tag downloads a font from the Adobe Edge Web Fonts server for use within the web page. We recommend that you do not modify it.-->
<script>var __adobewebfontsappname__="dreamweaver"</script>
<script src="http://use.edgefonts.net/actor:n4:default;alfa-slab-one:n4:default.js" type="text/javascript"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<style>
 .div{
    cursor: pointer;
    direction: ltr;
    position: relative;
    text-align: center;
    margin: auto;
    margin-left: auto;
    overflow:auto;
    height: 450px;
    width: 700px;
    border:solid thin;
    box-shadow: 4px 4px 3px #000000;
    top:-130px;
    left:5%;
   }
  #customers {
    font-family: Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
  }
  
  #customers td, #customers th {
    border: 1px solid #ddd;
    padding: 5px;
    color: black;
    text-align: center;
  }
  
  #customers tr:nth-child(even){background-color: #f2f2f2;}
  
  #customers tr:hover {background-color: #ddd;}
  
  #customers th {
    text-align: center;
    background-color: #437044;
    height: 40px;
    color: white;
    position: sticky;
    top:0;
  }

</style>
 <%  
String val = request.getParameter("val1");       
String perno1=request.getParameter("perno1");
String name1=request.getParameter("name1");
String family1=request.getParameter("family1");
project.accessories ass=new accessories();
name1=ass.getu_f(name1);
family1=ass.getu_f(family1);
Long  pernox;
String namesx="";
String familyx="";
String ghesmatx="";
%>
<div class="div" >
 <table  id="customers">
  <thead>
      <th>Personal ID</th>
      <th>First Name</th>
      <th>Last Name</th>
      <th>Organization</th>
 </thead>
<tbody onmouseover="select()">

<%
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   if(val==null ||val=="" ){
      Statement stmt = ass.con.createStatement();  
      ass.rs = stmt.executeQuery("SELECT * FROM person ORDER BY perno");  
   }else{
   if(Integer.parseInt(val)==1 ){
      String sql1 = "SELECT * FROM person WHERE perno LIKE ? ORDER BY perno";
      ass.pst=ass.con.prepareStatement(sql1);
      ass.pst.setString(1, "%"+perno1+"%");
      ass.rs=ass.pst.executeQuery();
   }
   if(Integer.parseInt(val)==2 ){
      String sql1 = "SELECT * FROM person WHERE names LIKE ? ORDER BY perno";
      ass.pst=ass.con.prepareStatement(sql1);
      ass.pst.setString(1, "%"+name1+"%");
      ass.rs=ass.pst.executeQuery();
   }
   if(Integer.parseInt(val)==3 ){
      String sql1 = "SELECT * FROM person WHERE family LIKE ? ORDER BY perno";
      ass.pst=ass.con.prepareStatement(sql1);
      ass.pst.setString(1, "%"+family1+"%");
      ass.rs=ass.pst.executeQuery();
   }
   }
while( ass.rs.next() ){
     pernox=ass.rs.getLong("perno");
     namesx=ass.rs.getString("names").trim();
     familyx=ass.rs.getString("family").trim();
     ghesmatx=ass.rs.getString("ghesmat").trim();
%>
<tr>
<td><%=pernox%></td>
<td ><%=namesx%></td>
<td ><%=familyx%></td>
<td ><%=ghesmatx%></td>
</tr>
  <%
}

}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.rs!=null) ass.rs.close();
   if(ass.con!=null) ass.con.close();
}

%>
</tbody>
 
</table>  
</div>
