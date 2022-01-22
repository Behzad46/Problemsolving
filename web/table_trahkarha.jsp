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
problemtxt=ass.getu_f(problemtxt);
String te;
te=ass.ctelatha_rahkar(cvahed0_, strkey, problemtxt);
Integer  radifx;
String mojrix="";
String rahkarx="";
String code_idx="";
String elaatx="";
Double vaznx;
%>
<style>
   .div{
    cursor: pointer;
    direction: ltr;
    position: relative;
    text-align: center;
    margin: auto;
    margin-left: auto;
    top: 220px;
    overflow:auto;
    height: 350px;
    width: 1000px;
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
      <th>Executer/Actor</th>
      <th>Action Plan/Proposed Action</th>
      <th>Cause</th>
      <th>Cause Row</th>
      <th>Weight</th>
    </tr>
</thead>
<tbody>
<%
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   String sql1 = "SELECT * FROM resultx_rahkar WHERE cvahed=? ORDER BY radif";
   ass.pst=ass.con.prepareStatement(sql1);
   ass.pst.setInt(1, cvahed0_);
   ass.rs=ass.pst.executeQuery();
while( ass.rs.next() ){
     radifx=ass.rs.getInt("radif");
     rahkarx=ass.rs.getString("rahkar").trim();
     mojrix=ass.rs.getString("mojri").trim();
     code_idx=ass.rs.getString("code_id").trim();
     elaatx=ass.rs.getString("elaat").trim();
                    NumberFormat nf=NumberFormat.getNumberInstance();
                    nf.setMinimumFractionDigits(2);
     vaznx=ass.rs.getDouble("vazn");
%>
<tr >
<td ><%=radifx%></td>
<td ><%=mojrix%></td>
<td ><%=rahkarx%></td>
<td ><%=elaatx%></td>
<td ><%=code_idx%></td>
<td ><%=nf.format(ass.rs.getDouble("vazn"))%></td>
</tr>
  <%
}

}
catch(Exception e){
    e.printStackTrace();
}
finally{
   if(ass.rs!=null) ass.rs.close();
   if(ass.con!=null) ass.con.close();
}
%>
</tbody>  
</table>  
</div>
