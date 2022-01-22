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
Integer cvahed0_=(Integer)session.getAttribute("cvahed0");
project.accessories ass=new accessories();         
HashMap hm = null;
            
            try {
               Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
               ass.con = java.sql.DriverManager.getConnection(ass.url, ass.id, ass.pass);
               hm = new HashMap();
               hm.put("cvahed",cvahed0_);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            File reportFile = new File(application.getRealPath("reports/report_telathag_e.jasper"));//your report_name.jasper file
            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), hm, ass.con);
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outStream = response.getOutputStream();
            String file="GR"+String.valueOf(Math.round(Math.floor((Math.random()*1000000000)+1)))+".pdf";
            response.addHeader("content-disposition", "attachment;filename="+file);
            outStream.write(bytes, 0, bytes.length);
            outStream.flush();
            outStream.close();
%>
</body>
</html>
