<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
<%@page import= " java.text.NumberFormat"%>
        <title>Dashboard</title>
        <link rel="shortcut icon" type="image-icon" href="images/1.ico">
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
.sections2  {
	width: 90%;
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
header {
	margin-top: 0px;
	margin-left: 13px;
}
</style>
<body onload="validation()">
<input type="button" value="Back"  onclick="back()" title="Back" style="position:absolute;top:16px;left:43px;width:70px;height:30px">
<section class="sections2">    
<div  id="piechart" style="position:relative;top:80;left:80px;">
</div>
        <font Style="position:absolute;top:75px;left:5%;font: 16px Arial;
              color: black;height:22px;width:140px">Problems</font> 
<div id='combo1'>          
</div>    
<input type="hidden"  name="strkey" id="strkey" value="0">     

<script type="text/javascript" src="js/loader.js"></script>

<script type="text/javascript">
// Load google charts

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
var teatha=[];
showState1();  

function back(){
    var myWindow;
    myWindow=window.location.replace('main_menu.jsp'); 
}

var xmlHttp0;
function showgraph(str,str1){
    

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
var url= "dashboard_detail.jsp";
url += "?strkey=" +str+'&problemtxt='+str1;
xmlHttp0.onreadystatechange = stateChanget;
xmlHttp0.open("GET", url, true);
xmlHttp0.send(null);
}
function stateChanget(){
if (xmlHttp0.readyState==4 || xmlHttp0.readyState=="complete"){
var v=xmlHttp0.responseText;
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
}
function drawChart() {
      var data = google.visualization.arrayToDataTable(telatha);

  // Optional; add a title and set the width and height of the chart
  var options = {'title':document.getElementById('problems').value, 'width':650, 'height':550};

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  chart.draw(data, options);

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

var url= "combo3_problems.jsp";
xmlHttp.onreadystatechange = stateChange1;
xmlHttp.open("GET", url, true);
xmlHttp.send(null);
}
function stateChange1(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
    document.getElementById("combo1").innerHTML=xmlHttp.responseText 
    document.getElementById('problems').selectedIndex=1;
    findptxt(document.getElementById('problems').value);
}
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
xmlHttp1.open("GET", url, true);
xmlHttp1.send(null);
}
function statefind(){
if (xmlHttp1.readyState==4 || xmlHttp1.readyState=="complete"){
var v=xmlHttp1.responseText;
var strar = v.split(":");
document.getElementById("strkey").value=strar[1];
showgraph(document.getElementById('strkey').value,document.getElementById('problems').value);    
}
}

function ini_item(){
  findptxt(document.getElementById('problems').value);
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
</script>
</section>
</body>
</html>
