<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
<%@page import= " java.text.NumberFormat"%>
 <%  
 project.accessories ass=new accessories();    
 Integer tp,te,tr,tok,tnok,radifx;
 tp=0;te=0;tr=0;tok=0;tnok=0;radifx=1;

try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   ass.query = "DELETE FROM rep_rep5 ";
   ass.st = ass.con.prepareStatement(ass.query);
   ass.st.executeUpdate();
   ass.st.close();
   ass.query = "SELECT * FROM vaheds ";
   ass.st = ass.con.prepareStatement(ass.query);
   ass.rs=ass.st.executeQuery();
       while(ass.rs.next()){
           ass.query1 = "SELECT count(*) AS tpx FROM problems WHERE cvahed=? ";
           ass.st1 = ass.con.prepareStatement(ass.query1);
           ass.st1.setInt(1, ass.rs.getInt("radif"));
           ass.rs1=ass.st1.executeQuery();
           if (ass.rs1.next()) {
              tp=ass.rs1.getInt("tpx");
           }
           ass.query1 = "SELECT count(*) AS tex FROM problemwhys WHERE levels<>? AND cvahed=? ";
           ass.st1 = ass.con.prepareStatement(ass.query1);
           ass.st1.setString(1, "");
           ass.st1.setInt(2, ass.rs.getInt("radif"));
           ass.rs1=ass.st1.executeQuery();
           if (ass.rs1.next()) {
              te=ass.rs1.getInt("tex");
           }
           ass.query1 = "SELECT count(*) AS trx FROM rahkar WHERE  cvahed=? ";
           ass.st1 = ass.con.prepareStatement(ass.query1);
           ass.st1.setInt(1, ass.rs.getInt("radif"));
           ass.rs1=ass.st1.executeQuery();
           if (ass.rs1.next()) {
              tr=ass.rs1.getInt("trx");
           }
           ass.query1 = "SELECT count(*) AS tokx FROM rahkar WHERE  cvahed=? AND oknok=? ";
           ass.st1 = ass.con.prepareStatement(ass.query1);
           ass.st1.setInt(1, ass.rs.getInt("radif"));
           ass.st1.setInt(2, 1);
           ass.rs1=ass.st1.executeQuery();
           if (ass.rs1.next()) {
              tok=ass.rs1.getInt("tokx");
           }
           ass.query1 = "SELECT count(*) AS tnokx FROM rahkar WHERE   cvahed=? AND oknok=? ";
           ass.st1 = ass.con.prepareStatement(ass.query1);
           ass.st1.setInt(1, ass.rs.getInt("radif"));
           ass.st1.setInt(2, 0);
           ass.rs1=ass.st1.executeQuery();
           if (ass.rs1.next()) {
              tnok=ass.rs1.getInt("tnokx");
           }
           ass.query1 = "INSERT INTO rep_rep5 (radif,vahed,tproblem,telaat,trahkar,tok,tnok)"
                + " values (?,?,?,?,?,?,?) ";
           ass.st1 = ass.con.prepareStatement(ass.query1);
           ass.st1.setInt(1, radifx);
           ass.st1.setString(2, ass.rs.getString("vahed"));
           ass.st1.setInt(3, tp);
           ass.st1.setInt(4, te);
           ass.st1.setInt(5, tr);
           ass.st1.setInt(6, tok);
           ass.st1.setInt(7, tnok);
           ass.st1.executeUpdate();
           radifx++;
       } 

}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.con!=null) ass.con.close();
}
String vahedx="";
String rdescx="";
Integer tproblemsx;
Integer telaatx;
Integer trahkarx;
Integer tokx;
Integer tnokx;
Statement stmt = null;
%>
<style>
table.a {
    table-layout: auto;
    border:solid thin;
    box-shadow: 4px 4px 3px #000000;
}
   .div{
    cursor: pointer;
    direction: ltr;
    position: relative;
    text-align: center;
    margin: auto;
    margin-left: auto;
    top: 200px;
    overflow:auto;
    height: 450px;
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
<h1>Performance Of Committee</h1>
    <table class="a" id="customers">
 <thead>
    <tr>
      <th>Row</th>
      <th>Committee</th>
      <th>Problems</th>
      <th>Causes</th>
      <th>Solutions</th>
      <th>Approved</th>
      <th>Unconfirmed</th>
    </tr>
</thead>
<tbody>

<%
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   stmt = ass.con.createStatement();  
   ass.rs = stmt.executeQuery("Select * from rep_rep5 ORDER BY radif");  
while( ass.rs.next() ){
    radifx=ass.rs.getInt("radif");
     vahedx=ass.rs.getString("vahed").trim();
     tproblemsx=ass.rs.getInt("tproblem");
     telaatx=ass.rs.getInt("telaat");
     trahkarx=ass.rs.getInt("trahkar");
     tokx=ass.rs.getInt("tok");
     tnokx=ass.rs.getInt("tnok");
%>
<tr >
<td ><%=radifx%></td>
<td ><%=vahedx%></td>
<td ><%=tproblemsx%></td>
<td ><%=telaatx%></td>
<td ><%=trahkarx%></td>
<td ><%=tokx%></td>
<td ><%=tnokx%></td>
</tr>
  <%
}

}
catch(Exception e){
    e.printStackTrace();
}
 finally {
      try {
        ass.rs.close();
        stmt.close();
        ass.con.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    } 

%>
</tbody> 
</table>  

 