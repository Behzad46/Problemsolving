
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import ="java.sql.*" %> 
<%@page import= " javax.swing.JOptionPane"%>
<%@page import= " project.accessories"%>
<!DOCTYPE html>
<html>
<head>    
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Problems tree</title>
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
.sections  {
	width: 98%;
	float: right;
	margin-right: 1%;
	margin-top: 0px;
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
<%
    Integer crow_=(Integer)session.getAttribute("crow");
    Integer cnaghsh0_=(Integer)session.getAttribute("cnaghsh0"); 
%>
<%
String name_=(String)session.getAttribute("name_"); 
%>
<font Style="position:absolute; top:2%;right: 2%;font: 16px Arial;color: black">Active User:<%=name_%></font>
<body  onload="validation()">
    <link rel="stylesheet" href="css/csstrees1.css">
    <link rel="stylesheet" href="css/cssalert1.css">
    <script src="js/jstree.js"></script>
    <input type="button" value="Back"  onclick="back()" title="Back" style="position:relative;top:8px;left:2%;width:70px;height:25px">
    <section class="sections">    
        <div  id="div_tree"   ondragover="allowDrop(event)"  style="overflow: auto;height: 850px; width: 1020px;position:absolute; background-color: white;font:bold 16px Times New Roman;
     top:40px;left:200px;border:solid thin;">
   </div>
    <p id="demo" style="position:absolute;top:900px;left:200px;width:300px;background-color: green;color: white;border:solid thin;border-color:#aaaa00;box-shadow: 5px 5px 4px #000000;"></p>
    <form METHOD="POST" name="tress" action="">
    <input type="button"  style="position:absolute;top:60px;color:black;left:1%;width:9%;height:4%;font:bold 12px arial" 
        name="button"  id="i0" value="Refresh" class="button" onclick="refresh()"/>
    <input type="button" style="position:absolute;top:110px;left:1%;color:black;width:9%;height:4%;font:bold 12px arial" 
        name="button" id="i1" value="Add problem" class="button" onclick="insertp0()"/>
        
    <input type="button" style="position:absolute;top:160px;left:1%;color:black;width:9%;height:4%;font:bold 12px arial" 
           name="button" id="i5" value="Add cause" class="button" onmouseover="insert_check()" onclick="inserte0()"/>
    
    <input type="button" style="position:absolute;top:210px;color:black;left:1%;width:9%;height:4%;font:bold 12px arial" 
        name="button" id="i6" value="Delete"  class="button"  onmouseover="insert_check()" onclick="deletpe0()"/>
    
    <input type="button" style="position:absolute;top:260px;color:black;left:1%;width:9%;height:4%;font:bold 12px arial" 
        name="button" id="i7" value="Edit" class="button" onmouseover="insert_check()" onclick="editpe0()"/>
    
    <input type="button" title="Total weights can not less than 100.Please note" style="position:absolute;top:310px;color:black;left:1%;width:9%;height:4%;font:bold 12px arial" 
        name="button" id="i8" value="Weight" class="button" onmouseover="insert_check()" onclick="vaznie()"/>
    
    <input type="button" style="position:absolute;top:360px;color:black;left:1%;width:9%;height:4%;font:bold 12px arial" 
        name="button" id="i2" value="Row Correction" class="button" onclick="radife()"/>
    
    <input type="button" style="position:absolute;top:410px;color:black;left:1%;width:9%;height:4%;font:bold 12px arial" 
           name="button" id="i3" value="Calculate weight" class="button" onclick="calcv()"/>
    
    <input type="button"  style="position:absolute;top:470px;color:black;left:1%;width:9%;height:4%;font:bold 12px arial" 
        name="button"  id="i4" value="Weight Reassign" class="button" onclick="reditv()"/>
    
    <%
        if(crow_==1){%>
    <input type="checkbox"  style="position:absolute;top:520px;color:black;left:1%;width:2%;height:2%" 
           name="crow"  id="crow" value="1" checked onclick="causerow()"/>
    <font Style="position:absolute; top:522px;left:3%;font: 14px Arial">Cause Enumeration</font>
    <% } else { %>       
    <input type="checkbox"  style="position:absolute;top:520px;color:black;left:1%;width:2%;height:2%" 
           name="crow"  id="crow" value="0"  onclick="causerow()"/>
    <font Style="position:absolute; top:522px;left:3%;font: 14px Arial">Cause Enumeration</font>
    <% } %>
    
    
    <input type="hidden"  name="whyx" id="whyx" value="">     
    <input type="hidden"  name="wgxx" id="wgxx" value="">  
    <input type="hidden"  name="input" id="input" value="">  
    <input type="hidden"  name="strkey" id="strkey" value="">     
    <input type="hidden"  name="radif" id="radif" value="">
    <input type="hidden"  name="r2" id="r2" value="0">
    <input type="hidden"  name="ddrag" id="ddrag" value="0">
    </form>
   </section>     

    <font Style="position:absolute; bottom:2%;left:2%;font: 12px Arial">© 2018 QA Concept</font>
<script src="js/jquery-1.11.3.min.js"></script>    
<script src="js/jsalert.js" type="text/javascript"></script>
<%
  if( (cnaghsh0_==2 || cnaghsh0_==3) ){ 
%>      
<script>  
    div_t = document.getElementById('div_tree');
    demo_t = document.getElementById('demo');
    resolution = screen.width+' x '+screen.height
    //alert('Your resolution is: ' + resolution);

    if (resolution == "1920 x 1080")
    {
        div_t.style.height="850px";
        demo_t.style.top="900px";
    }
    else
    {
        div_t.style.height="550px";
        demo_t.style.top="600px";
    }
var contex_menu = {

  'context1' : {
    elements : [
      {
        text : 'Node Actions',
        icon: 'images/blue_key.png',
        action : function(node) {
        },
        submenu: {
          elements : [
            {
              text : 'Describtion/User Info',
              icon: 'images/tree.png',
              action : function(node) {
                  desc_problem0();
              }
            },
            {
              text : 'Expand Subtree',
              icon: 'images/tree.png',
              action : function(node) {
                node.expandSubtree();
              }
            },
            {
              text : 'Collapse Subtree',
              icon: 'images/tree.png',
              action : function(node) {
                node.collapseSubtree();
              }
            },
            {
              text : 'Mark Element Tree',
              icon: 'images/star.png',
              action : function(node) {
                node.selectNodepc();
              }
            }
        ]
        }
      }
    ]
  }
};
</script>
<%
            
}else{
%>
<script>  
var contex_menu = {

  'context1' : {
    elements : [
      {
        text : 'Node Actions',
        icon: 'images/blue_key.png',
        action : function(node) {
        },
        submenu: {
          elements : [
            {
              text : 'Expand Subtree',
              icon: 'images/tree.png',
              action : function(node) {
                node.expandSubtree();
              }
            },
            {
              text : 'Collapse Subtree',
              icon: 'images/tree.png',
              action : function(node) {
                node.collapseSubtree();
              }
            },
            {
              text : 'Mark Element Tree',
              icon: 'images/star.png',
              action : function(node) {
                node.selectNodepc();
              }
            }
        ]
        }
      }
    ]
  }
};
</script>
<%
} 
%>   

<script>
tree = createTree('div_tree','white',contex_menu);
tree.drawTree();

function timedRefresh(timeoutPeriod) {
	setTimeout("location.reload(true);",timeoutPeriod);
}

window.onload = timedRefresh(20000);

//function drawTree(){
//sleep(500);
//refresh();
//}
//function sleep(milliseconds) {
//  const date = Date.now();
//  let currentDate = null;
//  do {
//    currentDate = Date.now();
//  } while (currentDate - date < milliseconds);
//}

</script>
<%!
Statement stmt;
Integer ww;
%> 
 <%  
project.accessories ass=new accessories();        
String username0_=(String)session.getAttribute("username0");
Integer cvahed0_=(Integer)session.getAttribute("cvahed0");
   if (cvahed0_==-1){
   %>
   <script>
       window.location.replace('index.jsp');
   </script>
   <%
   }
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   ass.query = "SELECT * From panel WHERE cvahed=?";
   ass.st = ass.con.prepareStatement(ass.query);
   ass.st.setInt(1, cvahed0_);
   ass.rs1=ass.st.executeQuery();
   if(ass.rs1.next()){
        if((ass.rs1.getInt("ppalayesh")==0) && (cnaghsh0_==1 || cnaghsh0_==5) ){
                  %>
                  <script>
                   div_t = document.getElementById('div_tree');
                   demo_t = document.getElementById('demo');
                   resolution = screen.width+' x '+screen.height
                   //alert('Your resolution is: ' + resolution);

                   if (resolution == "1920 x 1080")
                   {
                     div_t.style.height="850px";
                     demo_t.style.top="900px";
                   }
                   else
                   {
                     div_t.style.height="550px";
                     demo_t.style.top="600px";
                    }
                    document.getElementById("i5").disabled=true;
                    document.getElementById("i6").disabled=true;
                    document.getElementById("i7").disabled=true;
                    document.getElementById("i8").disabled=true;
                    document.getElementById("demo").innerHTML = "Time to refine the causes.please wait...";
                  </script>
                  <%
        }
        if(( ass.rs1.getInt("pelaat")==0 && ass.rs1.getInt("ppalayesh")==1) && ass.rs1.getInt("pvazn")==1 && (cnaghsh0_==1 || cnaghsh0_==5)  ){
            %>
            <script>
                   div_t = document.getElementById('div_tree');
                   demo_t = document.getElementById('demo');
                   resolution = screen.width+' x '+screen.height
                   //alert('Your resolution is: ' + resolution);

                   if (resolution == "1920 x 1080")
                   {
                     div_t.style.height="850px";
                     demo_t.style.top="900px";
                   }
                   else
                   {
                     div_t.style.height="550px";
                     demo_t.style.top="600px";
                    }
             document.getElementById("demo").innerHTML = "Weighing time...";   
             document.getElementById("i5").disabled=true;
             document.getElementById("i6").disabled=true;
             document.getElementById("i7").disabled=true;
             </script>
            <%
        }
        if(( ass.rs1.getInt("pvazn")==0 && ass.rs1.getInt("ppalayesh")==1) && ass.rs1.getInt("pelaat")==1 && (cnaghsh0_==1 || cnaghsh0_==5)   ){
            %>
             <script>
                   div_t = document.getElementById('div_tree');
                   demo_t = document.getElementById('demo');
                   resolution = screen.width+' x '+screen.height
                   //alert('Your resolution is: ' + resolution);

                   if (resolution == "1920 x 1080")
                   {
                     div_t.style.height="850px";
                     demo_t.style.top="900px";
                   }
                   else
                   {
                     div_t.style.height="550px";
                     demo_t.style.top="600px";
                    }
             document.getElementById("demo").innerHTML = "Cause time...";    
             document.getElementById("i8").disabled=true;
             </script>
            <%
        }
   }
   ass.st.close();
   ass.rs1.close();
   
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   ass.query1 = "SELECT * FROM problemwhys WHERE cvahed=? ORDER BY code_id";
   ass.st = ass.con.prepareStatement(ass.query1);
   ass.st.setInt(1, cvahed0_);
   ass.rs=ass.st.executeQuery();
   if((cnaghsh0_==1 || cnaghsh0_==5)){
%>        
<script>  
      document.getElementById("i1").disabled=true;
      document.getElementById("i2").disabled=true;
      document.getElementById("i3").disabled=true;
      document.getElementById("i4").disabled=true;
      document.getElementById("r1").disabled=true;
      document.getElementById("r2").disabled=true;
</script>
<%      
   }
while( ass.rs.next() ){
    if (ass.rs.getString("levels")==null || ass.rs.getString("levels")=="") {
           ass.query = "SELECT * FROM panel WHERE id= ?";
           ass.st1=ass.con.prepareStatement(ass.query);
           ass.st1.setString(1, ass.rs.getString("id"));
           ass.rs1=ass.st1.executeQuery();
           if(ass.rs1.next()){
              if(ass.rs1.getInt("pproblem")==1 && ass.rs1.getInt("ppayan")==0){
%>    
<script>
 <%=ass.rs.getString(1).trim()%>=tree.createNode("<%=ass.rs.getString(10).trim()%>"+'-'+""
             +"<%=ass.rs.getString(2).trim()%>",true,
             'images/tree.png',null,'<%=ass.rs.getString(1).trim()%>','context1');
</script>
<% 
              }
           }
    }else{
        if((cnaghsh0_==2 ||cnaghsh0_==3)){
         if(ass.rs.getInt("tv")==1){
           %>    
            <script>
                document.getElementById("i3").disabled=false;
                document.getElementById("i4").disabled=false;
            </script>
           <% 
         }else{
           %>    
            <script>
                document.getElementById("i3").disabled=false;
                document.getElementById("i4").disabled=false;
            </script>
           <% 
         }
        }
        if((cnaghsh0_==2 ||cnaghsh0_==3) && ass.rs.getInt("tv")==1){
           ww=ass.rs.getInt("wgx");
        }else{
           ass.query = "SELECT * FROM vaznha WHERE  usern = ? and id= ?";
           ass.st1=ass.con.prepareStatement(ass.query);
           ass.st1.setString(1, username0_);
           ass.st1.setString(2, ass.rs.getString(1));
           ass.rs1=ass.st1.executeQuery();
           if (ass.rs1.next()){
              ww=ass.rs1.getInt("wgx");
           }else{ww=0;} 
           ass.rs1.close();
           ass.st1.close();
        }
         ass.query2 = "SELECT * FROM levelha WHERE levels=?";
         ass.st1 = ass.con.prepareStatement(ass.query2);
         ass.st1.setString(1, ass.rs.getString("id"));
         ass.rs1=ass.st1.executeQuery();
         if(ass.rs1.next()){
             if((ass.rs.getInt("tv")==0)){
%>
<script>
    if(document.getElementById("crow").checked==true){
 <%=ass.rs.getString(1).trim()%>=<%=ass.rs.getString(4).trim()%>.createChildNode("<%=ass.rs.getString(10).trim()%>"
             +'-'+"<%=ass.rs.getString(2).trim()%>"+' - '+'['+"<%=ww%>"+']',true,'images/trunk.png','<%=ass.rs.getString(1).trim()%>','context1');
 }else{
 <%=ass.rs.getString(1).trim()%>=<%=ass.rs.getString(4).trim()%>.createChildNode(""
             +"<%=ass.rs.getString(2).trim()%>"+' - '+'['+"<%=ww%>"+']',true,'images/trunk.png','<%=ass.rs.getString(1).trim()%>','context1');
 }
    
</script>
<%
             }else{
                 %>
<script>
    if(document.getElementById("crow").checked==true){
 <%=ass.rs.getString(1).trim()%>=<%=ass.rs.getString(4).trim()%>.createChildNode("<%=ass.rs.getString(10).trim()%>"
             +'-'+"<%=ass.rs.getString(2).trim()%>"+' - '+'['+"<%=ww%>"+']',true,'images/Sigma_Trrunk.png','<%=ass.rs.getString(1).trim()%>','context1');
 }else{
 <%=ass.rs.getString(1).trim()%>=<%=ass.rs.getString(4).trim()%>.createChildNode(""
             +"<%=ass.rs.getString(2).trim()%>"+' - '+'['+"<%=ww%>"+']',true,'images/Sigma_Trrunk.png','<%=ass.rs.getString(1).trim()%>','context1');
 }
    
</script>
                 <%
             }
         }else{
             if((ass.rs.getInt("tv")==0)){
%>
<script>
    if(document.getElementById("crow").checked==true){
 <%=ass.rs.getString(1).trim()%>=<%=ass.rs.getString(4).trim()%>.createChildNode("<%=ass.rs.getString(10).trim()%>"
             +'-'+"<%=ass.rs.getString(2).trim()%>"+' - '+'['+"<%=ww%>"+']',true,'images/leaf.png','<%=ass.rs.getString(1).trim()%>','context1');
 }else{
 <%=ass.rs.getString(1).trim()%>=<%=ass.rs.getString(4).trim()%>.createChildNode(""
             +"<%=ass.rs.getString(2).trim()%>"+' - '+'['+"<%=ww%>"+']',true,'images/leaf.png','<%=ass.rs.getString(1).trim()%>','context1');
 }
    
</script>
<%
             }else{
                 %>
<script>
    if(document.getElementById("crow").checked==true){
 <%=ass.rs.getString(1).trim()%>=<%=ass.rs.getString(4).trim()%>.createChildNode("<%=ass.rs.getString(10).trim()%>"
             +'-'+"<%=ass.rs.getString(2).trim()%>"+' - '+'['+"<%=ww%>"+']',true,'images/Sigma_leaf.png','<%=ass.rs.getString(1).trim()%>','context1');
 }else{
 <%=ass.rs.getString(1).trim()%>=<%=ass.rs.getString(4).trim()%>.createChildNode(""
             +"<%=ass.rs.getString(2).trim()%>"+' - '+'['+"<%=ww%>"+']',true,'images/Sigma_leaf.png','<%=ass.rs.getString(1).trim()%>','context1');
 }
    
</script>
                 <%
             }
         }        
        }
}

}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.rs!=null) ass.rs.close();
   if(ass.con!=null) ass.con.close();
}

