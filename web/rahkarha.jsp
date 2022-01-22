
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
<title>Providing Solutions</title>
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
String name_=(String)session.getAttribute("name_"); 
%>
<font Style="position:absolute; top:2%;right: 2%;font: 16px Arial;color: black">Active User:<%=name_%></font>
<body onload="validation()">
    <link rel="stylesheet" href="css/csstrees1.css">
    <link rel="stylesheet" href="css/cssalert1.css">
    <script src="js/jstree_ps.js"></script>
    <input type="button" value="Back"  onclick="back()" title="Back" style="position:relative;top:16px;left:2%;width:70px;height:30px">
    <section class="sections">    
    <div  id="div_tree"  style="overflow: auto;height: 850px; width: 1060px;position:absolute; background-color: white;font:bold 16px Times New Roman;
     top:40px;left:200px;border:solid thin">
   </div>
    <form METHOD="POST" name="tressr" action="">
    <input type="button" style="position:absolute;top:290px;left:1%;color:black;width:8%;height:4%;font:bold 12px arial" 
           name="button" title="First Select One Cause." value="Providing solution" class="button" onclick="rahkar0()"/>
    <input type="hidden"  name="strkey" id="strkey" value="">   
    <input type="hidden"  name="input" id="input" value="">  
    </form>
    </section>
<script src="js/jquery-1.11.3.min.js"></script>      
<script src="js/jsalert.js" type="text/javascript"></script>    
<script>  
    d = document.getElementById('div_tree');
    resolution = screen.width+' x '+screen.height
    //alert('Your resolution is: ' + resolution);

    if (resolution == "1920 x 1080")
    {
        d.style.height="850px";
    }
    else
    {
        d.style.height="550px";
    }

document.bgColor="#ECE5B6";

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
tree = createTree('div_tree','white',contex_menu);
tree.drawTree();
</script>

<%!
Statement stmt;
Integer ww;
%> 
 <%  
project.accessories ass=new accessories();            
String username0_=(String)session.getAttribute("username0");
Integer cnaghsh0_=(Integer)session.getAttribute("cnaghsh0");
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
   ass.query1 = "SELECT * FROM problemwhys WHERE cvahed=? ORDER BY code_id";
   ass.st = ass.con.prepareStatement(ass.query1);
   ass.st.setInt(1, cvahed0_);
   ass.rs=ass.st.executeQuery();
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
         ww=ass.rs.getInt("wgx");
         ass.query2 = "SELECT * FROM rahkar WHERE id=?";
         ass.st1 = ass.con.prepareStatement(ass.query2);
         ass.st1.setString(1, ass.rs.getString("id"));
         ass.rs1=ass.st1.executeQuery();
         if(ass.rs1.next()){
%>
<script>
 <%=ass.rs.getString(1).trim()%>=<%=ass.rs.getString(4).trim()%>.createChildNode("<%=ass.rs.getString(10).trim()%>"
             +'-'+"<%=ass.rs.getString(2).trim()%>"+' -'+'['+"<%=ww%>"+']',true,'images/why.gif','<%=ass.rs.getString(1).trim()%>','context1');
    
</script>
<%
         }else{
%>
<script>
 <%=ass.rs.getString(1).trim()%>=<%=ass.rs.getString(4).trim()%>.createChildNode("<%=ass.rs.getString(10).trim()%>"
             +'-'+"<%=ass.rs.getString(2).trim()%>"+' -'+'['+"<%=ww%>"+']',true,'images/blue_key.png','<%=ass.rs.getString(1).trim()%>','context1');
</script>
<%
             }
         
    }        
        }
}


catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.rs!=null) ass.rs.close();
   if(ass.rs1!=null) ass.rs1.close();
   if(ass.con!=null) ass.con.close();
}

%>
<script>

function back(){
    var myWindow;
    if(<%=cnaghsh0_%>==1 ||<%=cnaghsh0_%>==5){
        myWindow=window.location.replace('main_menu_u.jsp'); 
    }else{
        myWindow=window.location.replace('main_menu.jsp'); 
    }
}

function rahkar0(){
var strkey; 
if(tree.selectedNode.icon=="images/tree.png"){
    swal( "Providing a solution for ultimate causes is possible");
    return;
}
if(tree.selectedNode.childNodes.length==0){
   strkey=tree.selectedNode.tag;
   document.getElementById("strkey").value=strkey;
   a='rahkarha1.jsp?strkey='+strkey;
   window.location.replace(a);
}else{
   swal( "Providing a solution for ultimate causes is possible"); 
}
} 
var xmlHttp;
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

var url= "valid_exit.jsp";
xmlHttp.onreadystatechange = stateedit;
xmlHttp.open("POST", url, true);
xmlHttp.send(null);
}
function stateedit(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
var v=xmlHttp.responseText;
var strar = v.split(":");
if(strar[1]=="1"){
    window.location.replace('index.jsp');
}
}
}

</script>
<font Style="position:absolute; bottom:2%;left:2%;font: 12px Arial">© 2018 QA Concept</font>
    </body>
</html>
