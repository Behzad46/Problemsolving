<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import= " java.sql.*"%>
<%@page import= " java.util.concurrent.Callable"%>
<%@page import= " javax.sql.rowset.JdbcRowSet"%>
<%@page import= " java.util.Locale"%>
<%@page import= " javax.swing.JOptionPane"%>
<%@page import= " java.util.Date"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Performance Of Committee Members</title>
        <link rel="shortcut icon" type="image-icon" href="images/1.ico">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>        

<style>
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
	font-weight: 200;
	font-size: 1em;
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
        height: 250%;
	float: right;
	margin-right: 8%;
	margin-top: -17px;
	margin-left: 1%;
	padding-left: 2.5%;
	padding-right: 2.5%;
	padding-top: 2.5%;
	padding-bottom: 2.5%;
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
<body onload="validation()">  
    <input type="button" value="Back"  onclick="back()" title="Back" style="position:relative;top:16px;left:2%;width:70px;height:30px">
    <h1 style="position: relative;top:240px">Performance Of Committee Members</h1>
<a id="Show_table" >
</a>
<section>
<form METHOD="get" name="fdata" action=""  >
<font Style="position:absolute;top:66px;left:5%;font: 16px Arial;
              color: black;height:22px;width:138px">Committee</font> 
        <font Style="position:absolute;top:120px;left:5%;font: 16px Arial;
              color: black;height:22px;width:138px">From date</font> 
    <input type="date" name="dates" 
           id="dates" onchange="set_dates()" 
	style="position:absolute;top:140px;left:5%;font: 16px Arial;
              color: black;height:22px;width:138px;width:20%"> 
        <font Style="position:absolute;top:172px;left:5%;font: 16px Arial;
              color: black;height:22px;width:138px">To date</font> 
    <input type="date" name="datee"
           id="datee" onchange="set_datee()"
	style="position:absolute;top:192px;left:5%;font: 16px Arial;
              color: black;height:22px;width:138px;width:20%"> 
<input type="text"  id="ds" value="" hidden>     
<input type="text"  id="de" value="" hidden>     
<input type="hidden"  id="cvahed" value="">               
<div id='combo1'>          
</div>    
        <font Style="position:absolute;top:218px;left:5%;font: 16px Arial;
              color: black;height:22px;width:138px">Report</font> 
<select id="reports"  onchange="rep_rep6()" style='position:absolute;top:238px;left:5%;font:16px arial;width:20%;height:3.5%;'>
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
        <font Style="position:absolute;top:275px;left:5%;font: 16px Arial;
              color: black;height:22px;width:148px">Management graph</font> 
<select id="reportsg"  onchange="rep_rep6g()" style='position:absolute;top:295px;left:5%;font:16px arial;width:20%;height:3.5%;'>
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
</form>
</section>
<font Style="position:absolute; bottom:2%;left:2%;font: 12px Arial">© 2018 QA Concept</font>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.js"></script>
<script LANGUAGE="JavaScript" >
document.getElementById('reports').disabled=true;
document.getElementById('reportsg').disabled=true;
document.getElementById("ds").value="";
document.getElementById("de").value="";
showState1();
function back(){
    var myWindow;
    myWindow=window.location.replace('main_menu.jsp'); 
}

function ini_vaheds(){
   document.getElementById('dates').value=""; 
   document.getElementById('datee').value=""; 
   document.getElementById('ds').value=""; 
   document.getElementById('de').value=""; 
    document.getElementById("ds").value=fdata.dates.value;
    var list = document.getElementById('vaheds');
    for(ii=0;ii<document.getElementById("vaheds").options.length;ii++){
        if(list[ii].value==document.getElementById('vaheds').value){
            document.getElementById('vaheds').selectedIndex=ii;
            document.getElementById('cvahed').value=ii+1;
            break;
        }
            document.getElementById('cvahed').value=1;
    }
   crep_rep6(document.getElementById("ds").value,document.getElementById("de").value,document.getElementById("cvahed").value);
}

