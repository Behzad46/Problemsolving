<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import= " project.accessories"%>
<%@page import= " java.sql.*"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Creative Problem Solving</title>
<link rel="shortcut icon" type="image-icon" href="images/1.ico">
</head>
<style type="text/css">
body {margin:0;font-family:Arial}

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.active {
  background-color: #4CAF50;
  color: white;
}

.topnav .icon {
  display: none;
}

.dropdown {
    float: left;
    overflow: hidden;
}

.dropdown .dropbtn {
    font-size: 17px;    
    border: none;
    outline: none;
    color: white;
    padding: 14px 16px;
    background-color: inherit;
    font-family: inherit;
    margin: 0;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    float: none;
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.topnav a:hover, .dropdown:hover .dropbtn {
  background-color: #555;
  color: white;
}

.dropdown-content a:hover {
    background-color: #ddd;
    color: black;
}

.dropdown:hover .dropdown-content {
    display: block;
}

@media screen and (max-width: 600px) {
  .topnav a:not(:first-child), .dropdown .dropbtn {
    display: none;
  }
  .topnav a.icon {
    float: right;
    display: block;
  }
}

@media screen and (max-width: 600px) {
  .topnav.responsive {position: relative;}
  .topnav.responsive .icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a {
    float: none;
    display: block;
    text-align: left;
  }
  .topnav.responsive .dropdown {float: none;}
  .topnav.responsive .dropdown-content {position: relative;}
  .topnav.responsive .dropdown .dropbtn {
    display: block;
    width: 100%;
    text-align: left;
  }
}
h1 {
	font-family: alfa-slab-one;
	font-style: normal;
	font-weight: 400;
	font-size: 1.2em;
	text-align: right;
	height: 1em;
	position: fixed;
	right: 25px;
	top: 0px;
}
.navListitem1 {
	width: 500px;
}
.navListitem2 {
	width: 700px;
}

.navListitem a {
	text-decoration: none;
	display: block;
	padding-top: 14px;
	padding-left: 16px;
	padding-right: 16px;
	padding-bottom: 16px;
	color: #6B6B6B;
}
.navListitem a:hover {
	color: #000000;
	background-color: #358B6C;
}
.navListitem1 a {
	text-decoration: none;
	display: block;
	padding-top: 14px;
	padding-left: 16px;
	padding-right: 16px;
	padding-bottom: 16px;
	color: #6B6B6B;
}
.navListitem1 a:hover {
	color: #000000;
	background-color: #358B6C;
}

.navListitem2 a {
	text-decoration: none;
	display: block;
	padding-top: 14px;
	padding-left: 16px;
	padding-right: 16px;
	padding-bottom: 16px;
	color: #6B6B6B;
}
.navListitem2 a:hover {
	color: #000000;
	background-color: #358B6C;
}


.container-fluid .navbar-header .navbar-brand {
	font-family: alfa-slab-one;
	font-style: normal;
	font-weight: 400;
	color: #558678;
}
</style>
<body style="padding-top: 150px" onload="validation()">
<img src="images/qa.png" width="150" height="150" style="position:absolute;top:8px;left:3%;" />
<%
project.accessories ass=new accessories();                  
String username0_=(String)session.getAttribute("username0"); 
Integer ptree_=(Integer)session.getAttribute("ptree");
Integer rahkar_=(Integer)session.getAttribute("rahkar");
Integer ynrahkar_=(Integer)session.getAttribute("ynrahkar");
Integer tmojri_=(Integer)session.getAttribute("tmojri");
Integer telatha_=(Integer)session.getAttribute("telatha");
Integer padmin_=(Integer)session.getAttribute("padmin");
Integer pvahed_=(Integer)session.getAttribute("pvahed");
Integer ppanel_=(Integer)session.getAttribute("ppanel");
Integer rpt1_=(Integer)session.getAttribute("rpt1");
Integer rpt2_=(Integer)session.getAttribute("rpt2");
Integer rpt3_=(Integer)session.getAttribute("rpt3");
Integer cnaghsh0_=(Integer)session.getAttribute("cnaghsh0"); 
String name_;
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   ass.query = "SELECT * From passwords WHERE username=?";
   ass.st = ass.con.prepareStatement(ass.query);
   ass.st.setString(1, username0_);  
           
   ass.rs1=ass.st.executeQuery();
   if (ass.rs1.next()) {
       if (ass.rs1.getString("code")==""||ass.rs1.getString("code")==null){
          name_="Administrator";
       }else{
          name_=ass.rs1.getString("name")+" "+ass.rs1.getString("family");
       }  
   %>
   <h1>Active User: <%=name_%></h1>
   <%
   session.setAttribute("name_", name_);
   }
}   
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.con!=null) ass.con.close(); 
}
%>
<div class="topnav" id="myTopnav" >
  <a href="#" onclick="dashboard()" class="active">Dashboard</a>
  <div class="dropdown">
    <button class="dropbtn">Definitions 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
   <a href="#" onclick="pvahedha()">Committee</a>
   <a href="#" onclick="pusers()">Users</a>
   <a href="#" onclick="ppanel()">Control Panel</a>
   <a href="#" onclick="helperlist()">Helper List</a>
    </div>
  </div> 
  <div class="dropdown">
    <button class="dropbtn">Operations 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
   <a href="#" onclick="ptress()">Problem Tree</a>
   <a href="#" onclick="rahkar()">Providing Solutions</a> 
   <a href="#" onclick="telatha()">Identifying Main Causes</a>
   <a href="#" onclick="ynrahkar()">Approval Of Proposed Solutions</a>
   <a href="#" onclick="tmojri()">Determining Executor For Approved Solutions</a>
    </div>
  </div> 
  <div class="dropdown">
    <button class="dropbtn">Reports 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
   <a href="#" onclick="rep_rahkarha()">Strategic Measures</a>
   <a href="#" onclick="relatha()">Diagnose Issue Causes</a>
   <a href="#" onclick="rep_rep5()">Performance Of Committee</a>
   <a href="#" onclick="rep_rep4()">Analysed Issues In Committees</a>
   <a href="#" onclick="rep_rep6()">Performance Of Committee Members</a>
   <a href="#" onclick="rep_rep7()">Providing Solution For Each Committee</a>
   <a href="#" onclick="rtelatha_rahkar()">Diagnosis Providing Strategies And Practitioners</a> </li>
    </div>
  </div> 
  <div class="dropdown">
    <button class="dropbtn">System 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
   <a href="#" onclick="edit_pass()">Change Password</a>
   <a href="#" onclick="sos()">SOS</a>
   <a href="#" onclick="about()">About</a>
   <a href="#" onclick="exit()">Exit</a>
    </div>
  </div> 
  <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