%>
<script>
  
function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}



function back(){
    var myWindow;
    if(<%=cnaghsh0_%>==1 ||<%=cnaghsh0_%>==5){
        myWindow=window.location.replace('main_menu_u.jsp'); 
    }else{
        myWindow=window.location.replace('main_menu.jsp'); 
    }
}
function desc_problem0(){
var strkey; 
strkey=tree.selectedNode.tag;
document.getElementById("strkey").value=strkey;
find_textp(strkey);
}

function insert_check(){
   if(<%=cnaghsh0_%>==1 || <%=cnaghsh0_%>==5){
      ins_check(); 
  }   
}

var xmlHttp;
function refresh(){
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

var url= "levelha.jsp";
xmlHttp.open("GET", url, false);
xmlHttp.onreadystatechange = statelevel;
xmlHttp.send();
}
function statelevel(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
    window.location.reload();
}
}

var xmlHttp0;
function causerow(){
    

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

if(document.getElementById("crow").checked==true){
   var url= "crow.jsp";
   url += "?crow0=" +"1";
}else{
   var url= "crow.jsp";
   url += "?crow0=" +"0";
}
xmlHttp0.open("POST", url, false);
xmlHttp0.onreadystatechange = statecrow;
xmlHttp0.send(null);
}
function statecrow(){
if (xmlHttp0.readyState==4 || xmlHttp0.readyState=="complete"){
window.location.reload();
}
}


