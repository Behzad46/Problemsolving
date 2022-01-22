
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= " project.accessories"%>
<%@page import= " project.SortArray"%>
<%@ page import= "java.sql.*"%>
<%@page import= " javax.swing.JOptionPane"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Problemlösung beim System-Login</title>
<link rel="shortcut icon" type="image-icon" href="images/1.ico">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
<style type="text/css">
body {
	background-color: white;
}
h2 {
	font-size: 1.5em;
	text-align: center;
        color: green;
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
	width:300px;
        height: 35px;
        color:black;
        font:14pt arial;
}

  #customers {
    font-family: Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
  }
  
  #customers td, #customers th {
    border: 1px solid #ddd;
    padding: 5px;
    color: black;
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

 .div{
    cursor: pointer;
    direction: ltr;
    position: absolute;
    text-align: right;
    margin: auto;
    margin-left: auto;
    overflow:auto;
    height: 250px;
    width: 370px;
    border:solid thin;
    box-shadow: 4px 4px 3px #000000;
    top:24%;
    right: 4%;
   }
   	.blink-bg{
		color: #fff;
		padding: 10px;
		display: inline-block;
		border-radius: 5px;
		animation: blinkingBackground 2s infinite;
	}
	@keyframes blinkingBackground{
		0%		{ background-color: #10c018;}
		25%		{ background-color: #1056c0;}
		50%		{ background-color: #ef0a1a;}
		75%		{ background-color: #254878;}
		100%	        { background-color: #04a1d5;}
	}


</style>

<%
project.accessories ass=new accessories();  
project.SortArray stu=new SortArray();  
String date_;
int ii;
date_=ass.date_milady();

%>    

<body style="padding-top: 130px" onload="validation()" >
<img src="images/qa.png" width="150" height="150" style="position:absolute;top:12px;left:3%;" />
<a href="en.jsp"  Style="position:absolute; top:4%;right:11%;font: 14px Arial" >ENGLISH</a>
<font Style="position:absolute; top:4%;right:4%;font: 14px Arial" >| <%=date_%></font>
<input id="expp" type="hidden" value="aaaaaaa" >
<p id="demo1" Style="position:absolute; top:16%;right:4%;font: 14px Arial;color: green"></p>
<p id="demo0" Style="position:absolute; top:16%;right:4%;font: 14px Arial;color: red"></p>
    <label for="textfield" Style="position:absolute; top:8%;right:4%;font: 14px Arial" >Choose a Expressions:</label>
    <div  id="comboexpr"></div>
    <label for="textfield" Style="position:absolute; top:20%;right:12%;font: 14px Arial" >List of Technology</label>
<div class="div" >
<table id="customers" for="textfield" >
  <thead>
      <th>ID</th>
      <th>Softwares</th>
 </thead>
  <%for (ii=0;ii<=stu.ArrayLength()-1;ii++){%>
<tr>
<td><%=stu.ArrayID(ii)%></td>    
<td><%=stu.ArrayName(ii)%></td>
</tr>
  <%}
  %>
</table>

</div>
  <section>
  <h2>Problemlösung beim System-Login</h2>
  <form id="form1" name="form1" method="post" action="action_index.jsp">
    <font Style="position:absolute;top:30%;left:38%;font:16px bold Arial;color: black;height:22px;width:140px">Benutzername</font> 
    <input  type="text" required class="form-control" name="username" id="login" style="position:absolute;top:34%;left:38%;font:16px Arial;width:25%"> 
    <font Style="position:absolute;top:40%;left:38%;font:16px bold Arial;color: black;height:22px;width:140px">Passwort</font> 
    <input  type="password" required class="form-control" name="password" id="password" style="position:absolute;top:44%;left:38%;font:16px Arial;width:25%"> 
    
    <input  type="submit"  class="formStyle" name="submit" id="submit" value="Anmeldung" style="position:absolute;top:52%;left:38%;font:16px Arial;width:25%"> 
  </form>
  <p id="demo" class="blink-bg" style="background-color: red;color: white;position:absolute;top:60%;left:39%;"></p>
 
</section>
<font Style="position:absolute; bottom:2%;left:2%;font: 12px Arial">© 2018 QA Concept</font>

<script src="js/jquery-1.11.3.min.js"></script>

<script>
 <%
  Boolean demo_;
  demo_=false;
   demo_=(Boolean)session.getAttribute("demo");
 %>
     if (<%=demo_%>){
        document.getElementById("demo").innerHTML = "Invalid Username or Password.Please Try again.";
     }else{
         document.getElementById("demo").innerHTML =null;
     }

showState1();
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

var url= "item_expr.jsp";

xmlHttp.onreadystatechange = stateChange1;
xmlHttp.open("GET", url, false);
xmlHttp.send(null);
//alert("Welcome to My Project!")
//Thread.sleep(1000);
}
function stateChange1(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
    document.getElementById("comboexpr").innerHTML=xmlHttp.responseText  
    

}
}
function ini_items()  {
      show(document.getElementById('exp').value);

}

var xmlHttp4;
function show(str){
 
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

var url= "showexpr.jsp";
url += "?val1=" +str;
xmlHttp4.onreadystatechange = staterecords;
xmlHttp4.open("POST", url, true);
xmlHttp4.send(null);

}
function staterecords(){
if (xmlHttp4.readyState==4 || xmlHttp4.readyState=="complete"){
var v=xmlHttp4.responseText;
var strar = v.split(":");
if (strar[1]=="1"){
  var x = document.getElementById("expp").value=strar[2].trim();
  document.getElementById("demo0").innerHTML = null;    
  document.getElementById("demo1").innerHTML = x;    
}else{
  var x = document.getElementById("expp").value=strar[2].trim();
  document.getElementById("demo1").innerHTML = null;    
  document.getElementById("demo0").innerHTML = x;

}
}
}

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

var url= "validation.jsp";
xmlHttp.open("POST", url, true);
xmlHttp.send(null);
}
</script>
    </body>
</html>
