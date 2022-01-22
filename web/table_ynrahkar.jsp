<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %>
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>

 <%  
project.accessories ass=new accessories();          
String strkey = request.getParameter("strkey"); 
Integer cvahed0_=(Integer)session.getAttribute("cvahed0");   
String color1_="#ffffff";
Integer  radifx,oknokx;
String idx="";
String code_idx="";
String elaatx="";
String rahkarx="";
String namex="";
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
    top: 140px;
    overflow:auto;
    height: 450px;
    width: 1500px;
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
      <th>Select</th>
      <th>User Name</th>
      <th>Action</th>
      <th>Cause</th>
      <th>Cause Row</th>
    </tr>
</thead>
<tbody  onmouseover="select()">

<%
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   String sql1 = "SELECT rahkar.radif,rahkar.id,rahkar.code_id,rahkar.elaat,rahkar.rahkar,rahkar.oknok,passwords.name FROM rahkar"
                    + " INNER JOIN passwords ON rahkar.usern=passwords.username"
                    + " WHERE rahkar.problem_id=? AND rahkar.cvahed=? ORDER BY rahkar.id,rahkar.radif  ";
   ass.pst=ass.con.prepareStatement(sql1);
   ass.pst.setString(1, strkey);
   ass.pst.setInt(2, cvahed0_);
   ass.rs=ass.pst.executeQuery();
while( ass.rs.next() ){
     radifx=ass.rs.getInt("radif");
     idx=ass.rs.getString("id").trim();
     code_idx=ass.rs.getString("code_id").trim();
     elaatx=ass.rs.getString("elaat").trim();
     rahkarx=ass.rs.getString("rahkar").trim();
     namex=ass.rs.getString("name").trim();
     oknokx=ass.rs.getInt("oknok");
%>
<tr>
<%
if(oknokx==1){
%>    
<td ><input name="oknok_" id="oknok_"  type="checkbox" value="<%=oknokx%>" checked="true"></td>
<%
}else{
%>    
<td ><input name="oknok_" id="oknok_"  type="checkbox" value="<%=oknokx%>"  ></td>
<%
}
%>    
<td><%=namex%></td>
<td><%=rahkarx%></td>
<td><%=elaatx%></td>
<td><%=code_idx%></td>
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
