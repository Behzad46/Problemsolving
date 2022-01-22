<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import= " java.sql.*"%>
<%@page import= " java.util.concurrent.Callable"%>
<%@page import= " javax.sql.rowset.JdbcRowSet"%>
<%@page import= " java.util.Locale"%>
<%@page import= " javax.swing.JOptionPane"%>
<%@page import= " java.util.Date"%>
<%
String code0_ = (String)session.getAttribute("code0");    
String comments = (String)session.getAttribute("nuname");
    if(null == comments){
     comments = "";
   }   String comment  = request.getParameter("nuname");
   if(null != comment){
     comments = comments + comment;
     session.setAttribute("comments", comments);
     response.sendRedirect(request.getContextPath() + "/ini_pass.jsp");
     //return;
   }
 %>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Definition of users</title>
<link rel="shortcut icon" type="image-icon" href="images/1.ico">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<style type="text/css">
body {
	background-color: white;
}
.h2 {
	font: 10 arial;
	text-align: left;
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
.formStyle   {
	width: 30%;
	height: 1.8em;
}
.nuname {
	width: 20%;
	margin-left: 250px;
	margin-top: -20px;
	height: 1.8em;
}
.src1 {
	background-image: url(images/filter.gif);
	width: 20px;
	height: 20px;
	min-width: 0px;
}
.src2 {
	background-image: url(images/filter.gif);
	width: 20px;
	height: 20px;
	min-width: 0px;
}
.src3 {
	background-image: url(images/filter.gif);
	width: 20px;
	height: 20px;
	min-width: 0px;
}

.sections  {
	width: 98%;
        height: 150px;
	float: right;
        font :14px Arial;
	margin-right: 1%;
	margin-top: 30px;
	margin-left: 1%;
}
.sections1  {
	width: 48%;
	float: left;
	margin-right: 1%;
	margin-top: -180px;
	margin-left: 1%;
}
.chk1 {
	width: 12px;
	height: 12px;
}
.table2 {
	width: 510px;
	margin-left: 0px;
}
.td2 {
	width: 250px;
	text-align: center;
	background-color: hsla(0,11%,69%,1.00);
}
.td3 {
	width: 2px;
	text-align: center;
	background-color: hsla(0,11%,69%,1.00);
}
.td4 {
	width: 350px;
	text-align: left;
}
.td5 {
	width: 50px;
	text-align: center;
}
    
</style>
<link rel="stylesheet" href="css/cssalert1.css">
<script  type="text/javascript">
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
          datas.perno.value=rowSelected.cells[0].innerHTML;
          datas.name.value=rowSelected.cells[1].innerHTML;
          datas.family.value=rowSelected.cells[2].innerHTML;
          datas.ghesmat.value=rowSelected.cells[3].innerHTML;
          
      }
  }
}
</script>
<body onload="validation()">
<div id="validation-txt" style="position:absolute;top:0px;left:20%;width:300px;background-color: red;color: white;">
</div>
 <input type="button" value="Back"  onclick="back()" title="Back" style="position:absolute;top:10px;left:1%;text-align:center;width:70px;height:25px">
 <section class="sections">
  <form name="datas" method="post" action="">
    <br>
    <input class="formStyle" id="nuname" name="nuname"  title="New User" type="text" placeholder="New User">
    <br>
    <label for="textfield" Style="font: 14px bold Arial;color: black;height:16px;width:140px" >User Name*</label>
    <div  id="combo1">
    </div>
    <label for="textfield" Style="font: 14px bold Arial;color: black;height:16px;width:60px">Password*</label>
    <br>
    <input class="formStyle" id="upass" name="upass" id="upass"  type="password" maxlength="10" >
    <img class="tooltiptext" src="images/info.png" title="Please enter a password with at least eight characters.Rules for a secure password are:
         - at least an upper-case letter (A-Z) 
         - at least a lower-case letter (a-z) 
         - at least a number (0-9) 
         - at least a character: ( ) { } ? ! $ %  / = * + ~ , . ; : < > - _ @" />
    <br>
    <label for="textfield" Style="font: 14px bold Arial;color: black;height:16px;width:140px">Role*</label>
    <br>
    <div id="combo2">
    </div>
    <label for="textfield" Style="font: 14px bold Arial;color: black;height:16px;width:140px">Committee*</label>
    <br>
    <div id="combo3">
    </div>
    <label for="textfield" Style="font: 14px bold Arial;color: black;height:16px;width:140px">Personal ID*</label>
    <br>
    <input class="formStyle" id="perno" name="perno" value=""  type="text">
    <input type="button" class="src1" value="" title="Filter to Personel ID"  onclick="search1()">
    <br>
    <label for="textfield" Style="font: 14px bold Arial;color: black;height:16px;width:140px">First Name*</label>
    <br>
    <input  class="formStyle" id="name" name="name" value="" type="text">
    <input type="button"  class="src2" value="" title="Filter to First Name" onclick="search2()">
    <br>
    <label for="textfield" Style="font: 14px bold Arial;color: black;height:16px;width:140px">Last Name*</label>
    <br>
    <input  class="formStyle" id="family" name="family"  value="" type="text">
    <input type="button" class="src3" value="" title="Filter to Sur Name" onclick="search3()">
    <br>
    <label for="textfield" Style="font: 14px bold Arial;color: black;height:16px;width:140px">Organization*</label>
    <br>
    <input  class="formStyle" id="ghesmat" name="ghesmat" value="" type="text">
    <br>
    <label for="textfield" Style="font: 14px bold Arial;color: black;height:16px;width:140px">Permissions*</label>
    <input type="hidden"  id="cvahed" value="">      
    <input type="hidden"  id="usern" value="0">       
    <input type="hidden" name="myitem" id="myitem"  value="">        
    <input type="hidden"  id="myitem1" value="">        
    <input type="hidden"  id="myitem2" value=""> 
    <input type="hidden"  id="cp" value=""> 
    <input type="hidden"  id="pass" value=""> 
    <input type="hidden"  name="input" id="input" value="">  
 </form>
    <div style="overflow: auto;width: 412px;border:solid thin;border-color:#a2bea1;box-shadow: 2px 2px 1px #000000;">
    <table style="width:410px;margin-left: 0px;"  border="1" cellpadding="0" cellspacing="0">
      <tr>
        <td class="td5" style="background-color: #a2bea1; color:black;text-align: center">Select</td>
        <td class="td4" style="background-color: #a2bea1; color:black;text-align: center">Activity</td>
      </tr>
    </table>
    </div>
