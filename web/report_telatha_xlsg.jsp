<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import=" net.sf.jasperreports.engine.JasperFillManager" %> 
<%@ page import=" net.sf.jasperreports.engine.JasperPrint" %> 
<%@ page import="net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter" %> 
<%@ page import="net.sf.jasperreports.engine.export.JRXlsExporterParameter" %> 
<%@ page import="net.sf.jasperreports.engine.JREmptyDataSource" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %>
<%@page import= " project.accessories"%>
<%@page import= " javax.swing.JOptionPane"%>
    
<% 
    project.accessories ass=new accessories();          
//response.setHeader("CACHE-CONTROL","NO-CACHE"); 
//response.setHeader("EXPIRES","0"); 
//response.setHeader("PRAGMA","NO-CACHE"); 
//CreateXml cml=(CreateXml) request.getAttribute("REPORT_BEAN"); 
//String reportName = cml.getReportName(); 
//String reportName=request.getParameter("report_telatha"); 
HashMap hm = null;
JasperPrint jasperPrint = null;
File reportFile = new File(application.getRealPath("/reports/report_telathag.jasper"));//your report_name.jasper file
File reportFiled = new File(application.getRealPath("/reports"));
String abspath = reportFile.getAbsolutePath(); //tried getAbsolutePath() 
String path = reportFile.getPath(); 
System.out.println("Absolute Path = " + reportFile.getAbsolutePath()); 
System.out.println(" Path = " + reportFile.getPath()); 

try 
{ 
              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
               ass.con = java.sql.DriverManager.getConnection(ass.url, ass.id, ass.pass);
if (ass.con == null) {
 
try {
jasperPrint = JasperFillManager.fillReport(path, hm, new JREmptyDataSource());
} catch (Exception e) {
e.printStackTrace();
}
}
else {
try {
jasperPrint = JasperFillManager.fillReport(path, hm, ass.con);
}
catch (Exception e) {
e.printStackTrace();
}
}
             } catch (Exception ex) {
                ex.printStackTrace();
            }
try{
//To generate and open the XLSheet
JRXlsxExporter exporterXLS = new JRXlsxExporter();
exporterXLS.setParameter(JRXlsExporterParameter.JASPER_PRINT, jasperPrint);
exporterXLS.setParameter(JRXlsExporterParameter.OUTPUT_FILE_NAME, reportFiled+"/reportg.xlsx");
exporterXLS.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.FALSE);
exporterXLS.setParameter(JRXlsExporterParameter.IS_DETECT_CELL_TYPE, Boolean.TRUE);
exporterXLS.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);
exporterXLS.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
exporterXLS.exportReport();
//---------------------------------------------------------------------------------
String filename=reportFiled+"/reportg.xlsx";
ServletOutputStream outStream = response.getOutputStream();
FileInputStream inStream =new FileInputStream(filename);
response.setContentType("application/vnd.ms-excel");
response.addHeader("content-disposition", "attachment;filename="+filename);
int octet;
while((octet=inStream.read())!=-1)
    outStream.write(octet);
inStream.close();
outStream.close();
//---------------------------------------------------------------------------------
//Runtime.getRuntime().exec("rundll32 url.dll,FileProtocolHandler " + reportFiled+"/reportg.xlsx");
}
catch(Exception ex)
{
ex.printStackTrace();
}


%>
<script>
    window.close();
</script>
