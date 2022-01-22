<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page  import="java.io.*"%> 
<%@ page  import="java.sql.*"%> 
<%@ page  import="java.sql.Connection"%> 
<%@ page  import="java.sql.DriverManager"%>
<%@ page  import="java.util.HashMap"%>
<%@ page  import="java.util.Map"%>
<%@ page  import="net.sf.jasperreports.engine.*"%>
<%@page import= " project.accessories"%>
<!DOCTYPE html>
 
<html>
  <head>
      <title>Here is the amazing PDF</title>
      <link rel="shortcut icon" type="image-icon" href="images/tree.png">
  </head>
  <body>
<%
project.accessories ass=new accessories();         
String vds_ = request.getParameter("vds"); 
vds_=ass.getu_f(vds_);
HashMap hm = null;
            
            try {
               Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
               ass.con = java.sql.DriverManager.getConnection(ass.url, ass.id, ass.pass);
               ass.query = "SELECT * from rep_rep7 WHERE vahed=? ORDER BY radif";
               ass.st.executeQuery(ass.query);
               ass.st.setString(1, vds_);
               ass.rs=ass.st.executeQuery();
                hm = new HashMap();
                while (ass.rs.next()) {
                     hm.put("radif",ass.rs.getInt("radif"));
                     hm.put("name",ass.rs.getString("name").trim());
                     hm.put("family",ass.rs.getString("family").trim());
                     hm.put("vahed",ass.rs.getString("vahed").trim());
                     hm.put("nelat",ass.rs.getInt("nelat"));
                     hm.put("nrahkar",ass.rs.getInt("nrahkar"));
                     hm.put("nvazn",ass.rs.getInt("nvazn"));
                     hm.put("dates",ass.rs.getString("dates"));
                     hm.put("datee",ass.rs.getString("datee"));
               }
                
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            File reportFile = new File(application.getRealPath("reports/report_rep6g.jasper"));//your report_name.jasper file
            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), hm, ass.con);
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outStream = response.getOutputStream();
            outStream.write(bytes, 0, bytes.length);
            outStream.flush();
            outStream.close();
%>
</body>
</html>