</div>

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.js"></script>
<font Style="position:absolute; bottom:2%;left:2%;font: 12px Arial">© 2018 QA Concept</font>
<script>
    
function myFunction() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}
    
function ptress() {
    if ("<%=ptree_%>"==1) {
       //window.open("trees.jsp");
       window.location.replace('trees.jsp');
    } else {
        alert( "You do not have permission.Contact the system administrator.");
    }
}
function rahkar() {
    if ("<%=rahkar_%>"==1) {
       //window.open("rahkarha.jsp");
       window.location.replace('rahkarha.jsp');
    } else {
        alert( "You do not have permission.Contact the system administrator.");
    }
}
function ynrahkar() {
    if ("<%=ynrahkar_%>"==1) {
       //window.open("f_ynrahkarha.jsp");
       window.location.replace('f_ynrahkarha.jsp');
    } else {
        alert( "You do not have permission.Contact the system administrator.");
    }
}
function tmojri() {
    if ("<%=tmojri_%>"==1) {
       //window.open("f_mojri.jsp");
       window.location.replace('f_mojri.jsp');
    } else {
        alert( "You do not have permission.Contact the system administrator.");
    }
}
function telatha() {
    if ("<%=telatha_%>"==1) {
       //window.open("telatha.jsp");
       window.location.replace('telatha.jsp');
    } else {
        alert( "You do not have permission.Contact the system administrator.");
    }
}
function pusers() {
    if ("<%=padmin_%>"==1 || "<%=username0_%>"=="admin") {
        //window.open("ini_pass.jsp");
        window.location.replace('ini_pass.jsp');
    } else {
        alert( "You do not have permission.Contact the system administrator.");
    }
}
function pvahedha() {
    if ("<%=pvahed_%>"==1) {
        //window.open('vahedha.jsp');
        window.location.replace('vahedha.jsp');
    } else {
        alert( "You do not have permission.Contact the system administrator.");
    }
}
function ppanel() {
    if ("<%=ppanel_%>"==1) {
       //window.open("control_panel.jsp");
       window.location.replace('control_panel.jsp');
    } else {
        alert( "You do not have permission.Contact the system administrator.");
    }
}
function helperlist() {
       //window.open("helperlist.jsp");
       window.location.replace('helperlist.jsp');
}
function dashboard() {
    if ("<%=cnaghsh0_%>"==2 ||"<%=cnaghsh0_%>"==3) {
       //window.open("rtelatha.jsp");
       window.location.replace('Dashboard.jsp');
    } else {
        alert( "You do not have permission.Contact the system administrator.");
    }
}
function relatha() {
    if ("<%=cnaghsh0_%>"==2 ||"<%=cnaghsh0_%>"==3) {
       //window.open("rtelatha.jsp");
       window.location.replace('rtelatha.jsp');
    } else {
        alert( "You do not have permission.Contact the system administrator.");
    }
}
function rep_rahkarha() {
    if ("<%=cnaghsh0_%>"==2 ||"<%=cnaghsh0_%>"==3) {
       //window.open("rep_rahkarha.jsp");
       window.location.replace('rep_rahkarha.jsp');
    } else {
        alert( "You do not have permission.Contact the system administrator.");
    }
}
function rtelatha_rahkar() {
    if ("<%=cnaghsh0_%>"==2 ||"<%=cnaghsh0_%>"==3) {
       //window.open("rtelatha_rahkar.jsp");
       window.location.replace('rtelatha_rahkar.jsp');
    } else {
        alert( "You do not have permission.Contact the system administrator.");
    }
}
function rep_rep4() {
    if ("<%=cnaghsh0_%>"==2 ||"<%=cnaghsh0_%>"==3) {
       //window.open("rep_rep4.jsp");
       window.location.replace('rep_rep4.jsp');
    } else {
        alert( "You do not have permission.Contact the system administrator.");
    }
}
function rep_rep5() {
    if ("<%=rpt1_%>"==1) {
       //window.open("rep_rep5.jsp");
       window.location.replace('rep_rep5.jsp');
    } else {
        alert( "You do not have permission.Contact the system administrator.");
    }
}
function rep_rep6() {
    if ("<%=rpt2_%>"==1) {
       //window.open("rep_rep6.jsp");
       window.location.replace('rep_rep6.jsp');
    } else {
        alert( "You do not have permission.Contact the system administrator.");
    }
}
function rep_rep7() {
    if ("<%=rpt3_%>"==1) {
       //window.open("rep_rep7.jsp");
       window.location.replace('rep_rep7.jsp');
    } else {
        alert( "You do not have permission.Contact the system administrator.");
    }
}
function edit_pass() {
    window.location.replace('edit_pass.jsp');
}
function about() {
    window.open('about.jsp');
}
function sos() {
    window.open('EmailForms.jsp');
}
function exit() {
    window.location.replace('index.jsp');
}
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
