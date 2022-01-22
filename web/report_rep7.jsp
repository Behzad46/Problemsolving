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
HashMap hm = null;
            
            try {
               Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
               ass.con = java.sql.DriverManager.getConnection(ass.url, ass.id, ass.pass);
               ass.query = "SELECT * from resultx_rahkar_rep6  ORDER BY radif";
               ass.st.executeQuery(ass.query);
               ass.rs=ass.st.executeQuery();
                hm = new HashMap();
                while (ass.rs.next()) {
                     hm.put("radif",ass.rs.getInt("radif"));
                     hm.put("code_id",ass.rs.getString("code_id").trim());
                     hm.put("elaat",ass.rs.getString("elaat").trim());
                     hm.put("rahkar",ass.rs.getString("rahkar"));
                     hm.put("mojri",ass.rs.getString("mojri"));
                     hm.put("oknok",ass.rs.getDouble("vazn"));
                     hm.put("problemtxt",ass.rs.getString("problemtxt").trim());
                }
                
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            File reportFile = new File(application.getRealPath("reports/report_resultx_rahkar1.jasper"));//your report_name.jasper file
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
