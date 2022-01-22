<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
<%@page import= " java.text.NumberFormat"%>
 <%  
 project.accessories ass=new accessories();               
 Integer cvahed0_=(Integer)session.getAttribute("cvahed0");   
 String strkey = request.getParameter("strkey"); 
 String problemtxt = request.getParameter("problemtxt"); 
 problemtxt=ass.getu_f(problemtxt);
 Integer radif;

try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
       ass.query = "DELETE FROM rep_rahkarha  WHERE cvahed=?";
       ass.st = ass.con.prepareStatement(ass.query);
       ass.st.setInt(1, cvahed0_);
       ass.st.executeUpdate();
       ass.st.close();
       ass.query = "SELECT * FROM rahkar WHERE  cvahed=? AND problem_id=? ORDER BY id";
       ass.st = ass.con.prepareStatement(ass.query);
       ass.st.setInt(1, cvahed0_);
       ass.st.setString(2, strkey);
       ass.rs=ass.st.executeQuery();
       radif=1;
       while(ass.rs.next()){
           ass.query1 = "INSERT INTO rep_rahkarha (radif,cvahed,elaat,rahkar,rdesc,oknok,code_id,problem_id,problemtxt,text_oknok)"
                  + " values (?,?,?,?,?,?,?,?,?,?) ";
           ass.st1 = ass.con.prepareStatement(ass.query1);
           if (ass.rs.getInt("oknok")==1) {
              ass.st1.setInt(1, radif);
              ass.st1.setInt(2, cvahed0_);
              ass.st1.setString(3, ass.rs.getString("elaat"));
              ass.st1.setString(4, ass.rs.getString("rahkar"));
              ass.st1.setString(5, ass.rs.getString("rdesc"));
              ass.st1.setInt(6, ass.rs.getInt("oknok"));
              ass.st1.setString(7, ass.rs.getString("code_id"));
              ass.st1.setString(8, ass.rs.getString("id"));
              ass.st1.setString(9, problemtxt);
              ass.st1.setString(10, "Ok");
              ass.st1.executeUpdate();
           } else {
              ass.st1.setInt(1, radif);
              ass.st1.setInt(2, cvahed0_);
              ass.st1.setString(3, ass.rs.getString("elaat"));
              ass.st1.setString(4, ass.rs.getString("rahkar"));
              ass.st1.setString(5, ass.rs.getString("rdesc"));
              ass.st1.setInt(6, ass.rs.getInt("oknok"));
              ass.st1.setString(7, ass.rs.getString("code_id"));
              ass.st1.setString(8, ass.rs.getString("id"));
              ass.st1.setString(9, problemtxt);
              ass.st1.setString(10, "Not ok");
              ass.st1.executeUpdate();
           }
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
String rahkarx="";
String rdescx="";
String code_idx="";
String elaatx="";
String oknokx="";
%>
<style>
table.a {
    table-layout: auto;
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<h1>Strategic Measures</h1>
 <table class="a" id="customers">
  <thead>
      <th>Row</th>
      <th>Action</th>
      <th>Description</th>
      <th>Cause</th>
      <th>Cause Row</th>
      <th>Ok/Not</th>
 </thead>
<tbody>

<%
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   String sql1 = "SELECT * from rep_rahkarha WHERE cvahed=? ORDER BY radif";
   ass.pst=ass.con.prepareStatement(sql1);
   ass.pst.setInt(1, cvahed0_);
   ass.rs=ass.pst.executeQuery();
while( ass.rs.next() ){
     radifx=ass.rs.getInt("radif");
     rahkarx=ass.rs.getString("rahkar").trim();
     rdescx=ass.rs.getString("rdesc").trim();
     code_idx=ass.rs.getString("code_id").trim();
     elaatx=ass.rs.getString("elaat").trim();
     oknokx=ass.rs.getString("text_oknok").trim();
%>
<tr>
<td ><%=radifx%></td>
<td ><%=rahkarx%></td>
<td ><%=rdescx%></td>
<td ><%=elaatx%></td>
<td ><%=code_idx%></td>
<td ><%=oknokx%></td>
</tr>
  <%
   if((i%2)!=0){
      color1_="#ffffff"; 
   }else{
      color1_="#ffffff";  
   }
   i++;
}

}
catch(Exception e){
    e.printStackTrace();
}
 finally {
      try {
        ass.rs.close();
        ass.pst.close();
        ass.con.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    } 
%>
</tbody> 
</table>  
 
