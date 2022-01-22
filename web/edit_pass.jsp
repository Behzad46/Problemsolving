<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import= " java.sql.*"%>
<%@page import= " java.util.concurrent.Callable"%>
<%@page import= " javax.sql.rowset.JdbcRowSet"%>
<%@page import= " java.util.Locale"%>
<%@page import= " javax.swing.JOptionPane"%>
<%@page import= " java.util.Date"%>
<%@page import= " project.accessories"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Password Change</title>
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
h1 {
	font-family: Arial;
	font-style: normal;
	font-weight: 400;
	font-size: 1.5em;
	text-align: center;
	height: 1em;
}
.formStyle   {
        font:16 Arial;
	width: 100%;
	height: 2em;
        color:black;
}
.sections2  {
	width: 30%;
	float: right;
	margin-right: 35%;
	margin-top: -37px;
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
        border-top-left-radius: 25px;
	border-bottom-left-radius: 25px;
        border-bottom-right-radius: 25px;
}
    
</style>
<link rel="stylesheet" href="css/cssalert1.css">
<body style="padding-top: 70px" onload="validation()">
<input type="button" value="Back"  onclick="back()" title="Back" style="position:absolute;top:16px;left:43px;width:70px;height:30px">
<section  class="sections2">
  <h1>User Password Change </h1>
  <form  name="fdata" method="get" action="">
    <label for="textfield" Style="font: 14px Arial;color: black;height:16px;width:140px" >User Name</label>
    <br>
    <input id="uname"  name="uname" value="" type="text"  class="formStyle" >
    <br>
    <br>
    <label for="textfield" Style="font: 14px Arial;color: black;height:16px;width:140px">Old Pass</label>
    <br>
    <input name="oldpass" id="oldpass" onkeydown="key1()" onchange="oldpass0()" value=""  type="password" class="formStyle" > 
     <br>
     <br>
     <label for="textfield" Style="font: 14px Arial;color: black;height:16px;width:140px">New Pass</label>
     <br>
    <input name="newpass" id="newpass" onkeydown="key2()" value=""  type="password" class="formStyle" > 
     <br>
     <br>
     <label for="textfield" Style="font: 14px Arial;color: black;height:16px;width:140px">Repeat New Pass</label>
     <br>
    <input name="rnewpass" id="rnewpass" onkeydown="key3()" onchange="newpass0()" value=""  type="password" class="formStyle" > 
    <br>
    <br>
    <input type="button" class="formStyle"  name="change" id="change" value="Change Pass" onclick="change_pass()">
    <br>
    <input type="hidden"  name="input" id="input" value="">  
  </form>
  
</section>
<font Style="position:absolute; bottom:2%;left:2%;font: 12px Arial">© 2018 QA Concept</font>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jsalert.js" type="text/javascript"></script>
<%!
String uname_;
%>  
<%
project.accessories ass=new accessories();         
String username0_=(String)session.getAttribute("username0");      
Integer cnaghsh0_=(Integer)session.getAttribute("cnaghsh0");
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
       ass.query = "SELECT * From passwords WHERE username=?";
       ass.st = ass.con.prepareStatement(ass.query);
       ass.st.setString(1, username0_);
       ass.rs=ass.st.executeQuery();
       if (ass.rs.next()) {
           uname_=ass.rs.getString("username").trim();
       }
}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.con!=null) ass.con.close();
}
%>   
<script  LANGUAGE="JavaScript" >
document.getElementById("uname").value="<%=uname_%>";
document.getElementById("uname").disabled=true;
document.getElementById("oldpass").focus();

function back(){
    var myWindow;
    if(<%=cnaghsh0_%>==1 ||<%=cnaghsh0_%>==5){
        myWindow=window.location.replace('main_menu_u.jsp'); 
    }else{
        myWindow=window.location.replace('main_menu.jsp'); 
    }
}
    
function key1(){
   kc=window.event.keyCode;
   if(kc==13){
      document.getElementById("newpass").focus(); 
   }
}
function key2(){
   kc=window.event.keyCode;
   if(kc==13){
      document.getElementById("rnewpass").focus(); 
   }
}
function key3(){
   kc=window.event.keyCode;
   if(kc==13){
    if(document.getElementById("newpass").value!=document.getElementById("rnewpass").value){
       swal("Re-enter the new password");
       document.getElementById("rnewpass").value="";
       document.getElementById("rnewpass").focus();
       return;
    }
    document.getElementById("change").focus(); 
   }
}
function oldpass0(){
    oldpass(document.getElementById("oldpass").value);
}
function newpass0(){
    if(document.getElementById("newpass").value!=document.getElementById("rnewpass").value){
       swal("Re-enter the new password");
       document.getElementById("rnewpass").value="";
       document.getElementById("rnewpass").focus();
    }
    oldpass(document.getElementById("oldpass").value);
}function change_pass(){
    if(document.getElementById("oldpass").value!="" && document.getElementById("newpass").value!="" && document.getElementById("rnewpass").value!=""){
       newpass(document.getElementById("newpass").value);
    }
}

var xmlHttp1;
function oldpass(str){
 
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

var url= "oldpass_src.jsp";
url += "?opass=" +str;
xmlHttp1.onreadystatechange = staterecords;
xmlHttp1.open("GET", url, true);
xmlHttp1.send(null);
}

function staterecords(){
if (xmlHttp1.readyState==4 || xmlHttp1.readyState=="complete"){
var v=xmlHttp1.responseText;
var strar = v.split(":");
if(strar[1]=="1"){
    swal("The password is wrong.");
    document.getElementById("oldpass").value="";
    document.getElementById("oldpass").focus();
}
}
}

var xmlHttp2;
function newpass(str){
 
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

var url= "newpass_upd.jsp";
url += "?npass=" +str;
xmlHttp2.onreadystatechange = staterecordsu;
xmlHttp2.open("GET", url, true);
xmlHttp2.send(null);
}

function staterecordsu(){
if (xmlHttp2.readyState==4 || xmlHttp2.readyState=="complete"){
var v=xmlHttp2.responseText;
var strar = v.split(":");
if(strar[1]=="1" && document.getElementById("oldpass").value!=""){
    swal("The password has been changed");
    window.location.replace('index.jsp');
}
}
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