function insertp0(){
document.getElementById("input").value="";    
swal({
  title: "An input!",
  text: "Enter the Issue:",
  type: "input",
  showCancelButton: true,
  closeOnConfirm: false,
  inputPlaceholder: "Write something"
}, function (inputValue) {
  if (inputValue === false) return false;
  if (inputValue === "") {
    swal.showInputError("You need to write Issue!");
    return false
  }
  swal("Nice!", "You wrote: " + inputValue, "success");
  wyx=inputValue;
  insertp(wyx);
});
}    
var xmlHttp1;
function insertp(str){
 
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

var url= "insert_problem_e.jsp";
url += "?problemt=" +encodeURIComponent(str);
xmlHttp1.open("POST", url, false);
xmlHttp1.onreadystatechange = staterecordsp;
xmlHttp1.send(null);
}
function staterecordsp(){
if (xmlHttp1.readyState==4 || xmlHttp1.readyState=="complete"){
var v=xmlHttp1.responseText;
var strar = v.split(":");
strar[1]=tree.createNode('1-'+""+wyx,true,'images/tree.png',null,strar[1],'context1');
}
}

function inserte0(){

var strkey; 
var whyx="";
var wgxx="0";
var cid="";
strkey=tree.selectedNode.tag;
if(strkey==null || strkey==""){
    return;
}    
cid=(tree.selectedNode.childNodes.length+1).toString();
document.getElementById("input").value="";
swal({
  title: "An input!",
  text: "Enter the Cause:",
  type: "input",
  showCancelButton: true,
  closeOnConfirm: false,
  inputPlaceholder: "Write something"
}, function (inputValue) {
  if (inputValue === false) return false;
  if (inputValue === "") {
    swal.showInputError("You need to write Cause:!");
    return false
  }
  swal("Nice!", "You wrote: " + inputValue, "success");
  whyx=inputValue;
  document.getElementById("whyx").value=whyx;    
  document.getElementById("wgxx").value=wgxx;  
  inserte(whyx,wgxx,strkey,document.getElementById("r2").value,cid);
});
}    
var xmlHttp2;
function inserte(str,str1,str2,str3,str4){
 
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

var yn=encodeURI(document.getElementById("r2").value);
var url= "insert_elaat_e.jsp";
url += "?elaatt=" +encodeURIComponent(str)+'&vazn='+str1+'&strkey='+str2+'&yn='+str3+'&cid='+str4;
xmlHttp2.onreadystatechange = staterecords;
xmlHttp2.open("POST", url, false);
xmlHttp2.send(null);
}

