<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import= " project.accessories"%>
<%@page import= " java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
        <title>سیستم حل مسئلهProblem Solving </title>
<h2 style="text-align:center;font:14pt tahoma;">سیستم حل مسئله با الگوریتم طوفان ذهنی- چرا؟چرا؟</h2>
<h2 style="text-align:center;font:14pt tahoma; color: #3e8e41">Creative Problem Solving</h2>
<a> 
<img src="jpg/why-why-2.jpg"  width="97%" height="97%" alt=""
	border=0 style="border-color:#ffffff;position:absolute;top:1px;left:1px ">
</a>

<style>
.dropbtn {
    background-color:  #0273dd;
    color: white;
    font-size: 16px;
    font-family:Tahoma;
    border: none;
    cursor: pointer;
    width:76px;height:30px;box-shadow: 2px 2px 1px #000000;
}

.dropbtn:hover, .dropbtn:focus {
    background-color: #3e8e41;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #fad5d5;
    min-width: 500px;
    top:50px;
    right:5%;
    overflow: auto;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown a:hover {background-color:  #ffcc66}

.show {display:block;}


</style>
<style>
    .dropbtn1 {
    background-color: #0273dd;
    color: white;
    font-size: 16px;
    font-family:Tahoma;
    border: none;
    cursor: pointer;
    width:76px;height:30px;box-shadow: 2px 2px 1px #000000;
}

.dropbtn1:hover, .dropbtn1:focus {
    background-color: #3e8e41;
}

.dropdown1 {
    position: relative;
    display: inline-block;
}

.dropdown-content1 {
    display: none;
    position: absolute;
    background-color: #fad5d5;
    min-width: 230px;
    top:50px;
    right:10%;
    overflow: auto;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content1 a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown1 a:hover {background-color: #ffcc66}

.show {display:block;}

</style>
<style>
    .dropbtn2 {
    background-color: #0273dd;
    color: white;
    font-size: 16px;
    font-family:Tahoma;
    border: none;
    cursor: pointer;
    width:76px;height:30px;box-shadow: 2px 2px 1px #000000;
}

.dropbtn2:hover, .dropbtn2:focus {
    background-color: #3e8e41;
}

.dropdown2 {
    position: relative;
    display: inline-block;
}

.dropdown-content2 {
    display: none;
    position: absolute;
    background-color: #fad5d5;
    min-width: 580px;
    top:50px;
    right:18%;
    overflow: auto;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content2 a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown2 a:hover {background-color: #ffcc66}

.show {display:block;}

</style>
<style>
    .dropbtn3 {
    background-color: #0273dd;
    color: white;
    font-size: 16px;
    font-family:Tahoma;
    border: none;
    cursor: pointer;
    width:76px;height:30px;box-shadow: 2px 2px 1px #000000;
}

.dropbtn3:hover, .dropbtn3:focus {
    background-color: #3e8e41;
}

.dropdown3 {
    position: relative;
    display: inline-block;
}

.dropdown-content3 {
    display: none;
    position: absolute;
    background-color: #fad5d5;
    min-width: 200px;
    top:50px;
    right:18%;
    overflow: auto;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content3 a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown3 a:hover {background-color: #ffcc66}

.show {display:block;}

</style>

</head>

<body>


    <div class="dropdown" style="top:30px;left:70%;">
        <button  onclick="myFunction()" class="dropbtn" >عملیات</button>
<div id="myDropdown" class="dropdown-content" >
    <a href="#trees" onclick="ptress()" style="text-align:right;font:14pt tahoma;" >درخت مسئله</a>
    <a href="#menu2" onclick="rahkar()" style="text-align:right;font:14pt tahoma;">ارائه راهکارها</a>
    <a href="#menu3" onclick="ynrahkar()" style="text-align:right;font:14pt tahoma;" >تایید/عدم تایید راهکارهای پیشنهادی</a>
    <a href="#menu4" onclick="tmojri()" style="text-align:right;font:14pt tahoma;">تعیین مجری/اقدام کننده/مسئول انجام راهکارهای تایید شده</a>
    <a href="#menu5" onclick="telatha()" style="text-align:right;font:14pt tahoma;">تشخیص مهمترین علتها</a>
  </div>
</div>
    <div class="dropdown1" style="top:30px;left:50%;">
<button onclick="myFunction1()" class="dropbtn1" >تعاریف</button>
<div id="myDropdown1" class="dropdown-content1" >
    <a href="#vahedha" onclick="pvahedha()" style="text-align:right;font:14pt tahoma;">تعریف واحد/کمیته</a>
    <a href="#users" onclick="pusers()" style="text-align:right;font:14pt tahoma;">تعریف کاربران</a>
    <a href="#control_panel" onclick="ppanel()" style="text-align:right;font:14pt tahoma;">کنترل پانل واحد/کمیته</a>
  </div>
</div>
    <div class="dropdown2" style="top:30px;left:29%;">
<button onclick="myFunction2()" class="dropbtn2" >گزارشات</button>
<div id="myDropdown2" class="dropdown-content2" >
    <a href="#menu10" onclick="relatha()"  style="text-align:right;font:14pt tahoma;">گزارش تشخیص مهمترین علتها برای هر مسئله</a>
    <a href="#menu11" onclick="rep_rahkarha()" style="text-align:right;font:14pt tahoma;">گزارش راهکارها/اقدام های پیشنهادی</a>
    <a href="#menu12" onclick="rtelatha_rahkar()" style="text-align:right;font:14pt tahoma;">گزارش تشخیص مهمترین علتها با ارائه راهکارهاواقدام کننده ها</a>
    <a href="#menu13" onclick="rep_rep4()" style="text-align:right;font:14pt tahoma;">گزارش مسئه های بررسی شده در هر واحد/کمیته</a>
    <a href="#menu14" onclick="rep_rep5()" style="text-align:right;font:14pt tahoma;">گزارش عملکرد واحدها/کمیته ها</a>
    <a href="#menu15" onclick="rep_rep6()" style="text-align:right;font:14pt tahoma;">گزارش عملکرد اعضاء در واحد/کمیته</a>
    <a href="#menu16" onclick="rep_rep7()" style="text-align:right;font:14pt tahoma;">گزارش تشخیص مهمترین علتها با ارائه راهکار برای هر واحد/کمیته</a>
  </div>
</div>
    <div class="dropdown3" style="top:30px;left:9%;">
<button onclick="myFunction3()" class="dropbtn3" >سیستم</button>
<div id="myDropdown3" class="dropdown-content3" >
    <a href="#menu17" onclick="edit_pass()" style="text-align:right;font:14pt tahoma;">تغییر رمز</a>
    <a href="#menu19" onclick="exit()" style="text-align:right;font:14pt tahoma;">خروج از سیستم</a>
  </div>
</div>
<%
project.accessories ass=new accessories();                  
Integer ptree_=(Integer)session.getAttribute("ptree");
Integer pvahed_=(Integer)session.getAttribute("pvahed");
Integer padmin_=(Integer)session.getAttribute("padmin");
Integer ppanel_=(Integer)session.getAttribute("ppanel");
Integer rahkar_=(Integer)session.getAttribute("rahkar");
Integer ynrahkar_=(Integer)session.getAttribute("ynrahkar");
Integer tmojri_=(Integer)session.getAttribute("tmojri");
Integer telatha_=(Integer)session.getAttribute("telatha");
Integer rpt1_=(Integer)session.getAttribute("rpt1");
Integer rpt2_=(Integer)session.getAttribute("rpt2");
Integer rpt3_=(Integer)session.getAttribute("rpt3");
String username0_=(String)session.getAttribute("username0"); 
Integer cnaghsh0_=(Integer)session.getAttribute("cnaghsh0"); 
String date_,name_;
date_=ass.date_convert();
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   ass.query = "SELECT * From passwords WHERE username=?";
   ass.st = ass.con.prepareStatement(ass.query);
   ass.st.setString(1, username0_);
   ass.rs1=ass.st.executeQuery();
   if (ass.rs1.next()) {
     name_=ass.rs1.getString("name")+" "+ass.rs1.getString("family");
   %>
     <%--<div style="position:absolute;bottom: 70px; left:  auto;color:#000066;font:18px Arial;"><%=name_%></div>
     <div style="position:absolute;bottom: 40px; left:  auto;color:#000066;font:18px Arial;"><%=date_+":تاريخ" %></div>
     <img src="gif/Gnome exit.gif" style="position:absolute;top:620px; left:10%;color:#ECE5B6" > --%>
     <div style="position:absolute;top:550px;left:5%;color:#000066;font:18px Arial;"><%=name_%></div>
     <div style="position:absolute;top:600px;left:5%;color:#000066;font:18px Arial;"><%=date_+":تاريخ" %></div>
   <%
   }
}   
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.con!=null) ass.con.close();
}
%>
<%--<div style="position:absolute;top:600px;left:85%;color: black;font:18px Arial;">طراح و برنامه نویس</div>
     <div style="position:absolute;top:620px;left:87%;color:#000066;font:18px Arial;">بهزاد حسنوند </div>
      <div style="position:absolute;top:640px;left:85%;color:#000066;font:18px Arial;">0916-622-7548</div> --%>
<script>
    document.bgColor="#ECE5B6";
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function ptress() {
    if ("<%=ptree_%>"==1) {
       window.open("trees.jsp");
    } else {
        alert( "شما اجازه ورود ندارید.با مدیر سیستم تماس بگیرید.");
    }
}

function pvahedha() {
    if ("<%=pvahed_%>"==1) {
        window.open("vahedha.jsp");
    } else {
        alert( "شما اجازه ورود ندارید.با مدیر سیستم تماس بگیرید.");
    }
}

function pusers() {
    if ("<%=padmin_%>"==1 || "<%=username0_%>"=="admin") {
        window.open("ini_pass.jsp");
    } else {
        alert( "شما اجازه ورود ندارید.با مدیر سیستم تماس بگیرید.");
    }
}

function ppanel() {
    if ("<%=ppanel_%>"==1) {
       window.open("control_panel.jsp");
    } else {
        alert( "شما اجازه ورود ندارید.با مدیر سیستم تماس بگیرید.");
    }
}
function rahkar() {
    if ("<%=rahkar_%>"==1) {
       window.open("rahkarha.jsp");
    } else {
        alert( "شما اجازه ورود ندارید.با مدیر سیستم تماس بگیرید.");
    }
}
function ynrahkar() {
    if ("<%=ynrahkar_%>"==1) {
       window.open("f_ynrahkarha.jsp");
    } else {
        alert( "شما اجازه ورود ندارید.با مدیر سیستم تماس بگیرید.");
    }
}
function tmojri() {
    if ("<%=tmojri_%>"==1) {
       window.open("f_mojri.jsp");
    } else {
        alert( "شما اجازه ورود ندارید.با مدیر سیستم تماس بگیرید.");
    }
}
function telatha() {
    if ("<%=telatha_%>"==1) {
       window.open("telatha.jsp");
    } else {
        alert( "شما اجازه ورود ندارید.با مدیر سیستم تماس بگیرید.");
    }
}
function relatha() {
    if ("<%=rpt1_%>"==1) {
       window.open("rtelatha.jsp");
    } else {
        alert( "شما اجازه ورود ندارید.با مدیر سیستم تماس بگیرید.");
    }
}
function rep_rahkarha() {
    if ("<%=rpt2_%>"==1) {
       window.open("rep_rahkarha.jsp");
    } else {
        alert( "شما اجازه ورود ندارید.با مدیر سیستم تماس بگیرید.");
    }
}
function rtelatha_rahkar() {
    if ("<%=rpt3_%>"==1) {
       window.open("rtelatha_rahkar.jsp");
    } else {
        alert( "شما اجازه ورود ندارید.با مدیر سیستم تماس بگیرید.");
    }
}
function rep_rep4() {
    if ("<%=cnaghsh0_%>"==2 ||"<%=cnaghsh0_%>"==3) {
       window.open("rep_rep4.jsp");
    } else {
        alert( "شما اجازه ورود ندارید.با مدیر سیستم تماس بگیرید.");
    }
}
function rep_rep5() {
    if ("<%=cnaghsh0_%>"==2 ||"<%=cnaghsh0_%>"==3) {
       window.open("rep_rep5.jsp");
    } else {
        alert( "شما اجازه ورود ندارید.با مدیر سیستم تماس بگیرید.");
    }
}
function rep_rep6() {
    if ("<%=cnaghsh0_%>"==2 ||"<%=cnaghsh0_%>"==3) {
       window.open("rep_rep6.jsp");
    } else {
        alert( "شما اجازه ورود ندارید.با مدیر سیستم تماس بگیرید.");
    }
}
function rep_rep7() {
    if ("<%=cnaghsh0_%>"==2 ||"<%=cnaghsh0_%>"==3) {
       window.open("rep_rep7.jsp");
    } else {
        alert( "شما اجازه ورود ندارید.با مدیر سیستم تماس بگیرید.");
    }
}
function edit_pass() {
    window.open("edit_pass.jsp");
}
function exit() {
    window.close();
}

function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
  if (!event.target.matches('.dropbtn1')) {

    var dropdowns = document.getElementsByClassName("dropdown-content1");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
  if (!event.target.matches('.dropbtn2')) {

    var dropdowns = document.getElementsByClassName("dropdown-content2");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
  if (!event.target.matches('.dropbtn3')) {

    var dropdowns = document.getElementsByClassName("dropdown-content3");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
function myFunction1() {
    document.getElementById("myDropdown1").classList.toggle("show");
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
  if (!event.target.matches('.dropbtn1')) {

    var dropdowns = document.getElementsByClassName("dropdown-content1");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
  if (!event.target.matches('.dropbtn2')) {

    var dropdowns = document.getElementsByClassName("dropdown-content2");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
  if (!event.target.matches('.dropbtn3')) {

    var dropdowns = document.getElementsByClassName("dropdown-content3");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
function myFunction2() {
    document.getElementById("myDropdown2").classList.toggle("show");
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
  if (!event.target.matches('.dropbtn1')) {

    var dropdowns = document.getElementsByClassName("dropdown-content1");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
  if (!event.target.matches('.dropbtn2')) {

    var dropdowns = document.getElementsByClassName("dropdown-content2");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
  if (!event.target.matches('.dropbtn3')) {

    var dropdowns = document.getElementsByClassName("dropdown-content3");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
function myFunction3() {
    document.getElementById("myDropdown3").classList.toggle("show");
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
  if (!event.target.matches('.dropbtn1')) {

    var dropdowns = document.getElementsByClassName("dropdown-content1");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
  if (!event.target.matches('.dropbtn2')) {

    var dropdowns = document.getElementsByClassName("dropdown-content2");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
  if (!event.target.matches('.dropbtn3')) {

    var dropdowns = document.getElementsByClassName("dropdown-content3");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
  if (!event.target.matches('.dropbtn1')) {

    var dropdowns = document.getElementsByClassName("dropdown-content1");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
  if (!event.target.matches('.dropbtn2')) {

    var dropdowns = document.getElementsByClassName("dropdown-content2");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
  if (!event.target.matches('.dropbtn3')) {

    var dropdowns = document.getElementsByClassName("dropdown-content3");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
</script>

</body>
</html>
