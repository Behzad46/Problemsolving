<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>

 <%  
project.accessories ass=new accessories();          
String dates_ = request.getParameter("dates_"); 
String datee_ = request.getParameter("datee_"); 
String cvahed_ = request.getParameter("cvahed_");
 Integer  ne,nr,nv,radifx;
 ne=0;nr=0;nv=0;radifx=1;
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
   ass.query = "DELETE FROM rep_rep7 WHERE  cvahed=?";
   ass.st=ass.con.prepareStatement(ass.query);                      
   ass.st.setInt(1, Integer.parseInt(cvahed_));
   ass.st.executeUpdate();
   ass.query = "SELECT * FROM passwords WHERE cvahed=? ";
   ass.st = ass.con.prepareStatement(ass.query);
   ass.st.setInt(1, Integer.parseInt(cvahed_));
   ass.rs=ass.st.executeQuery();
   while(ass.rs.next()){
           ass.query1 = "SELECT count(*) AS nex FROM problemwhys WHERE ((LTRIM(rtrim(dates))=? OR LTRIM(rtrim(dates))>? ) AND (LTRIM(rtrim(dates))=? OR LTRIM(rtrim(dates))<? )) "
                                    + "AND cvahed=? AND usern=? AND levels!=?";
           ass.st1 = ass.con.prepareStatement(ass.query1);
           ass.st1.setString(1, dates_.trim());
           ass.st1.setString(2, dates_.trim());
           ass.st1.setString(3, datee_.trim());
           ass.st1.setString(4, datee_.trim());
           ass.st1.setInt(5, Integer.parseInt(cvahed_));
           ass.st1.setString(6, ass.rs.getString("username"));
           ass.st1.setString(7, "");
           ass.rs1=ass.st1.executeQuery();
           if (ass.rs1.next()) {
              ne=ass.rs1.getInt("nex");
           }
           ass.query1 = "SELECT count(*) AS nrx FROM rahkar WHERE ((LTRIM(rtrim(dates))=? OR LTRIM(rtrim(dates))>? ) AND (LTRIM(rtrim(dates))=? OR LTRIM(rtrim(dates))<? )) "
                                    + "AND cvahed=? AND usern=? ";
           ass.st1 = ass.con.prepareStatement(ass.query1);
           ass.st1.setString(1, dates_.trim());
           ass.st1.setString(2, dates_.trim());
           ass.st1.setString(3, datee_.trim());
           ass.st1.setString(4, datee_.trim());
           ass.st1.setInt(5, Integer.parseInt(cvahed_));
           ass.st1.setString(6, ass.rs.getString("username"));
           ass.rs1=ass.st1.executeQuery();
           if (ass.rs1.next()) {
              nr=ass.rs1.getInt("nrx");
           }
           ass.query1 = "SELECT count(*) AS nvx FROM vaznha WHERE ((LTRIM(rtrim(dates))=? OR LTRIM(rtrim(dates))>? ) AND (LTRIM(rtrim(dates))=? OR LTRIM(rtrim(dates))<? )) "
                                    + "AND cvahed=? AND usern=? ";
           ass.st1 = ass.con.prepareStatement(ass.query1);
           ass.st1.setString(1, dates_.trim());
           ass.st1.setString(2, dates_.trim());
           ass.st1.setString(3, datee_.trim());
           ass.st1.setString(4, datee_.trim());
           ass.st1.setInt(5, Integer.parseInt(cvahed_));
           ass.st1.setString(6, ass.rs.getString("username"));
           ass.rs1=ass.st1.executeQuery();
           if (ass.rs1.next()) {
              nv=ass.rs1.getInt("nvx");
           }
           ass.query1 = "INSERT INTO rep_rep7 (radif,vahed,usern,nelat,nrahkar,nvazn,dates,datee,name,family,cvahed)"
                + " values (?,?,?,?,?,?,?,?,?,?,?) ";
           ass.st1 = ass.con.prepareStatement(ass.query1);
           ass.st1.setInt(1, radifx);
           ass.st1.setString(2, vd);
           ass.st1.setString(3, ass.rs.getString("username"));
           ass.st1.setInt(4, ne);
           ass.st1.setInt(5, nr);
           ass.st1.setInt(6, nv);
           ass.st1.setString(7, dates_);
           ass.st1.setString(8, datee_);
           ass.st1.setString(9, ass.rs.getString("name"));
           ass.st1.setString(10, ass.rs.getString("family"));
           ass.st1.setInt(11, Integer.parseInt(cvahed_));
           ass.st1.executeUpdate();
           radifx++;
   } 

}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.con!=null) ass.con.close();
}
String namex="";
Integer solutionsx;
Integer weightsx;
Integer problemsx;
%>
<style>
   .div{
    cursor: pointer;
    direction: ltr;
    position: relative;
    text-align: center;
    margin: auto;
    margin-left: auto;
    top: 260px;
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
      <th>Name</th>
      <th>Problems/Causes</th>
      <th>Solutions</th>
      <th>Weights</th>
    </tr>
</thead>
<tbody>

<%
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   ass.query = "SELECT * FROM rep_rep7 WHERE  cvahed=? ORDER BY radif ";
   ass.st = ass.con.prepareStatement(ass.query);
   ass.st.setInt(1, Integer.parseInt(cvahed_));
   ass.rs=ass.st.executeQuery();
while( ass.rs.next() ){
     radifx=ass.rs.getInt("radif");
     namex=ass.rs.getString("name").trim()+" "+ass.rs.getString("family").trim();
     problemsx=ass.rs.getInt("nelat");
     solutionsx=ass.rs.getInt("nrahkar");
     weightsx=ass.rs.getInt("nvazn");
%>
<tr >
<td ><%=radifx%></td>
<td ><%=namex%></td>
<td ><%=problemsx%></td>
<td ><%=solutionsx%></td>
<td ><%=weightsx%></td>
</tr>
  <%
}

}
catch(Exception e){
    e.printStackTrace();
}
finally{
   ass.rs.close();
   ass.con.close();
}

%>
</tbody>  
</table>  
</div>