function staterecords(){
if (xmlHttp2.readyState==4 || xmlHttp2.readyState=="complete"){
var v=xmlHttp2.responseText;
var strar = v.split(":");
if(strar[1]=="0" ){
   if(document.getElementById("crow").checked==true){ 
      strar[3]=tree.selectedNode.createChildNode(strar[2]+'-'+document.getElementById("whyx").value+' - '
       +'['+document.getElementById("wgxx").value+']',true,'images/why.gif',strar[3],'context1');
   }else{
      strar[3]=tree.selectedNode.createChildNode(""+document.getElementById("whyx").value+' - '
       +'['+document.getElementById("wgxx").value+']',true,'images/why.gif',strar[3],'context1');
   }    
}
if(strar[1]=="4" ){
   if(document.getElementById("crow").checked==true){ 
      strar[3]=tree.selectedNode.createChildNode(strar[2]+'-'+document.getElementById("whyx").value+' - '
       +'['+document.getElementById("wgxx").value+']',true,'images/why.gif',strar[3],'context1');
   }else{
      strar[3]=tree.selectedNode.createChildNode(""+document.getElementById("whyx").value+' - '
       +'['+document.getElementById("wgxx").value+']',true,'images/why.gif',strar[3],'context1');
   }    
}
if(strar[1]=="1"){
    swal("The cause of time has come to an end.");
}
if(strar[1]=="2"){
    swal("Total weight are more than 100.Please correct.");
}
if(strar[1]=="3"){
    swal("The cause or weighting time for this column is over.");
}
}
}

