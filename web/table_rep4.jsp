<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>

 <%  
project.accessories ass=new accessories();          
String dates_ = request.getParameter("dates_"); 
String datee_ = request.getParameter("datee_"); 
String cvahed_ = request.getParameter("cvahed_");
 Integer radif;
 String vd="";
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   ass.query = "SELECT * FROM vaheds WHERE  radif=? ";
   ass.st = ass.con.prepareStatement(ass.query);
   ass.st.setInt(1, Integer.parseInt(cvahed_));
   ass.rs1=ass.st.executeQuery();
   if(ass.rs1.next()){
       vd=ass.rs1.getString("vahed");
   }
   ass.query = "DELETE FROM rep_rep4 WHERE  cvahed=?";
   ass.st=ass.con.prepareStatement(ass.query);                      
   ass.st.setInt(1, Integer.parseInt(cvahed_));
   ass.st.executeUpdate();
   ass.query = "SELECT * FROM problems WHERE  cvahed=? AND (LTRIM(rtrim(dates))=? OR LTRIM(rtrim(dates))>? ) AND (LTRIM(rtrim(dates))=? OR LTRIM(rtrim(dates))<? ) ";
   ass.st = ass.con.prepareStatement(ass.query);
   ass.st.setInt(1, Integer.parseInt(cvahed_));
   ass.st.setString(2, dates_.trim());
   ass.st.setString(3, dates_.trim());
   ass.st.setString(4, datee_.trim());
   ass.st.setString(5, datee_.trim());
   ass.rs1=ass.st.executeQuery();
   radif=1;
   while (ass.rs1.next()) {
       ass.query1 = "INSERT INTO rep_rep4 (radif,problemtxt,dates,datee,vahed,cvahed)"
            + " values (?,?,?,?,?,?) ";
       ass.st1 = ass.con.prepareStatement(ass.query1);
       ass.st1.setInt(1, radif);
       ass.st1.setString(2, ass.rs1.getString("problemtxt"));
       ass.st1.setString(3, ass.rs1.getString("dates"));
       ass.st1.setString(4, ass.rs1.getString("datee"));
       ass.st1.setString(5, vd);
       ass.st1.setInt(6, Integer.parseInt(cvahed_));
       ass.st1.executeUpdate();
       radif++;
   }
}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.con!=null) ass.con.close();
}
Integer i=1;
String color_="#ffffff";
String color1_="#ffffff";
Integer  radifx;
String datesx="";
String dateex="";
String problemsx="";
Statement stmt = null;
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
      <th>Start Date</th>
      <th>Problems</th>
      <th>End Date</th>
    </tr>
</thead>
<tbody>

<%
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   ass.query = "SELECT * FROM rep_rep4 WHERE  cvahed=? ORDER BY radif ";
   ass.st = ass.con.prepareStatement(ass.query);
   ass.st.setInt(1, Integer.parseInt(cvahed_));
   ass.rs=ass.st.executeQuery();
while( ass.rs.next() ){
     radifx=ass.rs.getInt("radif");
     problemsx=ass.rs.getString("problemtxt");
     datesx=ass.rs.getString("dates");
     dateex=ass.rs.getString("datee");
%>
<tr bgcolor= "<%=color_%>" >
<td ><%=radifx%></td>
<td ><%=datesx%></td>
<td ><%=problemsx%></td>
<td ><%=dateex%></td>
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
        ass.con.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    } 

%>
</tbody> 
</table>  
</div>
