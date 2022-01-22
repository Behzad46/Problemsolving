<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %>
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>

 <%  
project.accessories ass=new accessories();       
Integer  radifx;
String fnamex="";
String lnamex="";
String emailx="";
%>
<style>
    .div{
    cursor: pointer;
    direction: ltr;
    position: relative;
    text-align: center;
    margin: auto;
    margin-left: auto;
    top: 40px;
    overflow:auto;
    height: 450px;
    width: 1000px;
    border:solid thin;
    box-shadow: 4px 4px 3px #000000;
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
<div class="div">          
 <table  id="customers">
  <thead>
    <tr>
      <th >Row</th>
      <th >First Name</th>
      <th >Last Name</th>
      <th >Email Address</th>
    </tr>
 </thead>
<tbody onmouseover="select()">
<%
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   String sql1  = "SELECT * FROM helperlist ORDER BY radif";
   ass.pst=ass.con.prepareStatement(sql1);
   ass.rs=ass.pst.executeQuery();
while( ass.rs.next() ){
     radifx=ass.rs.getInt("radif");
     fnamex=ass.rs.getString("firstname").trim();
     lnamex=ass.rs.getString("lastname").trim();
     emailx=ass.rs.getString("email").trim();
%>
<tr >
<td ><%=radifx%></td>
<td ><%=fnamex%></td>
<td><%=lnamex%></td>
<td ><%=emailx%></td>
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