function findped(str){
document.getElementById("whyx").value=str;
swal({
  title: "Are you sure?",
  text: document.getElementById("whyx").value,
  type: "warning",
  showCancelButton: true,
  confirmButtonClass: "btn-danger",
  confirmButtonText: "Yes, delete!",
  closeOnConfirm: true
},
function(){
if(true){
      strkey=tree.selectedNode.tag;
      if(tree.selectedNode.childNodes.length>0){
         swal("First,delete the subcategories.")
         return false;
      }
      deletpe(strkey);
}
});
}

function deletpe0(){
var strkey; 
strkey=tree.selectedNode.tag;
document.getElementById("strkey").value=strkey;
findped(tree.selectedNode.text);
} 

var xmlHttp3;
function deletpe(str){
 
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

var url= "delet_pe.jsp";
url += "?strkey=" +str;
xmlHttp3.onreadystatechange = staterecordsd;
xmlHttp3.open("POST", url, false);
xmlHttp3.send(null);
}
function staterecordsd(){
if (xmlHttp3.readyState==4 || xmlHttp3.readyState=="complete"){
var v=xmlHttp3.responseText;
var strar = v.split(":");
if(strar[1]=="1" && strar[2]=="7" ){
tree.selectedNode.removeNode();
refresh();
}
if(strar[1]=="2"){
    swal("The cause of time has come to an end.");
}
if(strar[1]=="3"){
    swal( "Dear user,you can not delete the cause.Coordinate with the system administrator.");
}
if(strar[1]=="4"){
    swal( "Dear user,you can not delete the problem.Coordinate with the system administrator.");
}
if(strar[1]=="5"){
    swal( "You are not able to delete.");
}

}
}

