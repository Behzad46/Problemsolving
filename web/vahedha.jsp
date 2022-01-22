<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import= " java.sql.*"%>
<%@page import= " java.util.concurrent.Callable"%>
<%@page import= " javax.sql.rowset.JdbcRowSet"%>
<%@page import= " java.util.Locale"%>
<%@page import= " javax.swing.JOptionPane"%>
<%@page import= " java.util.Date"%>
<%@page import= " project.accessories"%>
<%
String comments = (String)session.getAttribute("namev");
    if(null == comments){
     comments = "";
   }   String comment  = request.getParameter("namev");
   if(null != comment){
     comments = comments + comment;
     session.setAttribute("comments", comments);
     response.sendRedirect(request.getContextPath() + "/vahedha.jsp");
     //return;
   }
 %>
    
<html>

<head >
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Definition of Committees</title>
<link rel="shortcut icon" type="image-icon" href="images/1.ico">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>        
<style type="text/css">
body {
        background-color:white;
	background-size: cover;
	background-attachment: fixed;
	font-family: actor;
	font-style: normal;
	font-weight: 400;
	margin: 0;
	height: 100px;
}
.formStyle   {
	width: 20%;
	height: 2em;
}
.formStyled   {
	width: 20%;
	height: 6em;
}
header {
	margin-top: 2px;
	margin-left: 13px;
}
.sections  {
	width: 80%;
	float: left;
	margin-left: 200px;
	margin-top: 45px;
}
.savnew   {
	width: 6%;
	height: 2em;
}
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
    top: 40px;
    overflow:auto;
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

<body onload="validation()">
    
<%!
      
Connection con = null;
Statement st = null;
ResultSet rs = null;
String query,query1;  
String nv1,v1,vd1,r1,hshv;
Integer pg=0;
Integer numbers=0;
Integer numberd=0;
%>   
<%
project.accessories ass=new accessories();
%>
<%
String name_=(String)session.getAttribute("name_"); 
%>
<font style="position: relative;top:300px;font-size: 26px;left: 800px">Definition of Committees</font>
<font Style="position:absolute; top:2%;right: 2%;font: 16px Arial;color: blue">Active User:<%=name_%></font>
<input type="button" value="Back"  onclick="back()" title="Back" style="position:absolute;top:16px;left:2%;width:70px;height:30px">  

<section class="sections">
<form METHOD="POST" name="vahed" action="">
<br>
<input type="text" name="namev" id="name"  class="formStyle"  placeholder="Name of the Committee" > 
<br>
<br>
<textarea type="text" name="vdesc" id="vdesc" class="formStyled"  placeholder="Describtion" ></textarea>  
<br>
<br>
<button class="savnew" onclick="news()">New</button>
    
<br>
<br>
<button class="savnew" onclick="saves()">Save</button>

<input type="hidden" name="hsh" value="">
<input type="hidden" name="radif" value="">   
<input type="hidden" name="nvahed" value="">   

</form>
</section> 
<section>
<%
Integer i=1;
String color_="#ffffff";
String color1_="#ffffff";
String vahedx="";
String vdescx="";
Integer radifx=0;
try{
%>
<div id="div_t" class="div" style=" height: 450px;">
 <table  id="customers">
  <thead>
      <th>Row</th>
      <th>Name of Committee</th>
      <th>Describtion</th>
 </thead>
<tbody>
<%

   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   con = java.sql.DriverManager.getConnection(ass.url, ass.id, ass.pass);
   st=con.createStatement();
   String sql = "SELECT * FROM vaheds ORDER BY radif ";
   rs=st.executeQuery(sql);
while( rs.next() ){
     vahedx=rs.getString("vahed").trim();
     vdescx=rs.getString("vdesc").trim();
     radifx=rs.getInt("radif");
     
%>
<tr>
      <td><%=radifx%></td>
      <td><%=vahedx%></td>
      <td><%=vdescx%></td>
      <input type="hidden" name="rad" value="<%=i%>">
      <input type="hidden" name="vh" value="<%=vahedx%>">
      <input type="hidden" name="vd" value="<%=vdescx%>">
      <input type="hidden" name="rd" value="<%=radifx%>">
</tr>
 <%
   i++;
}

}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(rs!=null) rs.close();
   if(rs!=null) rs.close();
   if(con!=null) con.close();
}
 

%>
</tbody>
</table>  
</div>
</section>
<font Style="position:absolute; bottom:2%;left:2%;">© 2018 QA Concept</font>
 <%
 hshv=request.getParameter("hsh");   
 v1=request.getParameter("namev");
 vd1=request.getParameter("vdesc");
 nv1=request.getParameter("nvahed");
 r1=request.getParameter("radif");
