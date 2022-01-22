
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import= " project.accessories"%>
<%@ page import= "java.sql.*;"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Problem Solving System Login</title>
<link rel="shortcut icon" type="image-icon" href="images/1.ico">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<style type="text/css">
body {
	background-color: white;
}
h2 {
	font-size: 1.5em;
	text-align: center;
        color: green;
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
        font:14pt arial;
}
 
        body, html {
    margin: 0px;
    padding: 0px;
    background-color: #ededed;
    font-family: 'Trebuchet MS';
}

.Container {
    width: 90%;
    min-width: 500px;
    margin: auto;
}

header {
    width: 100%;
    height: 120px;
    line-height: 120px;
    background-color: #313131;
}

    header span {
        color: #fff;
        font-size: 30px;
        padding-left: 20px;
    }

nav {
    width: 100%;
    height: 40px;
    background-color: #ff6a00;
}

.content {
    width: 100%;
    height: 700px;
    padding: 10px 0px;
    background-color: #fff;
}

footer {
    width: 100%;
    height: 80px;
    background-color: #808080;
    margin-bottom: 20px;
}

.main_articles {
    width: 70%;
    float: left;
    height: 650px;
    margin-left: 10px;
}

.side_article {
    width: 25%;
    float: right;
    height: 600px;
    border-left: 1px dotted #6d6d6d;
}

.siteDescription {
    display: -moz-box; /* Firefox*/
    display: -webkit-box; /* Chrome */
    display: -ms-flexbox; /* IE 10 */
    display: flexbox;
    flex-direction: row;
    flex-align:start;
    width: 95%;
    height: 150px;
}

.desImage {
    -webkit-box-ordinal-group: 1; /* iOS 6-, Safari, Opera*/
    -moz-box-ordinal-group: 1; /* Firefox*/
    -ms-flex-order: 1; /* IE 10 */
    -webkit-order: 1; /* Chrome */
    flex-order: 1;
    width: 200px;
    height: 150px;
}

    .desImage img {
        width: 200px;
        height: 150px;
        margin-left: 5px;
        border: 2px solid #6d6d6d;
    }

.des {
    margin-left: 15px;
    -webkit-box-ordinal-group: 2; /* iOS 6-, Safari, Opera*/
    -moz-box-ordinal-group: 2; /* Firefox*/
    -ms-flex-order: 2; /* IE 10 */
    -webkit-order: 2; /* Chrome */
    flex-order: 2;
    width: 70%;
    height: 140px;
    background-color: #e9e9e9;
    padding: 5px;
}

.ads {
    margin: auto;
    margin-top: 10px;
    padding-top: 10px;
}

</style>
<%
project.accessories ass=new accessories();  
String date_;
date_=ass.date_milady();
%>    
<body style="padding-top: 130px" onload="validation()" >
<img src="images/qa.png" width="150" height="150" style="position:absolute;top:12px;left:3%;" />
                <aside class="side_article">
                    <div class="ads">
                        <a href="index.jsp"  >GERMANY</a>
                        <font >| <%=date_%></font>
                    </div>

                </aside>
<section>
  <form id="form1" name="form1" method="post" action="">
    <font Style="position:absolute;top:20%;left:40%;font:26px bold Arial;color: green;">Problem Solving System</font>
    <font Style="position:absolute;top:30%;left:38%;font:16px bold Arial;color: black;height:22px;width:140px">User Name</font> 
    <input  type="text" required class="form-control" name="username" id="login" style="position:absolute;top:34%;left:38%;font:16px Arial;width:25%"> 
    <font Style="position:absolute;top:40%;left:38%;font:16px bold Arial;color: black;height:22px;width:140px">Password</font> 
    <input  type="password" required class="form-control" name="password" id="password" style="position:absolute;top:44%;left:38%;font:16px Arial;width:25%"> 

    <input  type="submit"  class="formStyle" name="submit" id="submit" value="Login" style="position:absolute;top:52%;left:38%;font:16px Arial;width:25%"> 
  </form>
   <p id="demo" style="background-color: red;color: white;position:absolute;top:60%;left:39%;"></p>
 
</section>
<font Style="position:absolute; bottom:2%;left:2%;font: 12px Arial">© 2018 QA Concept</font>
<script src="js/jquery-1.11.3.min.js"></script>
        <%
            String username0_ = request.getParameter("username");
            String pass1_ = request.getParameter("password");
            if (username0_ != null || pass1_ != null) {
                String sql = "select * from passwords where username=? and password=?";
                try {
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    ass.con = java.sql.DriverManager.getConnection(ass.url, ass.id, ass.pass);
                    ass.pst = ass.con.prepareStatement(sql);
                    ass.pst.setString(1, username0_);
                    ass.pst.setString(2, pass1_);
                    ass.rs = ass.pst.executeQuery();

                    if (!ass.rs.next()) {

        %>
        <SCRIPT LANGUAGE="JavaScript">
            document.getElementById("demo").innerHTML = "Invalid Username or Password.Please Try again.";
        </SCRIPT>
        <%      } else {
            session.setAttribute("username0", username0_);
            session.setAttribute("password", pass1_);
            session.setAttribute("ptree", ass.rs.getInt("ptree"));
            session.setAttribute("pvahed", ass.rs.getInt("pvahed"));
            session.setAttribute("padmin", ass.rs.getInt("padmin"));
            session.setAttribute("ppanel", ass.rs.getInt("ppanel"));
            session.setAttribute("cvahed0", ass.rs.getInt("cvahed"));
            session.setAttribute("code0", ass.rs.getString("code"));
            session.setAttribute("naghsh0", ass.rs.getString("naghsh"));
            session.setAttribute("cnaghsh0", ass.rs.getInt("cnaghsh"));
            session.setAttribute("rahkar", ass.rs.getInt("rahkar"));
            session.setAttribute("ynrahkar", ass.rs.getInt("ynrahkar"));
            session.setAttribute("tmojri", ass.rs.getInt("tmojri"));
            session.setAttribute("telatha", ass.rs.getInt("telatha"));
            session.setAttribute("rpt1", ass.rs.getInt("rpt1"));
            session.setAttribute("rpt2", ass.rs.getInt("rpt2"));
            session.setAttribute("rpt3", ass.rs.getInt("rpt3"));
            session.setAttribute("crow", 1);
            session.setAttribute("lang", 1);
        %>
        
        <SCRIPT LANGUAGE="JavaScript">
            var myWindow;
            if(<%=ass.rs.getInt("cnaghsh")%>==1 ||<%=ass.rs.getInt("cnaghsh")%>==5){
               myWindow=window.location.replace('main_menu_u.jsp'); 
            }else{
               myWindow=window.location.replace('main_menu.jsp'); 
            }
            
        </SCRIPT>
        <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (ass.rs != null) {
                        ass.rs.close();
                    }
                    if (ass.rs != null) {
                        ass.rs.close();
                    }
                    if (ass.con != null) {
                        ass.con.close();
                    }
                }
            }

        %>
<script>
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

var url= "validation.jsp";
xmlHttp.open("POST", url, true);
xmlHttp.send(null);
}
</script>
    </body>
</html>