function editpe0(){
var strkey; 
strkey=tree.selectedNode.tag;
document.getElementById("strkey").value=strkey;
findpe(strkey);
} 

var xmlHttp4;
function findpe(str){
 
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

var url= "find_pe.jsp";
url += "?strkey=" +str;
xmlHttp4.onreadystatechange = statefind;
xmlHttp4.open("POST", url, false);
xmlHttp4.send(null);
}
function statefind(){
if (xmlHttp4.readyState==4 || xmlHttp4.readyState=="complete"){
var v=xmlHttp4.responseText;
var strar = v.split(":");
document.getElementById("whyx").value=strar[1];
document.getElementById("input").value=strar[1];
swal({
  title: "An input!",
  text: "Correct Issue/Cause:",
  type: "input",
  showCancelButton: true,
  closeOnConfirm: false,
  inputPlaceholder: "Write something"
}, function (inputValue) {
  if (inputValue === false) return false;
  if (inputValue === "") {
    swal.showInputError("You need to write Cause!");
    return false
  }
  swal("Nice!", "You wrote: " + inputValue, "success");
  pe=inputValue;
  editpe(pe,document.getElementById("strkey").value);
});
}
}

var xmlHttp5;
function editpe(str,str1){
 
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
var url= "editpe.jsp";
url += "?whyx=" +encodeURIComponent(str)+'&strkey='+str1;
xmlHttp5.open("POST", url, false);
xmlHttp5.onreadystatechange = stateedit;
xmlHttp5.send(null);
}

function stateedit(){
if (xmlHttp5.readyState==4 || xmlHttp5.readyState=="complete"){
var v=xmlHttp5.responseText;
var strar = v.split(":");
if(strar[1]=="1"){
    swal("The cause of time has come to an end.");
}
if(strar[1]=="2"){
    swal("Dear user,you can not correct the cause.Coordinate with the system administrator.");
}
if(strar[1]=="3"){
    swal("Dear user,you can not correct the problem.Coordinate with the system administrator.");
}
if(strar[1]=="4"){
    swal( "You can not correct the cause.");
}
if(strar[1]=="5" ){
   if(document.getElementById("crow").checked==true){ 
        tree.selectedNode.setText(strar[3]+'-'+pe+' - '+'['+strar[2]+']');
   }else{
        tree.selectedNode.setText(""+pe+' - '+'['+strar[2]+']');
   }    
}
}
}
function vaznie(){
var strkey; 
strkey=tree.selectedNode.tag;
document.getElementById("strkey").value=strkey;
findv(strkey);
} 

var xmlHttp6;
function findv(str){
 
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

var url= "find_v.jsp";
url += "?strkey=" +str;
xmlHttp6.onreadystatechange = statefindv;
xmlHttp6.open("POST", url, false);
xmlHttp6.send(null);
}
function statefindv(){
if (xmlHttp6.readyState==4 || xmlHttp6.readyState=="complete"){
var v=xmlHttp6.responseText;
var strar = v.split(":");
document.getElementById("wgxx").value=strar[1];
document.getElementById("input").value=strar[1];
swal({
  title: document.getElementById("wgxx").value,
  text: "Enrer weight:",
  type: "input",
  showCancelButton: true,
  closeOnConfirm: false,
  inputPlaceholder: "Write something"
}, function (inputValue) {
  if (inputValue === false) return false;
  if (inputValue === "") {
    swal.showInputError("You need to write Weight!");
    return false
  }
  if (inputValue === "0") {
    swal.showInputError("Weight can not be Zero!");
    return false
  }
  if (inputValue.substr(0,1)=="0"){
     swal.showInputError("The weight should not start with zero.")
     return false;
  } 
  for (i = 0; i < inputValue.length; i++) {
      if (!(inputValue.substr(i,1)>="0" && inputValue.substr(i,1)<="9")) {
            swal.showInputError("The amount of weight should be a number.")
            return false;
      }
 }
  vzn=inputValue;
  swal("Nice!", "You wrote: " + inputValue, "success");
  editv(vzn,document.getElementById("strkey").value);
});
}
}

