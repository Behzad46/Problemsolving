<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import= " java.sql.*"%>
<%@page import= " java.util.concurrent.Callable"%>
<%@page import= " javax.sql.rowset.JdbcRowSet"%>
<%@page import= " java.util.Locale"%>
<%@page import= " javax.swing.JOptionPane"%>
<%@page import= " java.util.Date"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Performance Of Committee</title>
<link rel="shortcut icon" type="image-icon" href="images/1.ico">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
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
h1 {
	font-family: alfa-slab-one;
	font-style: normal;
	font-weight: 400;
	font-size: 1.5em;
	text-align: center;
	height: 1em;
}
h2 {
	font-family: alfa-slab-one;
	font-style: normal;
	font-weight: 400;
	font-size: 1.5em;
	text-align: center;
}
footer {
	font-size: small;
	text-align: center;
	clear: both;
	position: fixed;
	left: 0px;
	bottom: 0px;
	height: 84px;
	width: 100%;
	padding-top: 60px;
        color: green;
}

.asideLeft  {
	width: 28%;
	float: left;
	margin-right: 1%;
	margin-left: 5%;
	margin-top: 30px;
	background-image: -webkit-linear-gradient(270deg,rgba(255,255,255,1.00) 0%,rgba(253,253,253,0.88) 100%);
	background-image: -moz-linear-gradient(270deg,rgba(255,255,255,1.00) 0%,rgba(253,253,253,0.88) 100%);
	background-image: -o-linear-gradient(270deg,rgba(255,255,255,1.00) 0%,rgba(253,253,253,0.88) 100%);
	background-image: linear-gradient(180deg,rgba(255,255,255,1.00) 0%,rgba(253,253,253,0.88) 100%);
}
header {
	margin-top: 70px;
	margin-left: 506px;
}
nav {
	background-color: #EEEEEE;
	
}

.nav1 {
	background-color: #EEEEEE;
	width: 500px;
}

.nav2 {
	background-color: #EEEEEE;
	width: 700px;
}

.navList {
	margin: 0px;
	padding: 0px;
	list-style-type: none;
	overflow: hidden;
}
.navListitem {

	/*float: left;*/
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
.formStyle   {
	width: 100%;
}
.sections2  {
	width: 60%;
        height: 150%;
	float: right;
	margin-right:auto;
	margin-left:auto;
	padding-right: 30%;
	padding-top: 10%;
	background-image: -webkit-linear-gradient(270deg,rgba(255,255,255,1.00) 25.39%,rgba(251,251,251,0.37) 100%);
	background-image: -moz-linear-gradient(270deg,rgba(255,255,255,1.00) 25.39%,rgba(251,251,251,0.37) 100%);
	background-image: -o-linear-gradient(270deg,rgba(255,255,255,1.00) 25.39%,rgba(251,251,251,0.37) 100%);
	background-image: linear-gradient(180deg,rgba(255,255,255,1.00) 25.39%,rgba(251,251,251,0.37) 100%);
	border-top-right-radius: 25px;
}
.reports {
	width: 36%;
	margin-left: 0px;
	margin-top: -39px;
	height: 2em;
}
</style>
</head>
<body style="padding-top: 15px" onload="validation()">
<input type="button" value="Back"  onclick="back()" title="Back" style="position:relative;top:0px;left:2%;width:70px;height:30px">
<section  class="sections2">
  <form id="form1" name="form1" method="post">
        <font Style="position:absolute;top:108px;left:5%;font: 16px Arial;
              color: black;height:22px;width:128px">Report</font> 
<select id="reports"  onchange="rep_rep5()" style='position:absolute;top:128px;left:5%;font:16px arial;width:20%;height:3.5%;'>
    <option>
        Select...
    </option>
    <option>
        Excel
    </option>
    <option>
        Pdf
    </option>
    <option>
        E-mail
    </option>
</select>    
        <font Style="position:absolute;top:178px;left:5%;font: 16px Arial;
              color: black;height:22px;width:148px">Management graph</font> 
<select id="reportsg"  onchange="rep_rep5g()" style='position:absolute;top:198px;left:5%;font:16px arial;width:20%;height:3.5%;'>
    <option>
        Select...
    </option>
    <option>
        Excel
    </option>
    <option>
        Pdf
    </option>
    <option>
        E-mail
    </option>
</select>    
 <a id="Show_table" >
</a>
  
  </form>
  
</section>
<font Style="position:absolute; bottom:2%;left:2%;font: 12px Arial">© 2018 QA Concept</font>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.js"></script>
<script LANGUAGE="JavaScript" >

function back(){
    var myWindow;
    myWindow=window.location.replace('main_menu.jsp'); 
}

var xmlHttp0;
function crep_rep5(){
    

if(typeof XMLHttpRequest != "undefined"){
xmlHttp0= new XMLHttpRequest();
}
else if (window.ActiveXObject){
xmlHttp0= new ActiveXObject("Microsoft.XMLHTTP");
}
if (xmlHttp0==null){
alert ("Browser does not support XMLHTTP Request");
return;
}
var url= "table_rep5.jsp";
xmlHttp0.open("GET", url, true);
xmlHttp0.onreadystatechange = stateChanget;
xmlHttp0.send(null);
}
function stateChanget(){
if (xmlHttp0.readyState==4 || xmlHttp0.readyState=="complete"){
   document.getElementById("Show_table").innerHTML=xmlHttp0.responseText;
}
}
crep_rep5();
function rep_rep5(){
   for(ii=0;ii<document.getElementById("reports").options.length;ii++){
    if(document.getElementById('reports').selectedIndex==1){
       window.open("report_rep5_xls_e.jsp");
       break;
    }
    if(document.getElementById('reports').selectedIndex==2){
       window.open("report_rep5_e.jsp");
       break;
    }
    if(document.getElementById('reports').selectedIndex==3){
       var url= 'EmailForm.jsp';
       url += '?reportname=' +"/reports/report_rep5_e.jasper";
       window.open(url);
       break;
    }
   }
    document.getElementById('reports').selectedIndex=0;
}
function rep_rep5g(){
   for(ii=0;ii<document.getElementById("reportsg").options.length;ii++){
    if(document.getElementById('reportsg').selectedIndex==1){
       window.open("report_rep5_xlsg_e.jsp");
       break;
    }
    if(document.getElementById('reportsg').selectedIndex==2){
       window.open("report_rep5g_e.jsp");
       break;
    }
    if(document.getElementById('reportsg').selectedIndex==3){
       var url= 'EmailFormg.jsp';
       url += '?reportname=' +"/reports/report_rep5g_e.jasper";
       window.open(url);
       break;
    }
   }
    document.getElementById('reportsg').selectedIndex=0;
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
