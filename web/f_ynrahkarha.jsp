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
<title>Approval Of Proposed Solutions</title>
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
          datas.radif.value=rowSelected.cells[6].innerHTML;
          datas.id.value=rowSelected.cells[5].innerHTML;
          var chk=table.getElementsByTagName("INPUT");
             if (chk[rowId-1].checked==true){
                editoknok(datas.id.value,datas.radif.value,"0"); 
            }else{
                editoknok(datas.id.value,datas.radif.value,"1"); 
            }
          
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
<%
String name_=(String)session.getAttribute("name_"); 
%>
<font Style="position:absolute; top:2%;right: 2%;font: 16px Arial;color: black">Active User:<%=name_%></font>

<body onload="validation()">
<font style="position: relative;top:150px;font-size: 26px;left: 800px">Approval Of Proposed Solutions</font>
<section class="main">

<form METHOD="POST" name="datas" action=""  >
    <input type="button" value="Back"  onclick="back()" title="Back" style="position:relative;top:1px;left:2%;width:70px;height:30px">
        <font Style="position:absolute;top:83px;left:2%;font:16px Arial;
              color: black;height:22px;width:140px">Issue</font> 
<div id='combo1'>          
</div>    
<input type="hidden"  name="strkey" id="strkey" value="">     
<input type="hidden"  name="id" id="id" value="">     
<input type="hidden"  name="radif" id="radif" value="">    
<input type="hidden"  name="oknok" id="oknok" value="">    
</form>
</section> 
<a id="Show_table" >
</a>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.js"></script>
<font Style="position:absolute; bottom:2%;left:2%;font: 12px Arial">© 2018 QA Concept</font>
<script LANGUAGE="JavaScript" >

showState1();

function back(){
    var myWindow;
    myWindow=window.location.replace('main_menu.jsp'); 
}

function ini_item(){
  findptxt(document.getElementById('problems').value);
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

var url= "combo0_problems.jsp";
xmlHttp.onreadystatechange = stateChange1;
xmlHttp.open("GET", url, true);
xmlHttp.send(null);
}
function stateChange1(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
    document.getElementById("combo1").innerHTML=xmlHttp.responseText 
    findptxt(document.getElementById('problems').value);
}
}

var xmlHttp0;
function showtable(str){
    

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

var url= "table_ynrahkar.jsp";
url += "?strkey=" +str;
xmlHttp0.onreadystatechange = stateChanget;
xmlHttp0.open("POST", url, true);
xmlHttp0.send(null);
}
function stateChanget(){
if (xmlHttp0.readyState==4 || xmlHttp0.readyState=="complete"){
   document.getElementById("Show_table").innerHTML=xmlHttp0.responseText;
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
xmlHttp1.open("POST", url, true);
xmlHttp1.send(null);
}
function statefind(){
if (xmlHttp1.readyState==4 || xmlHttp1.readyState=="complete"){
var v=xmlHttp1.responseText;
var strar = v.split(":");
document.getElementById("strkey").value=strar[1];
showtable(document.getElementById('strkey').value);
}
}

var xmlHttp2;
function editoknok(str,str1,str2){
 
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
var url= "edit_oknok.jsp";
url += "?idx=" +str+'&radifx='+str1+'&oknokx='+str2;
xmlHttp2.open("POST", url, true);
xmlHttp2.send(null);
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
