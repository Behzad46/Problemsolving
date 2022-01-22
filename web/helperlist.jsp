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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Helper List</title>
        <link rel="shortcut icon" type="image-icon" href="images/1.ico">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>        
<script type="text/javascript">
function select() {
  var table=document.getElementById('customers');
  var cells=table.getElementsByTagName('td');
  for(var i=0;i<cells.length;i++){
      var cell=cells[i];
      cell.onclick=function(){
          var rowId=this.parentNode.rowIndex;
          
          var rowNotSelected=table.getElementsByTagName('tr');
          for (var row=0;row<rowNotSelected.length;row++){
              rowNotSelected[row].style.backgroundColor="";
              rowNotSelected[row].classList.remove('selected');
              
          }
          var rowSelected=table.getElementsByTagName('tr')[rowId];
          rowSelected.style.backgroundColor="yellow";
          rowSelected.className+="selected";
            datas.radif.value=rowSelected.cells[0].innerHTML;
            datas.fname.value=rowSelected.cells[1].innerHTML;
            datas.lname.value=rowSelected.cells[2].innerHTML;
            datas.email.value=rowSelected.cells[3].innerHTML;
            }
        }
}
</script>
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
header {
	margin-top: 0px;
	margin-left: 13px;
}
footer {
	font-size: small;
	text-align: left;
	clear: both;
	position: fixed;
	left: 0px;
	bottom: 0px;
	height: 84px;
	width: 100%;
	padding-top: 60px;
        color: black;
}
    
</style>
<body onload="validation()">
<%
String strkey = request.getParameter("strkey");       
%>
<input type="button" value="Back"  onclick="back()" title="Back" style="position:relative;top:16px;left:2%;width:70px;height:30px">
<section class="main">

<form METHOD="POST" name="datas" action=""  >
<input type="text"
	id="fname" name="fname" value=""
	style="position:absolute;top:192px;left:2%;font:16px Arial;border:none;border:solid thin;
        border-color:#aaaa00;box-shadow: 2px 2px 1px #000000;text-align:left;background-color: white;width:20%"> 
        <font Style="position:absolute;top:172px;left:2%;font: 16px Arial;
              color: black;height:22px;width:140px">First Name</font> 
<input type="text"  name="lname"
	id="lname" value=""
	style="position:absolute;top:245px;left:2%;font:16px Arial;border:none;border:solid thin;
        border-color:#aaaa00;box-shadow: 2px 2px 1px #000000;text-align:left;background-color: white;width:20%"> 
        <font Style="position:absolute;top:225px;left:2%;font: 16px Arial;
              color: black;height:22px;width:140px">Last Name</font> 
<input type="text"  name="email"
	id="email" value=""
	style="position:absolute;top:298px;left:2%;font:16px Arial;border:none;border:solid thin;
        border-color:#aaaa00;box-shadow: 2px 2px 1px #000000;text-align:left;background-color: white;width:20%"> 
        <font Style="position:absolute;top:278px;left:2%;font: 16px Arial;
              color: black;height:22px;width:140px">Email Address</font> 
<input type="hidden"  name="radif" id="radif" value="0">
<input type="button"  
       	style="position:absolute;top:380px;left:2%;width:70px;height:30px"
        name="button" value="New" class="button" onclick="new_item()"/>
<input type="button"
       	style=position:absolute;top:415px;left:2%;width:70px;height:30px"
        name="button" value="Save" class="button" onclick="iu_item()"/>
<input type="button"
       	style="position:absolute;top:448px;left:2%;width:70px;height:30px"
        name="button" value="Delete" class="button" onclick="d_item()"/>
</form>
</section> 
<font Style="position:absolute; bottom:2%;left:2%;font: 12px Arial">© 2018 QA Concept</font>
<a id="Show_table" >
</a>
<script LANGUAGE="JavaScript" >
document.getElementById("fname").focus();
showtable();

function back(){
    var myWindow;
    myWindow=window.location.replace('main_menu.jsp'); 
}

function new_item(){
   document.getElementById("radif").value="0";
   document.getElementById("fname").value="";
   document.getElementById("lname").value="";
   document.getElementById("email").value="";
   document.getElementById("fname").focus();
}   
function iu_item(){
   insert_update();
}
function d_item(){
   deletes();
   document.getElementById("radif").value="0";
   document.getElementById("fname").value="";
   document.getElementById("lname").value="";
   document.getElementById("email").value="";
}


var xmlHttp0;
function showtable(){
    

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
var url= "table_helper.jsp";
xmlHttp0.onreadystatechange =function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("Show_table").innerHTML = this.responseText;
      
    }
  };
xmlHttp0.open("POST", url, true);
xmlHttp0.send(null);
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
                var radif1=encodeURI(document.getElementById('radif').value);
                var fname1=document.getElementById('fname').value;
                var lname1=document.getElementById('lname').value;
                var email1=document.getElementById('email').value;
                nocache=Math.random();
                http.open("POST",'saverecordsh.jsp?radif1='+radif1+'&fname1='+encodeURIComponent(fname1)+'&lname1='+encodeURIComponent(lname1)
                        +'&email1='+encodeURIComponent(email1)+'&nocache='+nocache);
                http.onreadystatechange=insert_update_Reply;
                http.send(null);
}
function insert_update_Reply(){
if(http.readyState==4){
   showtable();
}
   document.getElementById("radif").value="0"; 
   document.getElementById("fname").value="";
   document.getElementById("lname").value="";
   document.getElementById("email").value="";
   document.getElementById("fname").focus();
}
var http1;
var nocache1=0;
function deletes(){
if(typeof XMLHttpRequest != "undefined"){
   http1= new XMLHttpRequest();
}
else if (window.ActiveXObject){
         http1= new ActiveXObject("Microsoft.XMLHTTP");
}
if (http1==null){
   alert ("Browser does not support XMLHTTP Request");
   return;
}
var radif1=encodeURI(document.getElementById('radif').value);
http1.onreadystatechange=delets_Reply;
http1.open("get",'deletsrecordsh.jsp?radif1='+radif1);
http1.send(null);
}

function delets_Reply(){
if(http1.readyState==4 || http1.readyState=="complete"){
   showtable();
   document.getElementById("radif").value="0";
   document.getElementById("fname").value="";
   document.getElementById("lname").value="";
   document.getElementById("email").value="";
   document.getElementById("fname").focus();
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
