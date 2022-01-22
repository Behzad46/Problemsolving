<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import= " java.sql.*"%>
<%@page import= " java.util.concurrent.Callable"%>
<%@page import= " javax.sql.rowset.JdbcRowSet"%>
<%@page import= " java.util.Locale"%>
<%@page import= " javax.swing.JOptionPane"%>
<%@page import= " java.util.Date"%>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
	margin-right: 17%;
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
header {
	margin-top: 0px;
	margin-left: 13px;
}
</style>
        <meta  content="text/html; charset=UTF-8" >
        <title>Diagnose Issue Causes</title>
        <link rel="shortcut icon" type="image-icon" href="images/1.ico">
        <script type="text/javascript" src="js/loader.js"></script>
<script type="text/javascript">
function select() {
var table = document.getElementById('my_table');
var indx;
    var rows = document.getElementById('my_table').getElementsByTagName('tbody')[0].getElementsByTagName('tr');
    for (i = 0; i < rows.length; i++) {
        rows[i].onmouseover = function() {
            var comrow = table.rows[this.rowIndex];
            comrow.cells[3].childNodes[0].style.backgroundColor="#0273dd";
            comrow.cells[3].childNodes[0].style.color="#ffff00"
            comrow.cells[2].childNodes[0].style.backgroundColor="#0273dd";
            comrow.cells[2].childNodes[0].style.color="#ffff00"
            comrow.cells[1].childNodes[0].style.backgroundColor="#0273dd";
            comrow.cells[1].childNodes[0].style.color="#ffff00"
            comrow.cells[0].childNodes[0].style.backgroundColor="#0273dd";
            comrow.cells[0].childNodes[0].style.color="#ffff00"
            indx=this.rowIndex;
            for(j=0;j<rows.length;j++){
               if(indx!=j){    
                 if((j%2)!=0){
                   color1_="#ffffff";  
                 }else{
                   color1_="#ffffff"; 
                 }
                 var comrow1 = table.rows[j];
                 comrow1.cells[3].childNodes[0].style.backgroundColor=color1_;
                 comrow1.cells[3].childNodes[0].style.color="#000000";
                 comrow1.cells[2].childNodes[0].style.backgroundColor=color1_;
                 comrow1.cells[2].childNodes[0].style.color="#000000";
                 comrow1.cells[1].childNodes[0].style.backgroundColor=color1_;
                 comrow1.cells[1].childNodes[0].style.color="#000000";
                 comrow1.cells[0].childNodes[0].style.backgroundColor=color1_;
                 comrow1.cells[0].childNodes[0].style.color="#000000";
               }
            }
        }
    }
}
</script>
<body onload="validation()">        
    <input type="button" value="Back"  onclick="back()" title="Back" style="position:relative;top:16px;left:2%;width:70px;height:30px">
   <h1 style="position: relative;top:200px">Diagnose Issue Causes</h1>
<section>
<form METHOD="POST" name="datas" action=""  >
        <font Style="position:absolute;top:63px;left:5%;font: 16px Arial;
              color: black;height:22px;width:140px">Issue</font> 
<input type="hidden"  name="strkey" id="strkey" value="0">     
        <font Style="position:absolute;top:118px;left:5%;font: 16px Arial;
              color: black;height:22px;width:138px">Report</font> 
<select id="reports"  onchange="report_telatha()" style='position:absolute;top:141px;left:5%;font:16px arial;width:20%;height:3.5%;'>
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
        <font Style="position:absolute;top:175px;left:5%;;font: 16px Arial;
              color: black;height:22px;width:140px">Management graph</font> 
<select id="reportsg"  onchange="report_telathag()" style='position:absolute;top:196px;left:5%;font:16px arial;width:20%;height:3.5%;'>
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
<div  id="piechart" style="position:relative;top:200;left:-20px;">
</div>
<div id='combo1'>          
</div>    
<a id="Show_table" >
</a>
<a id="Show" >
</a>
<font Style="position:absolute; bottom:1%;left:2%;font: 12px Arial">© 2018 QA Concept</font>
<script LANGUAGE="JavaScript" >
// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
var teatha=[];

document.bgColor="#ECE5B6";
document.getElementById('reports').disabled=true;
document.getElementById('reportsg').disabled=true;
showState1();
show();

function back(){
    var myWindow;
    myWindow=window.location.replace('main_menu.jsp'); 
}

