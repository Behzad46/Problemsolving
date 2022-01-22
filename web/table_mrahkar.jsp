<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>

 <%  
project.accessories ass=new accessories();            
String strkey = request.getParameter("strkey"); 
Integer cvahed0_=(Integer)session.getAttribute("cvahed0"); 
Integer  radifx;
String idx="";
String elaatx="";
String rahkarx="";
String mojrix="";
%>
<style>
    textarea {
  resize: none;
}

 .div{
    cursor: pointer;
    direction: ltr;
    position: relative;
    text-align: center;
    margin: auto;
    margin-left: auto;
    overflow:auto;
    height: 450px;
    width: 800px;
    border:solid thin;
    box-shadow: 4px 4px 3px #000000;
    top:30px;
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

<div class="div" >
 <table  id="customers">
  <thead>
      <th>Actor</th>
      <th>Action</th>
      <th>Cause</th>
 </thead>
<tbody onmouseover="select()">

<%
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   String sql1 = "SELECT * From rahkar WHERE problem_id=? AND cvahed=? AND oknok=? ORDER BY id,radif  ";
   ass.pst=ass.con.prepareStatement(sql1);
   ass.pst.setString(1, strkey);
   ass.pst.setInt(2, cvahed0_);
   ass.pst.setInt(3, 1);
   ass.rs=ass.pst.executeQuery();
while( ass.rs.next() ){
     radifx=ass.rs.getInt("radif");
     idx=ass.rs.getString("id").trim();
     elaatx=ass.rs.getString("elaat").trim();
     rahkarx=ass.rs.getString("rahkar").trim();
     mojrix=ass.rs.getString("mojri").trim();
%>
<tr>
<td><%=mojrix%></td>
<td><%=rahkarx%></td>
<td><%=elaatx%></td>
<td style="display: none;"><%=idx%></td>
<td style="display:none;"><%=radifx%></td>
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