try{ 
if(Integer.parseInt(hshv)==1 && numbers==0){
    numbers=1;
}
} catch (Exception e) {
}
if(v1!=null){
if (numbers==1){
Connection con1 = null;
Statement st1 = null;
ResultSet rs1 = null;
String query,query1; 
try{

   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   con1 = java.sql.DriverManager.getConnection(ass.url, ass.id, ass.pass);
   query = "SELECT count(*) AS radifx FROM vaheds ";
   st1=con1.createStatement();
            rs1=st1.executeQuery(query);
            if (rs1.next()) {
                if (v1.trim()==""||v1.trim()==null) {
                } else {
                    if (r1.trim().equals("") || r1.trim().equals(null)) {
                        query1 = "INSERT INTO vaheds (radif,vahed,vdesc) values (?,?,?) ";
                        PreparedStatement pst = con1.prepareStatement(query1);
                        pst.setInt(1, rs1.getInt("radifx")+1);
                        pst.setString(2, ass.getu_f(v1.trim()));
                        pst.setString(3, ass.getu_f(vd1.trim()));
                        pst.executeUpdate();  
                    } else {
                           query1 = "UPDATE vaheds SET vahed=?,vdesc=? WHERE radif=?";
                           PreparedStatement pst = con1.prepareStatement(query1);
                           pst.setString(1, ass.getu_f(v1.trim()));
                           pst.setString(2, ass.getu_f(vd1.trim()));
                           pst.setInt(3, Integer.parseInt(r1));
                           pst.executeUpdate();
                    }
                }
            } 
            rs1.close();
            st1.close();
            con1.close();
        } catch (Exception e) {
        }
}
}
        %>
<%
 hshv=request.getParameter("hsh");   
 v1=request.getParameter("namev");
 vd1=request.getParameter("vdec");
 r1=request.getParameter("radif");
try{ 
if(Integer.parseInt(hshv)==2 && numberd==0){
    numberd=1;
}
} catch (Exception e) {
}
if(v1!=null ){
if (numberd==1){
Connection con1 = null;
String query1,query2,query3;     

try{

   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   con1 = java.sql.DriverManager.getConnection(ass.url, ass.id, ass.pass);
}catch (Exception e){

}
try{
    if (v1.trim()==""||v1.trim()==null) {
       } else {
         v1=ass.getu_f(v1);
         query2 = "SELECT * FROM passwords WHERE cvahed=?";
         PreparedStatement pst3 = con1.prepareStatement(query2);
         pst3.setInt(1, Integer.parseInt(r1));
         rs=pst3.executeQuery();
         if(!rs.next()){
           query1 = "DELETE FROM vaheds WHERE  radif=?";
           PreparedStatement pst = con1.prepareStatement(query1);
           pst.setInt(1, Integer.parseInt(r1));
           pst.executeUpdate();
           Integer ii=1;
           query2 = "SELECT * FROM vaheds";
           PreparedStatement pst1 = con1.prepareStatement(query2);
           rs=pst1.executeQuery();
           while (rs.next()){
              query3 = "UPDATE vaheds SET radif=? WHERE radif=?";
              PreparedStatement pst2 = con1.prepareStatement(query3);
              pst2.setInt(1, ii);
              pst2.setInt(2, rs.getInt("radif"));
              pst2.executeUpdate();
              ii=ii+1;
           }
         }
    }
    con1.close();
} catch (Exception e) {
}
}    
} 
%> 
 
<script LANGUAGE="JavaScript" >
    div_t = document.getElementById('div_t');
    resolution = screen.width+' x '+screen.height
    //alert('Your resolution is: ' + resolution);

    if (resolution == "1920 x 1080")
    {
        div_t.style.height="450px";
    }
    else
    {
        div_t.style.height="150px";
    }
highlight_row();    
function highlight_row(){
  var table=document.getElementById('customers');
  var cells=table.getElementsByTagName('td');
  for(var i=0;i<cells.length;i++){
      var cell=cells[i];
      cell.onclick=function(){
          var rowId=this.parentNode.rowIndex;
          
          var rowNotSelected=table.getElementsByTagName('tr');
          for (var row=0;row<rowNotSelected.length;row++){
              rowNotSelected[row].style.backgroundColor="";
              rowNotSelected[row].classList.remove('selected');
              
          }
          var rowSelected=table.getElementsByTagName('tr')[rowId];
          rowSelected.style.backgroundColor="yellow";
          rowSelected.className+="selected";
          vahed.namev.value=rowSelected.cells[1].innerHTML;
          vahed.vdesc.value=rowSelected.cells[2].innerHTML;
          vahed.nvahed.value=rowSelected.cells[1].innerHTML;
          vahed.radif.value=rowSelected.cells[0].innerHTML;
          
      }
  }
}
      
document.forms[0].namev.focus()  

function back(){
    var myWindow;
    myWindow=window.location.replace('main_menu.jsp'); 
}

function saves(){
    if(vahed.namev.value!=""){
       vahed.hsh.value="1"; 
       <%numbers=0;%>
                   
    }

}
function delets(){
    if(vahed.namev.value!=""){
       vahed.hsh.value="2";
       <%numberd=0;%>
    }
       
}
function news(){
  vahed.namev.value="";
  vahed.radif.value="";
}
</script>
    </tbody>
    <script>
        var xmlHttp;
function validation(){
    

if(typeof XMLHttpRequest != "undefined"){
xmlHttp= new XMLHttpRequest();
}
else if (window.ActiveXObject){
xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
}
if (xmlHttp==null){
alert ("Browser does not support XMLHTTP Request");
return;
}

var url= "valid_exit.jsp";
xmlHttp.onreadystatechange = stateedit;
xmlHttp.open("POST", url, true);
xmlHttp.send(null);
}
function stateedit(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
var v=xmlHttp.responseText;
var strar = v.split(":");
if(strar[1]=="1"){
    window.location.replace('index.jsp');
}
}
}

    </script>    
</body>
</html>
