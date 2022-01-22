<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Send an e-mail for SOS</title>
<link rel="shortcut icon" type="image-icon" href="images/1.ico">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<style type="text/css">
body {
	background-color: white;
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
	text-align: right;
	height: 1em;
}
h2 {
	font-family: alfa-slab-one;
	font-style: normal;
	font-weight: 400;
	font-size: 1.3em;
	text-align: center;
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
.sectionRight  {
	width: 30%;
	float: right;
	margin-right: 40%;
	margin-top: 10px;
	margin-left: 1%;
	padding-left: 2.5%;
}
header {
	margin-top: 20px;
	margin-left: 100px;
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
        font:12pt arial;
}
.formStylec   {
	width:500px;
        height: 55px;
        color:black;
        font:12pt arial;
        alignment-adjust: text-after-edge;
}
    
</style>
<body>
<section class="sectionRight">
  <h2>Send  E-mail  SOS</h2>
  <form  method="post" action="">
    <label for="textfield" >Sender address</label>
    <br>
    <input  type="email" required class="formStyle" name="sender" id="sender" > 
    <br>
    <label for="textfield">Subject</label>
    <br>
    <input type="text"  class="formStyle" name="subject" id="subject"  > 
    <br>
    <label for="textfield">Content</label>
    <br>
    <textarea type="text"  class="formStylec" name="content" id="content"  ></textarea>
    <br>
    <br>
    <input type="button" name="submit" id="submit" class="formStyle" value="Send" onclick="mail()">
    
  </form>
</section>
<font Style="position:absolute; bottom:2%;left:2%;font: 12px Arial">© 2018 QA Concept</font>
<script src="js/jquery-1.11.3.min.js"></script>
<script>
//function keyd1(){
//  kc=window.event.keyCode;
//  if(kc==13){
//    document.getElementById("content2").focus();  
//  }
//}    
function mail(){
    str1=document.getElementById("sender").value;
    str2=document.getElementById("subject").value;
    str3=document.getElementById("content").value;
   var url= 'mails.jsp';
   url += '?sender=' +str1+'&subject='+str2+'&content='+str3;
   window.open(url);
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
</body>
</html>
