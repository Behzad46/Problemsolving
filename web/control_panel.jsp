<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import= " java.sql.*"%>
<%@page import= " javax.swing.JOptionPane"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Control Panel</title>
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
.problems {
	width: 86%;
	margin-left: 0px;
	margin-top: -39px;
	height: 2em;
}
.button {
	margin-left: 213px;
	margin-top: -12px;
        width:80px    
}
     
</style>
<link rel="stylesheet" href="css/cssalert1.css">
<body style="padding-top: 70px" onload="validation()">
<input type="button" value="Back"  onclick="back()" title="Back" style="position:absolute;top:20px;left:43px;width:70px;height:30px">
<section  class="sections2">
  <h1>Control Panel</h1>
  <form method="post" name="control" action="" >
    <br>
    <label for="textfield" Style="font: 14px Arial;color: black;height:16px;width:140px">Committee</label>
    <br>
    <input name="nvahed" id="nvahed" type="text" value="" class="formStyle" >
    <br>
    <br>
    <label for="textarea" Style="font: 14px Arial;color: black;height:16px;width:140px">Issue</label>
    <br>
    <div id='combo1'>          
    </div>    
   <input type="hidden" id="myitem"  value="">  
   <br>
   <label for="textarea" Style="font: 14px Arial;color: black;height:16px;width:140px">Describe Issue</label>
    <br>
    <textarea type="text" name="descp" class="formStyle" id="descp" value=""></textarea>
   <br>
   <br>
   <input type="checkbox"  name="select" id="c0" value="" onchange="c0_click()">
   <label for="textfield" Style="font: 14px Arial;color: black;height:16px;width:140px">Enable Permissions</label>
   <br>
   <input type="radio"  name="radio1" id="r1" value="0" onclick="r1_click()">
   <label id="lr1" for="textfield" Style="font: 14px Arial;color: black;height:16px;width:200px">Permission to Enter Causes</label>
   <br>
   <input type="radio"  name="radio1" id="r2" value="0" onclick="r2_click()">
   <label id="lr2" for="textfield" Style="font: 14px Arial;color: black;height:16px;width:200px">Permission to Enter Weights</label>
   <br>  
   <input type="checkbox" name="select" id="c1"  value="" onclick="c1_click()">
   <label for="textfield" Style="font: 14px Arial;color: black;height:16px;width:100px">Active Issue</label>
   <img src="images/info.png" title="The issue is activated by ticking and shown in the problem tree"style="width: 15px;height: 15px"/>
   <br>
   <input type="checkbox" name="select" id="c2"  value="" onclick="c2_click()">
   <label for="textfield" Style="font: 14px Arial;color: black;height:16px;width:100px">Issue Resolved</label>
   <img src="images/info.png" title="The problem has been resolved with ticking and is not shown in the problem tree"style="width: 15px;height: 15px"/>
   <br>
   <input type="button" class="button" name="button" id="button" value="Save" onclick="iu_item()">
   <input type="hidden"  name="input" id="input" value="">  
  </form>
  
</section>
<font Style="position:absolute; bottom:2%;left:2%;font: 12px Arial">© 2018 QA Concept</font>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jsalert.js"></script>

<script  LANGUAGE="JavaScript" >
showState1(); 
document.getElementById("nvahed").disabled=true;
document.getElementById("descp").focus();
function back(){
    var myWindow;
    myWindow=window.location.replace('main_menu.jsp'); 
}
function c0_click(){
   if(document.getElementById("c0").checked==true){
      document.getElementById("c0").value="1"; 
      document.getElementById("r1").disabled=false;
      document.getElementById("lr1").disabled=false;
      document.getElementById("r2").disabled=false;
      document.getElementById("lr2").disabled=false;

   }else{
      document.getElementById("c0").value=""; 
      document.getElementById("r1").disabled=true;
      document.getElementById("lr1").disabled=true;
      document.getElementById("r2").disabled=true;
      document.getElementById("lr2").disabled=true;
   } 
}

function c1_click(){
   if(document.getElementById("c1").checked==true){
      document.getElementById("c1").value="1"; 
   }else{
      document.getElementById("c1").value=""; 
   } 
}
function c2_click(){
   if(document.getElementById("c2").checked==true){
      document.getElementById("c2").value="1"; 
   }else{
      document.getElementById("c2").value=""; 
   } 
}
function r1_click(){
   if(document.getElementById("r1").checked==true){
      document.getElementById("r1").value="1"; 
      document.getElementById("r2").value="0"; 
   } 
}
function r2_click(){
   if(document.getElementById("r2").checked==true){
      document.getElementById("r2").value="1"; 
      document.getElementById("r1").value="0";
   }   
}
function problemstr(strtxt){
        var ixstr="";
          for (i = 0; i < strtxt.length; i++) {
              if (strtxt.substr(i,1)!='-') {
                          ixstr=ixstr+strtxt.substr(i,1);
              } else {
                  break;
              }
             }
             return ixstr;
     }