function rep_rep6(){
   for(ii=0;ii<document.getElementById("reports").options.length;ii++){
    if(document.getElementById('reports').selectedIndex==1){
       var list = document.getElementById('vaheds');
       for(ii=0;ii<document.getElementById("vaheds").options.length;ii++){
        if(list[ii].value==document.getElementById('vaheds').value){
            document.getElementById('vaheds').selectedIndex=ii;
            document.getElementById('cvahed').value=ii+1;
            break;
        }
            document.getElementById('cvahed').value=1;
       }
       var vds;
       vds=document.getElementById('cvahed').value;
       a='report_rep6_xls_e.jsp?vds='+vds;
       window.open(a);
       break;
    }
    if(document.getElementById('reports').selectedIndex==2){
       var list = document.getElementById('vaheds');
       for(ii=0;ii<document.getElementById("vaheds").options.length;ii++){
        if(list[ii].value==document.getElementById('vaheds').value){
            document.getElementById('vaheds').selectedIndex=ii;
            document.getElementById('cvahed').value=ii+1;
            break;
        }
            document.getElementById('cvahed').value=1;
       }
       var vds;
       vds=document.getElementById('cvahed').value;
       a='report_rep6_e.jsp?vds='+vds;
       window.open(a);
       break;
    }
    if(document.getElementById('reports').selectedIndex==3){
       var list = document.getElementById('vaheds');
       for(ii=0;ii<document.getElementById("vaheds").options.length;ii++){
        if(list[ii].value==document.getElementById('vaheds').value){
            document.getElementById('vaheds').selectedIndex=ii;
            document.getElementById('cvahed').value=ii+1;
            break;
        }
            document.getElementById('cvahed').value=1;
       }
       var vds;
       var fn;
       vds=document.getElementById('cvahed').value;
       fn="/reports/report_rep6_e.jasper";
       var url= 'EmailForm_rep46.jsp';
       url += '?reportname=' +fn+'&vds='+vds;
       window.open(url);
       break;
    }
   }
    document.getElementById('reports').selectedIndex=0;
}
function rep_rep6g(){
   for(ii=0;ii<document.getElementById("reportsg").options.length;ii++){
    if(document.getElementById('reportsg').selectedIndex==1){
       var list = document.getElementById('vaheds');
       for(ii=0;ii<document.getElementById("vaheds").options.length;ii++){
        if(list[ii].value==document.getElementById('vaheds').value){
            document.getElementById('vaheds').selectedIndex=ii;
            document.getElementById('cvahed').value=ii+1;
            break;
        }
            document.getElementById('cvahed').value=1;
       }
       var vds;
       vds=document.getElementById('cvahed').value;
       a='report_rep6_xlsg_e.jsp?vds='+vds;
       window.open(a);
       break;
    }
    if(document.getElementById('reportsg').selectedIndex==2){
       var list = document.getElementById('vaheds');
       for(ii=0;ii<document.getElementById("vaheds").options.length;ii++){
        if(list[ii].value==document.getElementById('vaheds').value){
            document.getElementById('vaheds').selectedIndex=ii;
            document.getElementById('cvahed').value=ii+1;
            break;
        }
            document.getElementById('cvahed').value=1;
       }
       var vds;
       vds=document.getElementById('cvahed').value;
       a='report_rep6g_e.jsp?vds='+vds;
       window.open(a);
       break;
    }
    if(document.getElementById('reportsg').selectedIndex==3){
       var list = document.getElementById('vaheds');
       for(ii=0;ii<document.getElementById("vaheds").options.length;ii++){
        if(list[ii].value==document.getElementById('vaheds').value){
            document.getElementById('vaheds').selectedIndex=ii;
            document.getElementById('cvahed').value=ii+1;
            break;
        }
            document.getElementById('cvahed').value=1;
       }
       var vds;
       var fn;
       vds=document.getElementById('cvahed').value;
       fn="/reports/report_rep6g_e.jasper";
       var url= 'EmailFormg_rep6.jsp';
       url += '?reportname=' +fn+'&vds='+vds;
       window.open(url);
       break;
    }
   }
    document.getElementById('reportsg').selectedIndex=0;
}

function set_dates(){
    document.getElementById("ds").value=fdata.dates.value;
    var list = document.getElementById('vaheds');
    for(ii=0;ii<document.getElementById("vaheds").options.length;ii++){
        if(list[ii].value==document.getElementById('vaheds').value){
            document.getElementById('vaheds').selectedIndex=ii;
            document.getElementById('cvahed').value=ii+1;
            break;
        }
            document.getElementById('cvahed').value=1;
    }
    crep_rep6(document.getElementById("ds").value,document.getElementById("de").value,document.getElementById("cvahed").value);
  
}
function set_datee(){
    document.getElementById("de").value=fdata.datee.value;
    var list = document.getElementById('vaheds');
    for(ii=0;ii<document.getElementById("vaheds").options.length;ii++){
        if(list[ii].value==document.getElementById('vaheds').value){
            document.getElementById('vaheds').selectedIndex=ii;
            document.getElementById('cvahed').value=ii+1;
            break;
        }
            document.getElementById('cvahed').value=1;
    }
    crep_rep6(document.getElementById("ds").value,document.getElementById("de").value,document.getElementById("cvahed").value);
}

var xmlHttp;
function showState1(){
    

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

var url= "combo_vaheds.jsp";
xmlHttp.onreadystatechange = stateChange1;
xmlHttp.open("GET", url, true);
xmlHttp.send(null);
}
function stateChange1(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
    document.getElementById("combo1").innerHTML=xmlHttp.responseText 
 document.getElementById('reports').disabled=false;
 document.getElementById('reportsg').disabled=false;
}
}

var xmlHttp3;
function crep_rep6(str,str1,str2){
    

if(typeof XMLHttpRequest != "undefined"){
xmlHttp3= new XMLHttpRequest();
}
else if (window.ActiveXObject){
xmlHttp3= new ActiveXObject("Microsoft.XMLHTTP");
}
if (xmlHttp3==null){
alert ("Browser does not support XMLHTTP Request");
return;
}
var url= "table_rep6.jsp";
url += "?dates_=" +str+'&datee_='+str1+'&cvahed_='+str2;
xmlHttp3.open("GET", url, false);
xmlHttp3.onreadystatechange = stateChanget;
xmlHttp3.send(null);
}
function stateChanget(){
if (xmlHttp3.readyState==4 || xmlHttp3.readyState=="complete"){
   document.getElementById("Show_table").innerHTML=xmlHttp3.responseText;
}
}

var xmlHttp4;
function validation(){
    

if(typeof XMLHttpRequest != "undefined"){
xmlHttp4= new XMLHttpRequest();
}
else if (window.ActiveXObject){
xmlHttp4= new ActiveXObject("Microsoft.XMLHTTP");
}
if (xmlHttp4==null){
alert ("Browser does not support XMLHTTP Request");
return;
}

var url= "valid_exit.jsp";
xmlHttp4.onreadystatechange = stateedit;
xmlHttp4.open("POST", url, true);
xmlHttp4.send(null);
}
function stateedit(){
if (xmlHttp4.readyState==4 || xmlHttp4.readyState=="complete"){
var v=xmlHttp4.responseText;
var strar = v.split(":");
if(strar[1]=="1"){
    window.location.replace('index.jsp');
}
}
}

</script>
</body>
</html>
