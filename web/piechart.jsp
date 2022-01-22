<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import ="java.sql.*" %> 
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
<%@page import= " java.text.NumberFormat"%>
<body>
    <div  id="piechart"  style="overflow: auto;position:relative;top:-5px;left:300px;">
   </div>

<script type="text/javascript" src="js/loader.js"></script>

<script type="text/javascript">
// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

// Draw the chart and set the chart values
function drawChart() {
    var jselaat_="";
    var jstitle_="";
    var jsvazn_=0;
    var telatha=[];
    telatha.push(['elaat', 'vazn']);
 <%  
project.accessories ass=new accessories();          
//String strkey = request.getParameter("strkey"); 
//String problemtxt = request.getParameter("problemtxt"); 
//Integer cvahed0_=(Integer)session.getAttribute("cvahed0");
String te;
String title_="";
String elaat_="";
Double vazn_=0.0;
Integer vazn1_;
Integer i;
//te=ass.ctelatha(cvahed0_, strkey,problemtxt);
try{
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
   String sql1 = "SELECT * from resultx WHERE cvahed=? ORDER BY vazn DESC";
   ass.pst=ass.con.prepareStatement(sql1);
   ass.pst.setInt(1, 1);
   ass.rs=ass.pst.executeQuery();
   i=1;
while( ass.rs.next() ){
    title_=ass.rs.getString("problemtxt").trim();
    elaat_=ass.rs.getString("elaat").trim();
    vazn_=ass.rs.getDouble("vazn");
    vazn_=Math.rint(vazn_*100);
    i=i+1;
    //vazn1_=i;
    %>
    jselaat_="<%=elaat_%>";
    jstitle_="<%=title_%>";
    jsvazn_=<%=vazn_%>;
    telatha.push([jselaat_, jsvazn_]);
    <%        
}
%>
        alert(telatha);
  var data = google.visualization.arrayToDataTable(telatha);

  // Optional; add a title and set the width and height of the chart
  var options = {'title':jstitle_, 'width':700, 'height':400};

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  chart.draw(data, options);
<%
}
catch(Exception e){
    e.printStackTrace();}
finally{
   if(ass.rs!=null) ass.rs.close();
   if(ass.con!=null) ass.con.close();
}

%>
}
</script>

</body>
</html>