var xmlHttp7;
function editv(str,str1){
 
if(typeof XMLHttpRequest != "undefined"){
xmlHttp7= new XMLHttpRequest();
}
else if (window.ActiveXObject){
xmlHttp7= new ActiveXObject("Microsoft.XMLHTTP");
}
if (xmlHttp7==null){
alert ("Browser does not support XMLHTTP Request");
return;
}

var url= "editv_e.jsp";
url += "?wgxx=" +str+'&strkey='+str1;
xmlHttp7.onreadystatechange = stateeditv;
xmlHttp7.open("POST", url, false);
xmlHttp7.send(null);
}

function stateeditv(){
if (xmlHttp7.readyState==4 || xmlHttp7.readyState=="complete"){
var v=xmlHttp7.responseText;
var strar = v.split(":");
if(strar[1]=="1"){
    swal("The weight of time has come to an end.");
}
if(strar[1]=="2"){
    swal("The respectable user of the weight calculation has been done and you are not able to coorect the weight.Coordinate with the system administrator.");
}
if(strar[1]=="3"){
    swal("The problem is lacking in weight.");
}
if(strar[1]=="4"){
    swal("Total weight are more than 100.Please correct.");
}
if(strar[1]=="5" ){
   if(document.getElementById("crow").checked==true){ 
       tree.selectedNode.setText(strar[3]+'-'+strar[2]+' - '+'['+vzn+']');
   }else{
       tree.selectedNode.setText(""+strar[2]+' - '+'['+vzn+']');
   }    
}
if(strar[1]=="6" ){
   if(document.getElementById("crow").checked==true){ 
       tree.selectedNode.setText(strar[3]+'-'+strar[2]+' - '+'['+vzn+']');
   }else{
       tree.selectedNode.setText(""+strar[2]+' - '+'['+vzn+']');
   }    
}
}
}

function radife(){
var strkey; 
strkey=tree.selectedNode.tag;
document.getElementById("strkey").value=strkey;
findr(strkey);
} 

var xmlHttp8;
function findr(str){
 
if(typeof XMLHttpRequest != "undefined"){
xmlHttp8= new XMLHttpRequest();
}
else if (window.ActiveXObject){
xmlHttp8= new ActiveXObject("Microsoft.XMLHTTP");
}
if (xmlHttp8==null){
alert ("Browser does not support XMLHTTP Request");
return;
}

var url= "find_r.jsp";
url += "?strkey=" +str;
xmlHttp8.onreadystatechange = statefindr;
xmlHttp8.open("POST", url, false);
xmlHttp8.send(null);
}
function statefindr(){
if (xmlHttp8.readyState==4 || xmlHttp8.readyState=="complete"){
var v=xmlHttp8.responseText;
var strar = v.split(":");
document.getElementById("radif").value=strar[1];
swal({
  title: document.getElementById("radif").value,
  text: "Correct the row:",
  type: "input",
  showCancelButton: true,
  closeOnConfirm: false,
  inputPlaceholder: "Write something"
}, function (inputValue) {
  if (inputValue === false) return false;
  if (inputValue === "") {
    swal.showInputError("You need to write Cause Row:!");
    return false
  }
  swal("Nice!", "You wrote: " + inputValue, "success");
  rd=inputValue;
  editrd(rd,document.getElementById("strkey").value);
});
}
}
var xmlHttp9;
function editrd(str,str1){
 
if(typeof XMLHttpRequest != "undefined"){
xmlHttp9= new XMLHttpRequest();
}
else if (window.ActiveXObject){
xmlHttp9= new ActiveXObject("Microsoft.XMLHTTP");
}
if (xmlHttp9==null){
alert ("Browser does not support XMLHTTP Request");
return;
}

var url= "editr.jsp";
url += "?radif=" +str+'&strkey='+str1;
xmlHttp9.onreadystatechange = stateeditr;
xmlHttp9.open("POST", url, false);
xmlHttp9.send(null);
}

function stateeditr(){
if (xmlHttp9.readyState==4 || xmlHttp9.readyState=="complete"){
var v=xmlHttp9.responseText;
var strar = v.split(":");
if(strar[1]=="0" ){
   swal("You are not able to correct rows.");
}
if(strar[1]=="1" ){
   if(document.getElementById("crow").checked==true){ 
      tree.selectedNode.setText(rd+'-'+strar[2]+' - '+'['+strar[3]+']');
   }else{
      tree.selectedNode.setText(""+strar[2]+' - '+'['+strar[3]+']');
   }    
}
}
}
function calcv(){
swal({
  title: "Are you sure?",
  text: "Weight calculation performed",
  type: "warning",
  showCancelButton: true,
  confirmButtonClass: "btn-danger",
  confirmButtonText: "Yes, Page Refresh !",
  closeOnConfirm: false
},
function(){
if(true){
    calc_v();
    refresh();
    location.reload(true);
}
});


} 

