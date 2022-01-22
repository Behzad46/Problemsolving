<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Send an e-mail with attachment</title>
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
footer {
	font-size: small;
	text-align: center;
	clear: both;
	position: fixed;
	left: 0px;
	bottom: 0px;
	height: 84px;
	width: 100%;
	padding-top: 60px;
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
	margin-top: 30px;
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
    
</style>
<body>
<section class="sectionRight">
  <h2>Send Report E-mail</h2>
  <form  method="post" action="">
    <label for="textfield" >Recipient address</label>
    <br>
    <input  type="email" required class="formStyle" name="recipient" id="recipient" > 
    <br>
    <label for="textfield">Subject</label>
    <br>
    <input type="text"  class="formStyle" name="subject" id="subject"  > 
    <br>
    <label for="textfield">Content</label>
    <br>
    <textarea type="text" required class="formStyle" name="content" id="content"  ></textarea> 
    <br>
    <label for="textfield">Attach file</label>
    <br>
    <input type="file"  class="formStyle" name="file" id="file"  > 
    <br>
    <input type="submit"  name="submit" class="formStyle" value="Send" onclick="mail()">
    
  </form>
</section>
<footer>Copyright 2018.Made with 100% Recycled pixels.</footer>
<script src="js/jquery-1.11.3.min.js"></script>
<script>
function mail(){
    str1=document.getElementById("recipient").value;
    str2=document.getElementById("subject").value;
    str3=document.getElementById("content").value;
    str4=document.getElementById("file").value;
   var url= 'mail.jsp';
   url += '?recipient=' +str1+'&subject='+str2+'&content='+str3+'&file='+str4;
   window.open(url);
}
</script></body>
</html>
