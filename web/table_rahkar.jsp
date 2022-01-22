<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %>
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>

 <%  
project.accessories ass=new accessories();       
String strkey = request.getParameter("strkey");   
Integer  radifx;
String rahkarx="";
String rdescx="";
String namex="";
%>
<style>
   .div{
    cursor: pointer;
    direction: ltr;
    position: relative;
    text-align: center;
    margin: auto;
    margin-left: auto;
    top: 100px;
    overflow:auto;
    height: 450px;
    width: 800px;
    border:solid thin;
    box-shadow: 4px 4px 3px #000000;
   }
  #customers {
    font-family: Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
  }
  
  #customers td, #customers th {
    border: 1px solid #ddd;
    padding: 7px;
    text-align: center;
  }
  
  #customers tr:nth-child(even){background-color: #f2f2f2;}
  
  #customers tr:hover {background-color: #ddd;}
  
  #customers th {
    text-align: center;
    background-color: #437044;
    color: white;
    position: sticky;
    height: 40px;
    top:0;
  }

</style>
<div class="div">
 <table id="customers">
 <thead>
    <tr>
      <th>Row</th>
      <th>User Name</th>
      <th>Action</th>
      <th>Describtion</th>
    </tr>
</thead>
<tbody onmouseover="select()">
<%
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   String sql1  = "SELECT rahkar.radif,rahkar.rahkar,rahkar.rdesc,passwords.name FROM rahkar"
                                + " INNER JOIN passwords ON rahkar.usern=passwords.username"
                                + " WHERE rahkar.id=? ORDER BY rahkar.radif ";
   ass.pst=ass.con.prepareStatement(sql1);
   ass.pst.setString(1, strkey);
   ass.rs=ass.pst.executeQuery();
while( ass.rs.next() ){
     radifx=ass.rs.getInt("radif");
     rahkarx=ass.rs.getString("rahkar").trim();
     rdescx=ass.rs.getString("rdesc").trim();
     namex=ass.rs.getString("name").trim();
%>
<tr  >
<td><%=radifx%></td>
<td><%=namex%></td>
<td><%=rahkarx%></td>
<td><%=rdescx%></td>
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