<div style="overflow: auto;height: 140px; width: 412px;position:relative;border:solid thin;box-shadow: 2px 2px 1px #000000;">
  <table style="width:410px;margin-left: 0px;"  border="1" cellpadding="0" cellspacing="0">
   <tbody>
    <tr>
        <td class="td5"><input class="chk1" type="checkbox" disabled="true" name="select" id="c1"  value="" onclick="c1_click()"></td>
      <td class="td4"> Problem tree</td>
    </tr>
    <tr>
      <td class="td5"><input class="chk1" type="checkbox" disabled="true" name="select" id="c2"  value="" onclick="c2_click()"></td>
      <td class="td4"> Identifying Causes</td>
    </tr>
    <tr>
      <td class="td5"><input class="chk1" type="checkbox" disabled="true" name="select" id="c3"  value="" onclick="c3_click()"></td>
      <td class="td4"> Providing Solutions</td>
    </tr>
    <tr>
      <td class="td5"><input class="chk1" type="checkbox" disabled="true" name="select" id="c4"  value="" onclick="c4_click()"></td>
      <td class="td4"> Definition Of Committee</td>
    </tr>
    <tr>
      <td class="td5"><input class="chk1" type="checkbox" disabled="true" name="select" id="c5"  value="" onclick="c5_click()"></td>
      <td class="td4"> Control Panel</td>
    </tr>
    <tr>
      <td class="td5"><input class="chk1" type="checkbox" disabled="true" name="select" id="c6"  value="" onclick="c6_click()"></td>
      <td class="td4"> Personel list</td>
    </tr>
    <tr>
      <td class="td5"><input class="chk1" type="checkbox" disabled="true" name="select" id="c7"  value="" onclick="c7_click()"></td>
      <td class="td4"> Approval Of Proposed Solutions</td>
    </tr>
    <tr>
      <td class="td5"><input class="chk1" type="checkbox" disabled="true" name="select" id="c8"  value="" onclick="c8_click()"></td>
      <td class="td4"> Determining Executor For Approved Solutions</td>
    </tr>
    <tr>
      <td class="td5"><input class="chk1" type="checkbox" disabled="true" name="select" id="c9"  value="" onclick="c9_click()"></td>
      <td class="td4"> Performance Of Committee</td>
    </tr>
    <tr>
      <td class="td5"><input class="chk1" type="checkbox" disabled="true" name="select" id="c10"  value="" onclick="c10_click()"></td>
      <td class="td4"> Performance Of Committee Members</td>
    </tr>
    <tr>
      <td class="td5"><input class="chk1" type="checkbox" disabled="true" name="select" id="c11"  value="" onclick="c11_click()"></td>
      <td class="td4"> Providing Solution For Each Committee</td>
    </tr>
    <tr>
      <td class="td5"><input class="chk1" type="checkbox" disabled="true" name="select" id="c12"  value="" onclick="c12_click()"></td>
      <td class="td4"> System administrator</td>
    </tr>
  </tbody>
  </table>
</div>   
    </section>
    <section>    
<a id="Show_table" >
</a>
<form id="act" action="">        
<input type="button"  style="position:absolute;top:540px;color:black;left:470px;width:80px;height:30px;" 
       value="New User" title="New User" class="button" onclick="new_item()"/>
<!--<input type="button"  style="position:absolute;top:540px;color:black;left:560px;width:80px;height:30px" 
         value="Edit" title="Edit" class="button" onclick="e_item()"/>-->
<input type="button"  style="position:absolute;top:540px;color:black;left:560px;width:80px;height:30px;" 
         value="Save" title="Save" class="button" onclick="iu_item0()"/>
<input type="button"  style="position:absolute;top:540px;color:black;left:650px;width:80px;height:30px;" 
         value="Clear Data" title="Clear Data" class="button" onclick="c_item()"/>
<input type="button"  style="position:absolute;top:540px;color:black;left:740px;width:80px;height:30px;" 
         value="Delete" title="Delete" class="button" onclick="d_item()"/>
<input type="button"  style="position:absolute;top:540px;color:black;left:830px;width:80px;height:30px;" 
         value="Unfilter" title="Unfilter" class="button" onclick="show_table()"/>
<input type="button"  style="position:absolute;top:540px;color:black;left:920px;width:80px;height:30px;" 
         value="Cancel" title="Cancel" class="button" onclick="cnsl_item()"/>
<input type="button"  style="position:absolute;top:540px;color:black;left:1010px;width:80px;height:30px;" 
         value="Refresh" title="Refresh" class="button" onclick="refresh()"/>
</form>
</section>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jsalert.js"  type="text/javascript"></script>
<%
   if (code0_=="" || code0_==null){
     %>
     <script>
        document.getElementById("usern").value="1";  
     </script>
     <%
   }
%>
<script LANGUAGE="JavaScript" >
document.getElementById("nuname").disabled=true;
document.getElementById("upass").disabled=true;