var xmlHttp10;
function calc_v(){
 
if(typeof XMLHttpRequest != "undefined"){
xmlHttp10= new XMLHttpRequest();
}
else if (window.ActiveXObject){
xmlHttp10= new ActiveXObject("Microsoft.XMLHTTP");
}
if (xmlHttp10==null){
alert ("Browser does not support XMLHTTP Request");
return;
}

var url= "calc_v.jsp";
xmlHttp10.open("POST", url, false);
xmlHttp10.send(null);
}

function reditv(){
swal({
  title: "Are you sure?",
  text: "The possibility of weight reassignment is provided",
  type: "warning",
  showCancelButton: true,
  confirmButtonClass: "btn-danger",
  confirmButtonText: "Yes, Page Refresh !",
  closeOnConfirm: false
},
function(){
if(true){
    redit_v();
    refresh();
    location.reload(true);
}
});
} 

var xmlHttp11;
function redit_v(){
 
if(typeof XMLHttpRequest != "undefined"){
xmlHttp11= new XMLHttpRequest();
}
else if (window.ActiveXObject){
xmlHttp11= new ActiveXObject("Microsoft.XMLHTTP");
}
if (xmlHttp11==null){
alert ("Browser does not support XMLHTTP Request");
return;
}

var url= "redit_v.jsp";
xmlHttp11.open("POST", url, false);
xmlHttp11.send(null);
}

var xmlHttp12;
function find_textp(str){
 
if(typeof XMLHttpRequest != "undefined"){
xmlHttp12= new XMLHttpRequest();
}
else if (window.ActiveXObject){
xmlHttp12= new ActiveXObject("Microsoft.XMLHTTP");
}
if (xmlHttp12==null){
alert ("Browser does not support XMLHTTP Request");
return;
}

var url= "find_textp_e.jsp";
url += "?strkey=" +str;
xmlHttp12.onreadystatechange = statefindtp;
xmlHttp12.open("POST", url, false);
xmlHttp12.send(null);
}
function statefindtp(){
if (xmlHttp12.readyState==4 || xmlHttp12.readyState=="complete"){
var v=xmlHttp12.responseText;
var strar = v.split(":");
swal(strar[2]);

}
}

var xmlHttp13;
function ins_check(){
 
if(typeof XMLHttpRequest != "undefined"){
xmlHttp13= new XMLHttpRequest();
}
else if (window.ActiveXObject){
xmlHttp13= new ActiveXObject("Microsoft.XMLHTTP");
}
if (xmlHttp13==null){
alert ("Browser does not support XMLHTTP Request");
return;
}

var url= "ins_check.jsp";
xmlHttp13.onreadystatechange = statecheck;
xmlHttp13.open("POST", url, false);
xmlHttp13.send(null);
}

function statecheck(){
if (xmlHttp13.readyState==4 || xmlHttp13.readyState=="complete"){
var v=xmlHttp13.responseText;
var strar = v.split(":");
if(strar[1]==3 ){
if(strar[2]==1 ){
    if(document.getElementById("i8").disabled==false){
       window.location.reload();
    }
    document.getElementById("i5").disabled=false;
    document.getElementById("i6").disabled=false;
    document.getElementById("i7").disabled=false;
    document.getElementById("i8").disabled=true;
}
if(strar[2]==0){
    if(document.getElementById("i5").disabled==false || document.getElementById("i6").disabled==false || document.getElementById("i7").disabled==false){
       window.location.reload();
    }
    document.getElementById("i5").disabled=true;
    document.getElementById("i6").disabled=true;
    document.getElementById("i7").disabled=true;
    document.getElementById("i8").disabled=false;
}
}
if(strar[1]==2 ){
    document.getElementById("i5").disabled=true;
    document.getElementById("i6").disabled=true;
    document.getElementById("i7").disabled=true;
    document.getElementById("i8").disabled=true;
}
}
}
var xmlHttp14;
function validation(){
    

if(typeof XMLHttpRequest != "undefined"){
xmlHttp14= new XMLHttpRequest();
}
else if (window.ActiveXObject){
xmlHttp14= new ActiveXObject("Microsoft.XMLHTTP");
}
if (xmlHttp14==null){
alert ("Browser does not support XMLHTTP Request");
return;
}

var url= "valid_exit.jsp";
xmlHttp14.onreadystatechange = stateedit1;
xmlHttp14.open("POST", url, false);
xmlHttp14.send(null);
}
function stateedit1(){
if (xmlHttp14.readyState==4 || xmlHttp14.readyState=="complete"){
var v=xmlHttp14.responseText;
var strar = v.split(":");
if(strar[1]=="1"){
    window.location.replace('index.jsp');
}
}
}

</script>
    </body>
</html>
