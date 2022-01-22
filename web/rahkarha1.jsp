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
        <title>Provide solutions for the cause</title>
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
          datas.rdesc.value=rowSelected.cells[3].innerHTML;
          datas.rahkar.value=rowSelected.cells[2].innerHTML;
          datas.radif.value=rowSelected.cells[0].innerHTML;
          
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
       id="problem"  name="problem" value=""
	style="position:absolute;top:140px;left:2%;font:16px Arial;border:none;border:solid thin;
        border-color:#aaaa00;box-shadow: 2px 2px 1px #000000;text-align:left;background-color: white;width:20%"> 
        <font Style="position:absolute;top:120px;left:2%;font: 16px Arial;
              color: black;height:22px;width:140px">Issue</font> 
<input type="text"
	id="elaat" name="elaat" value=""
	style="position:absolute;top:192px;left:2%;font:16px Arial;border:none;border:solid thin;
        border-color:#aaaa00;box-shadow: 2px 2px 1px #000000;text-align:left;background-color: white;width:20%"> 
        <font Style="position:absolute;top:172px;left:2%;font: 16px Arial;
              color: black;height:22px;width:140px">Cause</font> 
<input type="text"  name="rahkar"
	id="rahkar" value=""
	style="position:absolute;top:245px;left:2%;font:16px Arial;border:none;border:solid thin;
        border-color:#aaaa00;box-shadow: 2px 2px 1px #000000;text-align:left;background-color: white;width:20%"> 
        <font Style="position:absolute;top:225px;left:2%;font: 16px Arial;
              color: black;height:22px;width:140px">Action</font> 
<textarea type="text"  name="rdesc"
	id="rdesc" value=""
	style="position:absolute;top:298px;left:2%;font:16px Arial;border:none;border:solid thin;
        border-color:#aaaa00;box-shadow: 2px 2px 1px #000000;text-align:left;background-color: white;height:150px;width:20%"></textarea>
        <font Style="position:absolute;top:278px;left:2%;font: 16px Arial;
              color: black;height:22px;width:140px">Describtion</font> 
<input type="hidden"  name="radif" id="radif" value="0">     
<input type="hidden"  name="strkey" id="strkey" value="">     
<input type="hidden"  name="strkeyp" id="strkeyp" value="">     

<input type="button"  
       	style="position:absolute;top:465px;left:2%;width:70px;height:30px"
        name="button" value="New" class="button" onclick="new_item()"/>
<input type="button"
       	style=position:absolute;top:498px;left:2%;width:70px;height:30px"
        name="button" value="Save" class="button" onclick="iu_item()"/>
<input type="button"
       	style="position:absolute;top:531px;left:2%;width:70px;height:30px"
        name="button" value="Delete" class="button" onclick="d_item()"/>
</form>
</section> 
<font Style="position:absolute; bottom:2%;left:2%;font: 12px Arial">© 2018 QA Concept</font>
<a id="Show_table" >
</a>
<script LANGUAGE="JavaScript" >
document.getElementById("problem").disabled=true;    
document.getElementById("elaat").disabled=true;    
document.getElementById("rahkar").focus();
document.getElementById("strkey").value="<%=strkey%>";
findpe("<%=strkey%>");
findp("<%=strkey%>");
showtable("<%=strkey%>");

function back(){
    var myWindow;
    myWindow=window.location.replace('rahkarha.jsp'); 
}

function new_item(){
   document.getElementById("radif").value="0";
   document.getElementById("rahkar").value="";
   document.getElementById("rdesc").value="";
   document.getElementById("rahkar").focus();
}   
function iu_item(){
   insert_update();
}
function d_item(){
   deletes();
   datas.rahkar.value="";
   datas.rdesc.value="";
   datas.radif.value="0";
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
var url= "table_rahkar.jsp";
url += "?strkey=" +str;
xmlHttp0.onreadystatechange =function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("Show_table").innerHTML = this.responseText;
      
    }
  };
xmlHttp0.open("POST", url, true);
xmlHttp0.send(null);
}

var xmlHttp1;
function findpe(str){
 
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

var url= "find_pe.jsp";
url += "?strkey=" +str;
xmlHttp1.onreadystatechange = statefind;
xmlHttp1.open("GET", url, true);
xmlHttp1.send(null);
}
function statefind(){
if (xmlHttp1.readyState==4 || xmlHttp1.readyState=="complete"){
var v=xmlHttp1.responseText;
var strar = v.split(":");
document.getElementById("elaat").value=strar[1];
}
}

var xmlHttp2;
function findp(str){
 
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
var url= "find_p.jsp";
url += "?strkey=" +str;
xmlHttp2.onreadystatechange = statefindp;
xmlHttp2.open("GET", url, true);
xmlHttp2.send(null);
}
function statefindp(){
if (xmlHttp2.readyState==4 || xmlHttp2.readyState=="complete"){
var v=xmlHttp2.responseText;
var strar = v.split(":");
document.getElementById("problem").value=strar[1];
document.getElementById("strkeyp").value=strar[2];
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
                var radif1=encodeURI(document.getElementById('radif').value);
                var rahkar1=document.getElementById('rahkar').value;
                var rdesc1=document.getElementById('rdesc').value;
                var strkeyid=encodeURI(document.getElementById('strkey').value);
                var strkeyp=encodeURI(document.getElementById('strkeyp').value);
                var elaat1=document.getElementById('elaat').value;
                nocache=Math.random();
                http.open("POST",'saverecordsr.jsp?radif1='+radif1+'&rahkar1='+encodeURIComponent(rahkar1)+'&rdesc1='+encodeURIComponent(rdesc1)+'&strkeyid='+strkeyid
                        +'&elaat1='+encodeURIComponent(elaat1)+'&strkeyp='+strkeyp+'&nocache='+nocache);
                http.onreadystatechange=insert_update_Reply;
                http.send(null);
}
function insert_update_Reply(){
if(http.readyState==4){
var v=http.responseText;
var strar = v.split(":");
if(strar[1]=="1"){
    alert("The solution is registered by another user and is non-modifiable.");
}else{
    showtable("<%=strkey%>");
}
document.getElementById("radif").value="0";
document.getElementById("rahkar").value="";
document.getElementById("rdesc").value="";
document.getElementById("rahkar").focus();
}
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
var strkeyid=encodeURI(document.getElementById('strkey').value);
http1.onreadystatechange=delets_Reply;
http1.open("get",'deletsrecordsr.jsp?radif1='+radif1+'&strkeyid='+strkeyid);
http1.send(null);
}

function delets_Reply(){
if(http1.readyState==4 || http1.readyState=="complete"){
   var v=http1.responseText;
var strar = v.split(":");
if(strar[1]=="1"){
    alert("The solution is registered by another user and is non-removable.");
}else{
    showtable("<%=strkey%>");
}
document.getElementById("radif").value="0";
document.getElementById("rahkar").value="";
document.getElementById("rdesc").value="";
document.getElementById("rahkar").focus();
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