showState1();
showState2();
showState3();
showtable("");
function back(){
    var myWindow;
    myWindow=window.location.replace('main_menu.jsp'); 
}
function chkp(){
    if(!(document.getElementById("upass").value=="")){
      var vld=validate();
      if(vld==false){
          document.getElementById("upass").focus();
      }
    }  
}
function refresh(){
    window.location.reload();
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
function c3_click(){
   if(document.getElementById("c3").checked==true){
      document.getElementById("c3").value="1"; 
   }else{
      document.getElementById("c3").value=""; 
   } 
}
function c4_click(){
   if(document.getElementById("c4").checked==true){
      document.getElementById("c4").value="1"; 
   }else{
      document.getElementById("c4").value=""; 
   } 
}
function c5_click(){
   if(document.getElementById("c5").checked==true){
      document.getElementById("c5").value="1"; 
   }else{
      document.getElementById("c5").value=""; 
   } 
}
function c6_click(){
   if(document.getElementById("c6").checked==true){
      document.getElementById("c6").value="1"; 
   }else{
      document.getElementById("c6").value=""; 
   } 
}
function c7_click(){
   if(document.getElementById("c7").checked==true){
      document.getElementById("c7").value="1"; 
   }else{
      document.getElementById("c7").value=""; 
   } 
}
function c8_click(){
   if(document.getElementById("c8").checked==true){
      document.getElementById("c8").value="1"; 
   }else{
      document.getElementById("c8").value=""; 
   } 
}
function c9_click(){
   if(document.getElementById("c9").checked==true){
      document.getElementById("c9").value="1"; 
   }else{
      document.getElementById("c9").value=""; 
   } 
}
function c10_click(){
   if(document.getElementById("c10").checked==true){
      document.getElementById("c10").value="1"; 
   }else{
      document.getElementById("c10").value=""; 
   } 
}
function c11_click(){
   if(document.getElementById("c11").checked==true){
      document.getElementById("c11").value="1"; 
   }else{
      document.getElementById("c11").value=""; 
   } 
}
function c12_click(){
   if(document.getElementById("c12").checked==true){
      document.getElementById("c12").value="1"; 
   }else{
      document.getElementById("c12").value=""; 
   } 
}
function ini_member(){

   if((document.getElementById("naghsh").selectedIndex==2 || document.getElementById("naghsh").selectedIndex==3)
           && document.getElementById("nuname").disabled==false){
       document.getElementById("c1").value="1";
       document.getElementById("c2").value="1";
       document.getElementById("c3").value="1";
       document.getElementById("c4").value="1";
       document.getElementById("c5").value="1";
       document.getElementById("c6").value="1";
       document.getElementById("c7").value="1";
       document.getElementById("c8").value="1";
       document.getElementById("c9").value="1";
       document.getElementById("c10").value="1";
       document.getElementById("c11").value="1";
       document.getElementById("c12").value="1";
       document.getElementById("c1").checked=true;
       document.getElementById("c2").checked=true;
       document.getElementById("c3").checked=true;
       document.getElementById("c4").checked=true;
       document.getElementById("c5").checked=true;
       document.getElementById("c6").checked=true;
       document.getElementById("c7").checked=true;
       document.getElementById("c8").checked=true;
       document.getElementById("c9").checked=true;
       document.getElementById("c10").checked=true;
       document.getElementById("c11").checked=true;
       document.getElementById("c12").checked=true;
       
   } 
   if(document.getElementById("naghsh").selectedIndex==1 || document.getElementById("naghsh").selectedIndex==5){
       document.getElementById("upass").disabled=false;
       document.getElementById("c2").value="";
       document.getElementById("c4").value="";
       document.getElementById("c5").value="";
       document.getElementById("c6").value="";
       document.getElementById("c7").value="";
       document.getElementById("c8").value="";
       document.getElementById("c9").value="";
       document.getElementById("c10").value="";
       document.getElementById("c11").value="";
       document.getElementById("c12").value="";
       document.getElementById("c1").disabled=false;
       document.getElementById("c2").disabled=true;
       document.getElementById("c3").disabled=false;
       document.getElementById("c4").disabled=true;
       document.getElementById("c5").disabled=true;
       document.getElementById("c6").disabled=true;
       document.getElementById("c7").disabled=true;
       document.getElementById("c8").disabled=true;
       document.getElementById("c9").disabled=true;
       document.getElementById("c10").disabled=true;
       document.getElementById("c11").disabled=true;
       document.getElementById("c12").disabled=true;
       document.getElementById("c2").checked=false;
       document.getElementById("c4").checked=false;
       document.getElementById("c5").checked=false;
       document.getElementById("c6").checked=false;
       document.getElementById("c7").checked=false;
       document.getElementById("c8").checked=false;
       document.getElementById("c9").checked=false;
       document.getElementById("c10").checked=false;
       document.getElementById("c11").checked=false;
       document.getElementById("c12").checked=false;
   }else{
       document.getElementById("upass").disabled=false;
       document.getElementById("c1").disabled=false;
       document.getElementById("c2").disabled=false;
       document.getElementById("c3").disabled=false;
       document.getElementById("c4").disabled=false;
       document.getElementById("c5").disabled=false;
       document.getElementById("c6").disabled=false;
       document.getElementById("c7").disabled=false;
       document.getElementById("c8").disabled=false;
       document.getElementById("c9").disabled=false;
       document.getElementById("c10").disabled=false;
       document.getElementById("c11").disabled=false;
       document.getElementById("c12").disabled=false;
 
   }
}

function ini_item(){
   if(document.getElementById("uname").selectedIndex==0){
       c_item();
       return;
   }
       if(document.getElementById("usern").value=="1" && document.getElementById("uname").selectedIndex==1){
      document.getElementById("naghsh").disabled=true; 
      document.getElementById("vaheds").disabled=true; 
   }else{
      document.getElementById("naghsh").disabled=false; 
      document.getElementById("vaheds").disabled=false; 
   } 
   datas.myitem.value=document.getElementById('uname').value;
   showrecords(datas.myitem.value);
}
function new_item(){
   document.getElementById("nuname").disabled=false; 
   document.getElementById("upass").disabled=false; 
   document.getElementById("uname").selectedIndex=0;
   document.getElementById("uname").disabled=true;
   document.getElementById("upass").value="";
   document.getElementById("pass").value="";
   document.getElementById("perno").value="";
   document.getElementById("name").value="";
   document.getElementById("family").value="";
   document.getElementById("ghesmat").value="";
   document.getElementById("nuname").focus();
   document.getElementById("nuname").value="";
   document.getElementById("naghsh").selectedIndex=0;
   document.getElementById("naghsh").disabled=false; 
   document.getElementById("vaheds").selectedIndex=0;
   document.getElementById("vaheds").disabled=false; 
   document.getElementById("c1").disabled=false;
   document.getElementById("c2").disabled=false;
   document.getElementById("c3").disabled=false;
   document.getElementById("c4").disabled=false;
   document.getElementById("c5").disabled=false;
   document.getElementById("c6").disabled=false;
   document.getElementById("c7").disabled=false;
   document.getElementById("c8").disabled=false;
   document.getElementById("c9").disabled=false;
   document.getElementById("c10").disabled=false;
   document.getElementById("c11").disabled=false;
   document.getElementById("c12").disabled=false;
   document.getElementById("c1").checked=false;
   document.getElementById("c1").checked=false;
   document.getElementById("c2").checked=false;
   document.getElementById("c3").checked=false;
   document.getElementById("c4").checked=false;
   document.getElementById("c5").checked=false;
   document.getElementById("c6").checked=false;
   document.getElementById("c7").checked=false;
   document.getElementById("c8").checked=false;
   document.getElementById("c9").checked=false;
   document.getElementById("c10").checked=false;
   document.getElementById("c11").checked=false;
   document.getElementById("c12").checked=false;
} 
function c_item(){
   document.getElementById("nuname").disabled=true; 
   document.getElementById("uname").disabled=false;
   document.getElementById("upass").value="";
   document.getElementById("perno").value="";
   document.getElementById("name").value="";
   document.getElementById("family").value="";
   document.getElementById("ghesmat").value="";
   document.getElementById("nuname").value="";
   document.getElementById("uname").selectedIndex=0;
   document.getElementById("naghsh").selectedIndex=0;
   document.getElementById("vaheds").selectedIndex=0;
   document.getElementById("c1").checked=false;
   document.getElementById("c1").checked=false;
   document.getElementById("c2").checked=false;
   document.getElementById("c3").checked=false;
   document.getElementById("c4").checked=false;
   document.getElementById("c5").checked=false;
   document.getElementById("c6").checked=false;
   document.getElementById("c7").checked=false;
   document.getElementById("c8").checked=false;
   document.getElementById("c9").checked=false;
   document.getElementById("c10").checked=false;
   document.getElementById("c11").checked=false;
   document.getElementById("c12").checked=false;
   document.getElementById("c1").disabled=true;
   document.getElementById("c2").disabled=true;
   document.getElementById("c3").disabled=true;
   document.getElementById("c4").disabled=true;
   document.getElementById("c5").disabled=true;
   document.getElementById("c6").disabled=true;
   document.getElementById("c7").disabled=true;
   document.getElementById("c8").disabled=true;
   document.getElementById("c9").disabled=true;
   document.getElementById("c10").disabled=true;
   document.getElementById("c11").disabled=true;
   document.getElementById("c12").disabled=true;
} 
function strlen(strtxt){
        var ixstr=0;
          for (i = 0; i < strtxt.length; i++) {
              if (strtxt.substr(i,1)!='' || strtxt.substr(i,1)!=null) {
                          ixstr=ixstr+1;
              } else {
                  break;
              }
             }
             return ixstr;
} 

function validate()
{
  var  validationField = document.getElementById('validation-txt');
  var  password= document.getElementById('upass');
 
  var content = password.value;
  var  errors = [];
if (content.search(/[a-z]/i) < 0) 
  {
    errors.push("Your password must contain at least one letter.");
    validationField.innerHTML = errors.join(',');
    return false;
  }
  if (content.search(/[0-9]/i) < 0) 
  {
    errors.push("Your password must contain at least one digit."); 
    validationField.innerHTML = errors.join(',');
    return false;
  }
if (content.search(/[{ } ( ) ? ! $ %  / = * + ~ , . ; : < > _ @ -]/i) < 0) 
  {
    errors.push("Your password must contain at least one { } ( ) ? ! $ %  / = * + ~ , . ; : < > _ @ -.");
    validationField.innerHTML = errors.join(',');
    return false;
  }
if (content.search(/[#^&']/i) > 0) 
  {
    errors.push("Character is not valid.");
    validationField.innerHTML = errors.join(',');
    return false;
  }
if (content.length < 8) 
  {
    errors.push("Your password must be at least 8 characters"); 
    validationField.innerHTML = errors.join(',');
    return false;
  }
  validationField.innerHTML = errors.join(',');
  return true;
}

function cnsl_item(){
   document.getElementById("nuname").disabled=true; 
   document.getElementById("uname").disabled=false;
   document.getElementById("upass").value="";
   document.getElementById("perno").value="";
   document.getElementById("name").value="";
   document.getElementById("family").value="";
   document.getElementById("ghesmat").value="";
   document.getElementById("nuname").value="";
   document.getElementById("uname").selectedIndex=0;
   document.getElementById("naghsh").selectedIndex=0;
   document.getElementById("vaheds").selectedIndex=0;
   document.getElementById("c1").checked=false;
   document.getElementById("c1").checked=false;
   document.getElementById("c2").checked=false;
   document.getElementById("c3").checked=false;
   document.getElementById("c4").checked=false;
   document.getElementById("c5").checked=false;
   document.getElementById("c6").checked=false;
   document.getElementById("c7").checked=false;
   document.getElementById("c8").checked=false;
   document.getElementById("c9").checked=false;
   document.getElementById("c10").checked=false;
   document.getElementById("c11").checked=false;
   document.getElementById("c12").checked=false;
   document.getElementById("c1").disabled=true;
   document.getElementById("c2").disabled=true;
   document.getElementById("c3").disabled=true;
   document.getElementById("c4").disabled=true;
   document.getElementById("c5").disabled=true;
   document.getElementById("c6").disabled=true;
   document.getElementById("c7").disabled=true;
   document.getElementById("c8").disabled=true;
   document.getElementById("c9").disabled=true;
   document.getElementById("c10").disabled=true;
   document.getElementById("c11").disabled=true;
   document.getElementById("c12").disabled=true;
}

function show_table(){
    showtable("");  
}

function e_item(){
      if(document.getElementById("uname").selectedIndex>0){
         iu_item0();
         return;
      }  
      if (document.getElementById("perno").value.substr(0,1)=="0"){
            swal("The Personal ID should not start with zero.")
            document.getElementById("perno").focus();
            return;
        } 
        for (i = 0; i < document.getElementById("perno").value.length; i++) {
              
              if (!(document.getElementById("perno").value.substr(i,1)>="0" && document.getElementById("perno").value.substr(i,1)<="9")) {
                    swal("The amount of Personal ID should be a number.")
                    document.getElementById("perno").focus();
                    return;
              }
      }
      if((document.getElementById("perno").value=="" ||document.getElementById("perno").value==null)){
            swal("The Personal ID field can not be empty")
            document.getElementById("perno").focus();
            return;
      }
      if((document.getElementById("name").value=="" ||document.getElementById("name").value==null)){
            swal("The First Name field can not be empty")
            document.getElementById("name").focus();
            return;
      }
      if((document.getElementById("family").value=="" ||document.getElementById("family").value==null)){
            swal("The Last Name field can not be empty")
            document.getElementById("family").focus();
            return;
      }
      if((document.getElementById("ghesmat").value=="" ||document.getElementById("ghesmat").value==null)){
            swal("The Organization field can not be empty")
            document.getElementById("ghesmat").focus();
            return;
      }
      insert_updatep();
      swal("Congratulations!", "User Information was Saved!", "success")
      c_item();
      showtable("");  
      showtable("");  
      showtable("");  
}

function iu_item0(){
    if( document.getElementById("uname").selectedIndex!=0 || document.getElementById("nuname").disabled==false){    
      if((document.getElementById("nuname").value=="" ||document.getElementById("nuname").value==null) && document.getElementById("nuname").disabled==false){
            swal("The User Name field can not be empty")
            document.getElementById("nuname").focus();
            return;
      }
      if (document.getElementById("nuname").value.substr(0,1)==" ") {
            swal("The User Name should not start with Blank")
            document.getElementById("nuname").focus();
            return;
      }
        for (i = 0; i < document.getElementById("nuname").value.length; i++) {
              
              if (document.getElementById("nuname").value.substr(i,1)=="Ü" || document.getElementById("nuname").value.substr(i,1)=="ü"
                      || document.getElementById("nuname").value.substr(i,1)=="Ä" || document.getElementById("nuname").value.substr(i,1)=="ä"
                      || document.getElementById("nuname").value.substr(i,1)=="Ö" || document.getElementById("nuname").value.substr(i,1)=="ö"
                      || document.getElementById("nuname").value.substr(i,1)=="É" || document.getElementById("nuname").value.substr(i,1)=="é"
                      || document.getElementById("nuname").value.substr(i,1)=="ß") {
                    swal("The amount of User Name should be  a-z or A-Z")
                    document.getElementById("nuname").focus();
                    return;
              }
      }
      if((document.getElementById("upass").value=="" ||document.getElementById("upass").value==null) && document.getElementById("pass").value=="" ){
            swal("The Password field can not be empty!")
            document.getElementById("upass").focus();
            return;
      }
      if((document.getElementById("upass").value=="" ||document.getElementById("upass").value==null) && document.getElementById("pass").value!="" ){
            document.getElementById("upass").value=document.getElementById("pass").value;
      }
      if((document.getElementById("naghsh").selectedIndex==0)){
            swal("The Role field can not be empty!")
            document.getElementById("combo2").focus();
            return;
      }
      if((document.getElementById("vaheds").selectedIndex==0)){
            swal("The Committee field can not be empty")
            document.getElementById("combo3").focus();
            return;
      }
      if (document.getElementById("perno").value.substr(0,1)=="0"){
            swal("The Personal ID should not start with zero")
            document.getElementById("perno").focus();
            return;
        } 
        for (i = 0; i < document.getElementById("perno").value.length; i++) {
              
              if (!(document.getElementById("perno").value.substr(i,1)>="0" && document.getElementById("perno").value.substr(i,1)<="9")) {
                    swal("The amount of Personal ID should be a number")
                    document.getElementById("perno").focus();
                    return;
              }
      }
      if((document.getElementById("perno").value=="" ||document.getElementById("perno").value==null)){
            swal("The Personal ID field can not be empty")
            document.getElementById("perno").focus();
            return;
      }
      if((document.getElementById("name").value=="" ||document.getElementById("name").value==null)){
            swal("The First Name field can not be empty")
            document.getElementById("name").focus();
            return;
      }
      if((document.getElementById("family").value=="" ||document.getElementById("family").value==null)){
            swal("The Last Name field can not be empty")
            document.getElementById("family").focus();
            return;
      }
      if((document.getElementById("ghesmat").value=="" ||document.getElementById("ghesmat").value==null)){
            swal("The Organization field can not be empty")
            document.getElementById("ghesmat").focus();
            return;
      }
      var vld=validate();
      if(vld==false){
          return;
      }
      if( document.getElementById("uname").selectedIndex!=0 || document.getElementById("nuname").disabled==false ){
          findp(document.getElementById("perno").value);
      }
  }else{
        swal("Please,Select a User")
      }  

} 

var xmlHttp6;
function findp(str){
    
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

var url= "find_person.jsp";
url += "?perno=" +str;
xmlHttp6.onreadystatechange = statefindp;
xmlHttp6.open("POST", url, false);
xmlHttp6.send(null);
}
function statefindp(){
if (xmlHttp6.readyState==4 || xmlHttp6.readyState=="complete"){
var v=xmlHttp6.responseText;
var strar = v.split(":");
if(strar[1]=="1"){
swal({
  title: "Are you sure?",
  text: "This Personal ID has already been defined!",
  type: "warning",
  showCancelButton: true,
  confirmButtonClass: "btn-danger",
  confirmButtonText: "Replace",
  closeOnConfirm: false
},
function(){
if(true){
    showState1();
    iu_item();
}
});
}else{
   showState1();
   iu_item(); 
}
}
}


function iu_item(){
    
    if( document.getElementById("uname").selectedIndex!=0 || document.getElementById("nuname").disabled==false){    
      if((document.getElementById("nuname").value=="" ||document.getElementById("nuname").value==null) && document.getElementById("nuname").disabled==false){
            swal("The User Name field can not be empty")
            document.getElementById("nuname").focus();
            return;
      }
      if((document.getElementById("upass").value=="" ||document.getElementById("upass").value==null) && document.getElementById("pass").value=="" ){
            swal("The Password field can not be empty!")
            document.getElementById("upass").focus();
            return;
      }
      if((document.getElementById("upass").value=="" ||document.getElementById("upass").value==null) && document.getElementById("pass").value!="" ){
            document.getElementById("upass").value=document.getElementById("pass").value;
      }
      if((document.getElementById("naghsh").selectedIndex==0)){
            swal("The Role field can not be empty!")
            document.getElementById("combo2").focus();
            return;
      }
      if((document.getElementById("vaheds").selectedIndex==0)){
            swal("The Committee field can not be empty")
            document.getElementById("combo3").focus();
            return;
      }
      if (document.getElementById("perno").value.substr(0,1)=="0"){
            swal("The Personal ID should not start with zero.")
            document.getElementById("perno").focus();
            return;
        } 
        for (i = 0; i < document.getElementById("perno").value.length; i++) {
              
              if (!(document.getElementById("perno").value.substr(i,1)>="0" && document.getElementById("perno").value.substr(i,1)<="9")) {
                    swal("The amount of Personal ID should be a number.")
                    document.getElementById("perno").focus();
                    return;
              }
      }
      if((document.getElementById("perno").value=="" ||document.getElementById("perno").value==null)){
            swal("The Personal ID field can not be empty")
            document.getElementById("perno").focus();
            return;
      }
      if((document.getElementById("name").value=="" ||document.getElementById("name").value==null)){
            swal("The First Name field can not be empty")
            document.getElementById("name").focus();
            return;
      }
      if((document.getElementById("family").value=="" ||document.getElementById("family").value==null)){
            swal("The Last Name field can not be empty")
            document.getElementById("family").focus();
            return;
      }
      if((document.getElementById("ghesmat").value=="" ||document.getElementById("ghesmat").value==null)){
            swal("The Organization field can not be empty")
            document.getElementById("ghesmat").focus();
            return;
      }
      var vld=validate();
      if(vld==false){
          return;
      }
      if( document.getElementById("uname").selectedIndex!=0 || document.getElementById("nuname").disabled==false ){
         refresh();
         refresh();
         refresh();
         insert_update();
         datas.myitem.value="";
         if(document.getElementById("nuname").disabled==false ){
           new_item();
         }
      swal("Congratulations!", "User Information was Saved!", "success")
      showtable("");  
      showtable("");  
      showtable("");  
      }
  }else{
        swal("Please,Select a User")
      }  
}

function d_item(){
    swal({
  title: "Are you sure to Delete?",
  text: document.getElementById("name").value+" "+document.getElementById("family").value,
  type: "warning",
  showCancelButton: true,
  confirmButtonClass: "btn-danger",
  confirmButtonText: "Yes!",
  closeOnConfirm: false
},
function(){
if(true){
     if (document.getElementById("usern").value=="1"){
      if(document.getElementById("uname").selectedIndex!=1 && document.getElementById("uname").selectedIndex!=0 && document.getElementById("nuname").disabled==true ){
        deletes();
        datas.myitem.value="";
        showState1();
        refresh();  
      }else{
        swal("Deleting is not possible")
      }
     }else{
      if( document.getElementById("uname").selectedIndex!=0 && document.getElementById("nuname").disabled==true ){
        deletes();
        datas.myitem.value="";
        showState1();
        refresh();
      }else{
        swal("Deleting is not possible")
      }
     }
}
});
}
function search1(){
   showtable("1");
}
function search2(){
   showtable("2");
}
function search3(){
   showtable("3");
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

var url= "item_combo1.jsp";
xmlHttp.onreadystatechange = stateChange1;
xmlHttp.open("POST", url, false);
xmlHttp.send(null);
}
function stateChange1(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
    document.getElementById("combo1").innerHTML=xmlHttp.responseText  

}
}
var xmlHttp2;
function showState2(){
    

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

var url= "item_combo2.jsp";
xmlHttp2.onreadystatechange = stateChange2;
xmlHttp2.open("POST", url, false);
xmlHttp2.send(null);
}
function stateChange2(){
if (xmlHttp2.readyState==4 || xmlHttp2.readyState=="complete"){
   document.getElementById("combo2").innerHTML=xmlHttp2.responseText 
}
}

var xmlHttp3;
function showState3(){
    

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

var url= "item_combo3.jsp";
xmlHttp3.onreadystatechange = stateChange3;
xmlHttp3.open("POST", url, false);
xmlHttp3.send(null);
}
function stateChange3(){
if (xmlHttp3.readyState==4 || xmlHttp3.readyState=="complete"){
   document.getElementById("combo3").innerHTML=xmlHttp3.responseText 

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

var perno1=encodeURI(document.getElementById('perno').value);
var name1=encodeURI(document.getElementById('name').value);
var family1=encodeURI(document.getElementById('family').value);

var url= "item_table.jsp";
url += "?val1=" +str+'&perno1='+perno1+'&name1='+name1+'&family1='+family1;
xmlHttp0.onreadystatechange = stateChanget;
xmlHttp0.open("POST", url, false);
xmlHttp0.send(null);

}
function stateChanget(){
if (xmlHttp0.readyState==4 || xmlHttp0.readyState=="complete"){
   document.getElementById("Show_table").innerHTML=xmlHttp0.responseText

}
}


var xmlHttp4;
function showrecords(str){
 
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

var url= "showrecords.jsp";
url += "?val1=" +str;
xmlHttp4.onreadystatechange = staterecords;
xmlHttp4.open("POST", url, false);
xmlHttp4.send(null);

}
function staterecords(){
if (xmlHttp4.readyState==4 || xmlHttp4.readyState=="complete"){
var v=xmlHttp4.responseText;

var strar = v.split(":");
if(strar[1]!=0){
   var list1 = document.getElementById('uname');
   for(ii=0;ii<document.getElementById("uname").options.length;ii++){
      if(list1[ii].value==strar[1]){
        document.getElementById('uname').selectedIndex=ii;
        break;
           }
   }
   document.getElementById('naghsh').selectedIndex=eval(strar[2]);
   document.getElementById('vaheds').selectedIndex=eval(strar[3]);
   document.getElementById('cvahed').value=strar[3];
  //datas.upass.value=strar[4];
  document.getElementById('pass').value=strar[4];
  datas.upass.value="";
  datas.perno.value=strar[5];
  datas.name.value=strar[6];
  datas.family.value=strar[7];
  datas.ghesmat.value=strar[8];
  if(strar[9]==1){
      document.getElementById("c1").checked=true;
      document.getElementById("c1").value="1";
  }else{
      document.getElementById("c1").checked=false;
      document.getElementById("c1").value="";
  }
  if(strar[10]==1){
      document.getElementById("c2").checked=true;
      document.getElementById("c2").value="1";
  }else{
      document.getElementById("c2").checked=false;
      document.getElementById("c2").value="";
  }
  if(strar[11]==1){
      document.getElementById("c3").checked=true;
      document.getElementById("c3").value="1";
  }else{
      document.getElementById("c3").checked=false;
      document.getElementById("c3").value="";
  }
  if(strar[12]==1){
      document.getElementById("c4").checked=true;
      document.getElementById("c4").value="1";
  }else{
      document.getElementById("c4").checked=false;
      document.getElementById("c4").value="";
  }
  if(strar[13]==1){
      document.getElementById("c5").checked=true;
      document.getElementById("c5").value="1";
  }else{
      document.getElementById("c5").checked=false;
      document.getElementById("c5").value="";
  }
  if(strar[14]==1){
      document.getElementById("c6").checked=true;
      document.getElementById("c6").value="1";
  }else{
      document.getElementById("c6").checked=false;
      document.getElementById("c6").value="";
  }
  if(strar[15]==1){
      document.getElementById("c7").checked=true;
      document.getElementById("c7").value="1";
  }else{
      document.getElementById("c7").checked=false;
      document.getElementById("c7").value="";
  }
  if(strar[16]==1){
      document.getElementById("c8").checked=true;
      document.getElementById("c8").value="1";
  }else{
      document.getElementById("c8").checked=false;
      document.getElementById("c8").value="";
  }
  if(strar[17]==1){
      document.getElementById("c9").checked=true;
      document.getElementById("c9").value="1";
  }else{
      document.getElementById("c9").checked=false;
      document.getElementById("c9").value="";
  }
  if(strar[18]==1){
      document.getElementById("c10").checked=true;
      document.getElementById("c10").value="1";
  }else{
      document.getElementById("c10").checked=false;
      document.getElementById("c10").value="";
  }
  if(strar[19]==1){
      document.getElementById("c11").checked=true;
      document.getElementById("c11").value="1";
  }else{
      document.getElementById("c11").checked=false;
      document.getElementById("c11").value="";
  }
  if(strar[20]==1){
      document.getElementById("c12").checked=true;
      document.getElementById("c12").value="1";
  }else{
      document.getElementById("c12").checked=false;
      document.getElementById("c12").value="";
  }
  datas.cp.value=strar[21];
}else{
  datas.upass.value="";
  datas.perno.value="";
  datas.name.value="";
  datas.family.value="";
  datas.ghesmat.value="";
  document.getElementById('uname').selectedIndex=0;
  document.getElementById('naghsh').selectedIndex=0;
  document.getElementById('vaheds').selectedIndex=0;
}
ini_member();
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
                var nuname1=encodeURI(document.getElementById('nuname').value);
                var uname1=encodeURI(document.getElementById('uname').value);
                var naghsh1=encodeURI(document.getElementById('naghsh').value);
                var list = document.getElementById('vaheds');
                for(ii=0;ii<document.getElementById("vaheds").options.length;ii++){
                   if(list[ii].value==document.getElementById('vaheds').value){
                      document.getElementById('vaheds').selectedIndex=ii;
                      document.getElementById('cvahed').value=ii;
                      break;
                   }
                   document.getElementById('cvahed').value=1;
                }
                var cvaheds1=encodeURI(document.getElementById('cvahed').value);
                var upass1=encodeURI(document.getElementById('upass').value);
                var perno1=encodeURI(document.getElementById('perno').value);
                var name1=encodeURIComponent(document.getElementById('name').value);
                var family1=encodeURIComponent(document.getElementById('family').value);
                var ghesmat1=encodeURIComponent(document.getElementById('ghesmat').value);
                var c11=encodeURI(document.getElementById('c1').value);
                var c21=encodeURI(document.getElementById('c2').value);
                var c31=encodeURI(document.getElementById('c3').value);
                var c41=encodeURI(document.getElementById('c4').value);
                var c51=encodeURI(document.getElementById('c5').value);
                var c61=encodeURI(document.getElementById('c6').value);
                var c71=encodeURI(document.getElementById('c7').value);
                var c81=encodeURI(document.getElementById('c8').value);
                var c91=encodeURI(document.getElementById('c9').value);
                var c101=encodeURI(document.getElementById('c10').value);
                var c111=encodeURI(document.getElementById('c11').value);
                var c121=encodeURI(document.getElementById('c12').value);
                nocache=Math.random();
                http.open("POST",'saverecords.jsp?uname1='+uname1+'&naghsh1='+naghsh1+'&cvaheds1='+cvaheds1
                        +'&upass1='+upass1+'&perno1='+perno1+'&name1='+name1
                        +'&family1='+family1+'&ghesmat1='+ghesmat1+'&c11='+c11+'&c21='+c21
                        +'&c31='+c31+'&c41='+c41+'&c51='+c51+'&c61='+c61+'&c71='+c71
                        +'&c81='+c81+'&c91='+c91+'&c101='+c101+'&c111='+c111+'&c121='+c121+'&nuname1='+nuname1+'&nocache='+nocache);
                http.onreadystatechange=insert_update_Reply;
                http.send(null);

}
function insert_update_Reply(){
if(http.readyState==4){
   var response=http.responseText;
   document.getElementById('insert_response').innerHTML=''+response;
   var v=http1.responseText;
var strar = v.split(":");
   var list1 = document.getElementById('uname');
   for(ii=0;ii<document.getElementById("uname").options.length;ii++){
      if(list1[ii].value==strar[1]){
        document.getElementById('uname').selectedIndex=ii;
        break;
           }
   }
   document.getElementById('naghsh').selectedIndex=eval(strar[2]);
   document.getElementById('vaheds').selectedIndex=eval(strar[3]);
  //datas.upass.value=strar[4];
  document.getElementById('pass').value=strar[4];
  datas.upass.value="";
  datas.perno.value=strar[5];
  datas.name.value=strar[6];
  datas.family.value=strar[7];
  datas.ghesmat.value=strar[8];
  if(strar[9]==1){
      document.getElementById("c1").checked=true;
      document.getElementById("c1").value="1";
  }else{
      document.getElementById("c1").checked=false;
      document.getElementById("c1").value="";
  }
  if(strar[10]==1){
      document.getElementById("c2").checked=true;
      document.getElementById("c2").value="1";
  }else{
      document.getElementById("c2").checked=false;
      document.getElementById("c2").value="";
  }
  if(strar[11]==1){
      document.getElementById("c3").checked=true;
      document.getElementById("c3").value="1";
  }else{
      document.getElementById("c3").checked=false;
      document.getElementById("c3").value="";
  }
  if(strar[12]==1){
      document.getElementById("c4").checked=true;
      document.getElementById("c4").value="1";
  }else{
      document.getElementById("c4").checked=false;
      document.getElementById("c4").value="";
  }
  if(strar[13]==1){
      document.getElementById("c5").checked=true;
      document.getElementById("c5").value="1";
  }else{
      document.getElementById("c5").checked=false;
      document.getElementById("c5").value="";
  }
  if(strar[14]==1){
      document.getElementById("c6").checked=true;
      document.getElementById("c6").value="1";
  }else{
      document.getElementById("c6").checked=false;
      document.getElementById("c6").value="";
  }
  if(strar[15]==1){
      document.getElementById("c7").checked=true;
      document.getElementById("c7").value="1";
  }else{
      document.getElementById("c7").checked=false;
      document.getElementById("c7").value="";
  }
  if(strar[16]==1){
      document.getElementById("c8").checked=true;
      document.getElementById("c8").value="1";
  }else{
      document.getElementById("c8").checked=false;
      document.getElementById("c8").value="";
  }
  if(strar[17]==1){
      document.getElementById("c9").checked=true;
      document.getElementById("c9").value="1";
  }else{
      document.getElementById("c9").checked=false;
      document.getElementById("c9").value="";
  }
  if(strar[18]==1){
      document.getElementById("c10").checked=true;
      document.getElementById("c10").value="1";
  }else{
      document.getElementById("c10").checked=false;
      document.getElementById("c10").value="";
  }
  if(strar[19]==1){
      document.getElementById("c11").checked=true;
      document.getElementById("c11").value="1";
  }else{
      document.getElementById("c11").checked=false;
      document.getElementById("c11").value="";
  }
  if(strar[20]==1){
      document.getElementById("c12").checked=true;
      document.getElementById("c12").value="1";
  }else{
      document.getElementById("c12").checked=false;
      document.getElementById("c12").value="";
  }
  
}
}

var http0;
var nocache0=0;
function insert_updatep(){
if(typeof XMLHttpRequest != "undefined"){
   http0= new XMLHttpRequest();
}
else if (window.ActiveXObject){
         http0= new ActiveXObject("Microsoft.XMLHTTP");
}
if (http0==null){
   alert ("Browser does not support XMLHTTP Request");
   return;
}
var perno1=encodeURI(document.getElementById('perno').value);
var name1=encodeURIComponent(document.getElementById('name').value);
var family1=encodeURIComponent(document.getElementById('family').value);
var ghesmat1=encodeURIComponent(document.getElementById('ghesmat').value);
nocache0=Math.random();
http0.open("POST",'saverecords_person.jsp?perno1='+perno1+'&name1='+name1+'&family1='+family1+'&ghesmat1='+ghesmat1
                        +'&nocache0='+nocache0,false);
http0.send(null);

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
var uname1=encodeURI(document.getElementById('uname').value);
var cp1=document.getElementById('cp').value;
var list0 = document.getElementById('uname');
for(iii=0;iii<document.getElementById("uname").options.length;iii++){
    if(list0[iii].value==uname1){
        document.getElementById('uname').selectedIndex=iii;
        var x=document.getElementById("uname");
        var opt=document.getElementById('uname').selectedIndex;
        x.remove(opt);
        break;
    }
}
http1.onreadystatechange=delets_Reply;
http1.open("GET",'deletsrecords.jsp?uname1='+uname1+'&cp1='+cp1,false);
http1.send(null);
}

function delets_Reply(){
if(http1.readyState==4 || http1.readyState=="complete"){
   var v=http1.responseText;
var strar = v.split(":");
   var list1 = document.getElementById('uname');
   for(ii=0;ii<document.getElementById("uname").options.length;ii++){
      if(list1[ii].value==strar[1]){
        document.getElementById('uname').selectedIndex=ii;
        break;
           }
   }
   var list2 = document.getElementById('naghsh');
   for(ii=0;ii<document.getElementById("naghsh").options.length;ii++){
      if(list2[ii].value==strar[2]){
        document.getElementById('naghsh').selectedIndex=ii;
        break;
           }
   }
   var list3 = document.getElementById('vaheds');
   for(ii=0;ii<document.getElementById("vaheds").options.length;ii++){
      if(list3[ii].value==strar[3]){
        document.getElementById('vaheds').selectedIndex=ii;
        break;
           }
   }
  //datas.upass.value=strar[4];
  document.getElementById('pass').value=strar[4];
  datas.upass.value="";
  datas.perno.value=strar[5];
  datas.name.value=strar[6];
  datas.family.value=strar[7];
  datas.ghesmat.value=strar[8];
  if(strar[9]==1){
      document.getElementById("c1").checked=true;
      document.getElementById("c1").value="1";
  }else{
      document.getElementById("c1").checked=false;
      document.getElementById("c1").value="";
  }
  if(strar[10]==1){
      document.getElementById("c2").checked=true;
      document.getElementById("c2").value="1";
  }else{
      document.getElementById("c2").checked=false;
      document.getElementById("c2").value="";
  }
  if(strar[11]==1){
      document.getElementById("c3").checked=true;
      document.getElementById("c3").value="1";
  }else{
      document.getElementById("c3").checked=false;
      document.getElementById("c3").value="";
  }
  if(strar[12]==1){
      document.getElementById("c4").checked=true;
      document.getElementById("c4").value="1";
  }else{
      document.getElementById("c4").checked=false;
      document.getElementById("c4").value="";
  }
  if(strar[13]==1){
      document.getElementById("c5").checked=true;
      document.getElementById("c5").value="1";
  }else{
      document.getElementById("c5").checked=false;
      document.getElementById("c5").value="";
  }
  if(strar[14]==1){
      document.getElementById("c6").checked=true;
      document.getElementById("c6").value="1";
  }else{
      document.getElementById("c6").checked=false;
      document.getElementById("c6").value="";
  }
  if(strar[15]==1){
      document.getElementById("c7").checked=true;
      document.getElementById("c7").value="1";
  }else{
      document.getElementById("c7").checked=false;
      document.getElementById("c7").value="";
  }
  if(strar[16]==1){
      document.getElementById("c8").checked=true;
      document.getElementById("c8").value="1";
  }else{
      document.getElementById("c8").checked=false;
      document.getElementById("c8").value="";
  }
  if(strar[17]==1){
      document.getElementById("c9").checked=true;
      document.getElementById("c9").value="1";
  }else{
      document.getElementById("c9").checked=false;
      document.getElementById("c9").value="";
  }
  if(strar[18]==1){
      document.getElementById("c10").checked=true;
      document.getElementById("c10").value="1";
  }else{
      document.getElementById("c10").checked=false;
      document.getElementById("c10").value="";
  }
  if(strar[19]==1){
      document.getElementById("c11").checked=true;
      document.getElementById("c11").value="1";
  }else{
      document.getElementById("c11").checked=false;
      document.getElementById("c11").value="";
  }
  if(strar[20]==1){
      document.getElementById("c12").checked=true;
      document.getElementById("c12").value="1";
  }else{
      document.getElementById("c12").checked=false;
      document.getElementById("c12").value="";
  }
  swal("Information was deleted.");

}
}
var xmlHttp5;
function validation(){
    

if(typeof XMLHttpRequest != "undefined"){
xmlHttp5= new XMLHttpRequest();
}
else if (window.ActiveXObject){
xmlHttp5= new ActiveXObject("Microsoft.XMLHTTP");
}
if (xmlHttp5==null){
alert ("Browser does not support XMLHTTP Request");
return;
}

var url= "valid_exit.jsp";
xmlHttp5.onreadystatechange = stateedit;
xmlHttp5.open("POST", url, false);
xmlHttp5.send(null);
}
function stateedit(){
if (xmlHttp5.readyState==4 || xmlHttp5.readyState=="complete"){
var v=xmlHttp5.responseText;
var strar = v.split(":");
if(strar[1]=="1"){
    window.location.replace('index.jsp');
}
}
}

</script>
</body>
</html>
