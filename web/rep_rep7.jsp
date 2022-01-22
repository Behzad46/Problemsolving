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
<title>Providing Solution For Each Committee</title>
<link rel="shortcut icon" type="image-icon" href="images/1.ico">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>        

<style>
/* Center the loaders */
#loaders {
  position: absolute;
  left: 52%;
  top: 50%;
  z-index: 1;
  width: 150px;
  height: 150px;
  margin: -75px 0 0 -75px;
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  width: 120px;
  height: 120px;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
}

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

/* Add animation to "page content" */
.animate-bottom {
  position: relative;
  -webkit-animation-name: animatebottom;
  -webkit-animation-duration: 1s;
  animation-name: animatebottom;
  animation-duration: 1s
}

@-webkit-keyframes animatebottom {
  from { bottom:-100px; opacity:0 } 
  to { bottom:0px; opacity:1 }
}

@keyframes animatebottom { 
  from{ bottom:-100px; opacity:0 } 
  to{ bottom:0; opacity:1 }
}

#myDiv {
  display: none;
  text-align: center;
}
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
</style>
<body onload="validation()">    
<input type="button" value="Back"  onclick="back()" title="Back" style="position:relative;top:16px;left:2%;width:70px;height:30px">
<center style="position: relative;top:240px;font-size: 25px">Providing Solution For Each Committee</center>
<a id="Show_table" >
</a>
<a id="Show" >
</a>
<section>
<form METHOD="get" name="fdata" action=""  >
        <font Style="position:absolute;top:71px;left:2%;font: 16px Arial;
              color: black;height:22px;width:138px">Committee</font> 
        <font Style="position:absolute;top:130px;left:2%;font: 16px Arial;
              color: black;height:22px;width:138px">Issue</font> 
<input type="hidden"  name="strkey" id="strkey" value="">  
<input type="hidden"  id="cvahed" value="">               
<div id='combo1'>          
</div>    
<div id='combo2'>          
</div>    
        <font Style="position:absolute;top:198px;left:2%;font: 16px Arial;
              color: black;height:22px;width:138px">Report</font> 
<select id="reports"  onchange="rep_rep7()" style='position:absolute;top:218px;left:2%;font:16px arial;width:20%;height:3.5%;'>
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
document.bgColor="#ECE5B6";
document.getElementById('reports').disabled=true;

showState1();

function back(){
    var myWindow;
    myWindow=window.location.replace('main_menu.jsp'); 
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

var url= "combo1_vaheds.jsp";
xmlHttp.onreadystatechange = stateChange1;
xmlHttp.open("POST", url, true);
xmlHttp.send(null);
}
function stateChange1(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
    document.getElementById("combo1").innerHTML=xmlHttp.responseText
    var list = document.getElementById('vaheds');
 for(ii=0;ii<document.getElementById("vaheds").options.length;ii++){
        if(list[ii].value==document.getElementById('vaheds').value){
            document.getElementById('vaheds').selectedIndex=ii;
            document.getElementById('cvahed').value=ii;
            break;
        }
            document.getElementById('cvahed').value=1;
 }
 showState2(document.getElementById("cvahed").value);
}
}

var xmlHttp1;
function showState2(str){
    

if(typeof XMLHttpRequest != "undefined"){
xmlHttp1= new XMLHttpRequest();
}
else if (window.ActiveXObject){
xmlHttp1= new ActiveXObject("Microsoft.XMLHTTP");
}
if (xmlHttp1==null){
alert ("Browser does not support XMLHTTP Request");
return;
}
var url= "combo1_problems.jsp";
url += "?cvahed=" +str;
xmlHttp1.onreadystatechange = stateChange2;
xmlHttp1.open("POST", url, true);
xmlHttp1.send(null);
}
function stateChange2(){
if (xmlHttp1.readyState==4 || xmlHttp1.readyState=="complete"){
    document.getElementById("combo2").innerHTML=xmlHttp1.responseText 
}
}

var xmlHttp2;
function findptxt(str){
 
if(typeof XMLHttpRequest != "undefined"){
xmlHttp2= new XMLHttpRequest();
}
else if (window.ActiveXObject){
xmlHttp2= new ActiveXObject("Microsoft.XMLHTTP");
}
if (xmlHttp2==null){
alert ("Browser does not support XMLHTTP Request");
return;
}
var url= "find_ptxt.jsp";
url += "?strkeyt=" +str;
xmlHttp2.onreadystatechange = statefind;
xmlHttp2.open("POST", url, true);
xmlHttp2.send(null);
}
function statefind(){
if (xmlHttp2.readyState==4 || xmlHttp2.readyState=="complete"){
var v=xmlHttp2.responseText;
var strar = v.split(":");
document.getElementById("strkey").value=strar[1];
   show();
crep_trahkarha_rep6(document.getElementById('strkey').value,document.getElementById('problems').value
,document.getElementById('cvahed').value,document.getElementById('vaheds').value);
document.getElementById('reports').disabled=false;
}
}