function ini_item(){
   if(document.getElementById('problems').value!="Select ..."){
      findptxt(document.getElementById('problems').value);
   }else{
       document.getElementById("Show_table").innerHTML=null;
       document.getElementById("piechart").innerHTML=null;
       document.getElementById('reports').disabled=true;
       document.getElementById('reportsg').disabled=true;

   }
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

var url= "combo_problems.jsp";
xmlHttp.onreadystatechange = stateChange1;
xmlHttp.open("POST", url, true);
xmlHttp.send(null);
}
function stateChange1(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
    document.getElementById("combo1").innerHTML=xmlHttp.responseText 
}
ini_item();
}

var xmlHttp0;
function showtable(str,str1){
    

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
var url= "table_telathar.jsp";
url += "?strkey=" +str+'&problemtxt='+encodeURIComponent(str1);
xmlHttp0.onreadystatechange = stateChanget;
xmlHttp0.open("GET", url, false);
xmlHttp0.send(null);
}
function stateChanget(){
   document.getElementById("Show_table").innerHTML=xmlHttp0.responseText;
}

var xmlHttp1;
function findptxt(str){
 
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

var url= "find_ptxt.jsp";
url += "?strkeyt=" +str;
xmlHttp1.onreadystatechange = statefind;
xmlHttp1.open("POST", url, true);
xmlHttp1.send(null);
}
function statefind(){
if (xmlHttp1.readyState==4 || xmlHttp1.readyState=="complete"){
var v=xmlHttp1.responseText;
var strar = v.split(":");
document.getElementById("strkey").value=strar[1];
   showtable(document.getElementById('strkey').value,document.getElementById('problems').value);
   showgraph(document.getElementById('strkey').value,document.getElementById('problems').value); 
   document.getElementById("loaders").style.display = "none";
   document.getElementById("myDiv").style.display = "block";

if(document.getElementById("strkey").value!="0"){
   document.getElementById('reports').disabled=false;
   document.getElementById('reportsg').disabled=false;
}
}
}
function report_telatha(){
   for(ii=0;ii<document.getElementById("reports").options.length;ii++){
    if(document.getElementById('reports').selectedIndex==1){
       window.open("report_telatha_xls_e.jsp");
       break;
    }
    if(document.getElementById('reports').selectedIndex==2){
       window.open("report_telatha_e.jsp");
       break;
    }
    if(document.getElementById('reports').selectedIndex==3){
       var url= 'EmailForm.jsp';
       url += '?reportname=' +"/reports/report_telatha_e1.jasper";
       window.open(url);
       break;
    }
   }
    document.getElementById('reports').selectedIndex=0;
}
function report_telathag(){
   for(ii=0;ii<document.getElementById("reportsg").options.length;ii++){
    if(document.getElementById('reportsg').selectedIndex==1){
       window.open("report_telatha_xlsg_e.jsp");
       break;
    }
    if(document.getElementById('reportsg').selectedIndex==2){
       window.open("report_telathag_e.jsp");
       break;
    }
    if(document.getElementById('reportsg').selectedIndex==3){
       var url= 'EmailFormg.jsp';
       url += '?reportname=' +"/reports/report_telathag_e.jasper";
       window.open(url);
       break;
    }
   }
    document.getElementById('reportsg').selectedIndex=0;
}

var xmlHttp3;
function validation(){
    

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

var url= "valid_exit.jsp";
xmlHttp3.onreadystatechange = stateedit;
xmlHttp3.open("POST", url, true);
xmlHttp3.send(null);
}
function stateedit(){
if (xmlHttp3.readyState==4 || xmlHttp3.readyState=="complete"){
var v=xmlHttp3.responseText;
var strar = v.split(":");
if(strar[1]=="1"){
    window.location.replace('index.jsp');
}
}
}
var xmlHttp4;
function showgraph(str,str1){
    

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
var url= "dashboard_detail1.jsp";
url += "?strkey=" +str+'&problemtxt='+str1;
xmlHttp4.onreadystatechange = stateChangett;
xmlHttp4.open("GET", url, false);
xmlHttp4.send(null);
}
function stateChangett(){
var v=xmlHttp4.responseText;
var strar = v.split(":");
telatha=[null];
telatha.pop();
telatha.push(['elaat', 'vazn']);
var i=2;
while(i<=strar.length-1){
 telatha.push([strar[i], eval(strar[i+1])]);
 i=i+2;
}
// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
}
function drawChart() {
      var data = google.visualization.arrayToDataTable(telatha);

  // Optional; add a title and set the width and height of the chart
  var options = {'title':'', 'width':450, 'height':250};

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  chart.draw(data, options);

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