function ini_item(){
   control.myitem.value=document.getElementById('problem').value;
   showrecordsp(control.myitem.value);
}
function iu_item(){
   insert_update();
   control.myitem.value="";
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

var url= "problem_combo.jsp";
xmlHttp.onreadystatechange = stateChange1;
xmlHttp.open("POST", url, true);
xmlHttp.send(null);
}
function stateChange1(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
    document.getElementById("combo1").innerHTML=xmlHttp.responseText  
   document.getElementById('problem').selectedIndex=0;
   control.myitem.value=document.getElementById('problem').value;
   showrecordsp(control.myitem.value);
}
}

var xmlHttp1;
function showrecordsp(str){
 
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

var url= "showrecordsp.jsp";
url += "?val1=" +str;
xmlHttp1.onreadystatechange = staterecordsp;
xmlHttp1.open("POST", url, true);
xmlHttp1.send(null);

}
function staterecordsp(){
if (xmlHttp1.readyState==4 || xmlHttp1.readyState=="complete"){
var v=xmlHttp1.responseText;
var strar = v.split(":");
   var list1 = document.getElementById('problem');
   for(ii=0;ii<document.getElementById("problem").options.length;ii++){
      if(list1[ii].value==strar[1]){
        document.getElementById('problem').selectedIndex=ii;
        break;
           }
   }
  control.nvahed.value=strar[2];
  control.descp.value=strar[3];
  if(strar[4]==1){
      document.getElementById("c1").checked=true;
      document.getElementById("c1").value="1";
  }else{
      document.getElementById("c1").checked=false;
      document.getElementById("c1").value="";
  }
  if(strar[5]==1){
      document.getElementById("c2").checked=true;
      document.getElementById("c2").value="1";
  }else{
      document.getElementById("c2").checked=false;
      document.getElementById("c2").value="";
  }
  if(strar[6]==1){
      document.getElementById("r1").checked=true;
      document.getElementById("r1").value="1";
  }else{
      document.getElementById("r1").checked=false;
      document.getElementById("r1").value="0";
  }
  if(strar[7]==1){
      document.getElementById("r2").checked=true;
      document.getElementById("r2").value="1";
  }else{
      document.getElementById("r2").checked=false;
      document.getElementById("r2").value="0";
  }
  if(strar[8]==1){
      document.getElementById("c0").checked=true;
      document.getElementById("c0").value="1";
      document.getElementById("r1").disabled=false;
      document.getElementById("lr1").disabled=false;
      document.getElementById("r2").disabled=false;
      document.getElementById("lr2").disabled=false;
  }else{
      document.getElementById("c0").checked=false;
      document.getElementById("c0").value="";
      document.getElementById("r1").disabled=true;
      document.getElementById("lr1").disabled=true;
      document.getElementById("r2").disabled=true;
      document.getElementById("lr2").disabled=true;
  }
  
}
}

function createobject(){
                var request_type;
         if (window.XMLHttpRequest) {
    // code for modern browsers
           request_type = new XMLHttpRequest();
         } else {
    // code for IE6, IE5
           request_type = new ActiveXObject("Microsoft.XMLHTTP");
         }
          return request_type;
}
            var http=createobject();
             var nocache=0;
            function insert_update(){
                //document.getElementById('insert_response').innerHTML="Just a second..."
                var problem1=encodeURI(document.getElementById('problem').value);
                var descp1=encodeURI(document.getElementById('descp').value);
                var c11=encodeURI(document.getElementById('c1').value);
                var c21=encodeURI(document.getElementById('c2').value);
                var r11=encodeURI(document.getElementById('r1').value);
                var r21=encodeURI(document.getElementById('r2').value);
                var c01=encodeURI(document.getElementById('c0').value);
                nocache=Math.random();
                http.open("POST",'saverecordsp_e.jsp?problem1='+problem1+'&descp1='+descp1
                        +'&c11='+c11+'&c21='+c21
                        +'&r11='+r11+'&r21='+r21+'&c01='+c01+'&nocache='+nocache);
                http.send(null);
                swal("The Activated permissions for the Committee are Saved");
}
var xmlHttp2;
function validation(){
    

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

var url= "valid_exit.jsp";
xmlHttp2.onreadystatechange = stateedit;
xmlHttp2.open("POST", url, true);
xmlHttp2.send(null);
}
function stateedit(){
if (xmlHttp2.readyState==4 || xmlHttp2.readyState=="complete"){
var v=xmlHttp2.responseText;
var strar = v.split(":");
if(strar[1]=="1"){
    window.location.replace('index.jsp');
}
}
}
</script>
</body>
</html>