var xmlHttp3;
function crep_trahkarha_rep6(str,str1,str2,str3){
    

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
var url= "table_rep7.jsp";
url += "?strkey=" +str+'&problemtxt='+str1+'&cvahed='+str2+'&vaheds='+encodeURIComponent(str3);
xmlHttp3.open("POST", url, true);
xmlHttp3.onreadystatechange = stateChanget;
xmlHttp3.send(null);
}
function stateChanget(){
if (xmlHttp3.readyState==4 || xmlHttp3.readyState=="complete"){
   document.getElementById("Show_table").innerHTML=xmlHttp3.responseText;
   document.getElementById("loaders").style.display = "none";
   document.getElementById("myDiv").style.display = "block";
}
}

function ini_problem(){
    var list = document.getElementById('vaheds');
 for(ii=0;ii<document.getElementById("vaheds").options.length;ii++){
        if(list[ii].value==document.getElementById('vaheds').value){
            document.getElementById('vaheds').selectedIndex=ii;
            document.getElementById('cvahed').value=ii;
            break;
        }
            document.getElementById('cvahed').value=1;
 }
  document.getElementById("Show_table").innerHTML=null;
  document.getElementById('reports').disabled=true;
  showState2(document.getElementById("cvahed").value); 
}
function ini_item(){
findptxt(document.getElementById('problems').value);    
}
function rep_rep7(){
   for(ii=0;ii<document.getElementById("reports").options.length;ii++){
    if(document.getElementById('reports').selectedIndex==1){
       var list = document.getElementById('vaheds');
       for(ii=0;ii<document.getElementById("vaheds").options.length;ii++){
        if(list[ii].value==document.getElementById('vaheds').value){
            document.getElementById('vaheds').selectedIndex=ii;
            document.getElementById('cvahed').value=ii;
            break;
        }
            document.getElementById('cvahed').value=1;
       }
       var vds;
       vds=document.getElementById('cvahed').value;
       var strk
       strk=document.getElementById("strkey").value;
       a='report_rep7_xls_e.jsp?vds='+vds+'&strk1='+strk;
       window.open(a);
       break;
    }
    if(document.getElementById('reports').selectedIndex==2){
       var list = document.getElementById('vaheds');
       for(ii=0;ii<document.getElementById("vaheds").options.length;ii++){
        if(list[ii].value==document.getElementById('vaheds').value){
            document.getElementById('vaheds').selectedIndex=ii;
            document.getElementById('cvahed').value=ii;
            break;
        }
            document.getElementById('cvahed').value=1;
       }
       var vds;
       vds=document.getElementById('cvahed').value;
       var strk
       strk=document.getElementById("strkey").value;
       a='report_rep7_e.jsp?vds='+vds+'&strk1='+strk;
       window.open(a);
       break;
    }
    if(document.getElementById('reports').selectedIndex==3){
       var list = document.getElementById('vaheds');
       for(ii=0;ii<document.getElementById("vaheds").options.length;ii++){
        if(list[ii].value==document.getElementById('vaheds').value){
            document.getElementById('vaheds').selectedIndex=ii;
            document.getElementById('cvahed').value=ii;
            break;
        }
            document.getElementById('cvahed').value=1;
       }
       var vds;
       var fn;
       var strk
       strk=document.getElementById("strkey").value;
       vds=document.getElementById('cvahed').value;
       fn="/reports/report_resultx_rahkar1_e.jasper";
       var url= 'EmailForm_rep7.jsp';
       url += '?reportname=' +fn+'&vds1='+vds+'&strk1='+strk;
       window.open(url);
       break;
    }
   }
    document.getElementById('reports').selectedIndex=0;
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
var xmlHttp6;
function show(){
    

if(typeof XMLHttpRequest != "undefined"){
xmlHttp6= new XMLHttpRequest();
}
else if (window.ActiveXObject){
xmlHttp6= new ActiveXObject("Microsoft.XMLHTTP");
}
if (xmlHttp6==null){
alert ("Browser does not support XMLHTTP Request");
return;
}
var url= "loaders.jsp";
xmlHttp6.onreadystatechange = stateShow;
xmlHttp6.open("GET", url, true);
xmlHttp6.send(null);
}
function stateShow(){
   document.getElementById("Show").innerHTML=xmlHttp6.responseText;
}
</script>
</body>
</html>
