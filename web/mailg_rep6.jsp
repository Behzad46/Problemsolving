<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "javax.mail.*"%>
<%@ page import = "javax.mail.internet.*"%>
<%@ page import = "java.util.Properties"%>
<%@ page import = "javax.activation.DataHandler"%>
<%@ page import = "javax.activation.DataSource"%>
<%@ page import = "javax.activation.FileDataSource"%>
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
    String vds1_ = request.getParameter("vds1"); 
    String reportname = request.getParameter("reportname"); 
String filename="";    
HashMap hm = null;
JasperPrint jasperPrint = null;
File reportFile = new File(application.getRealPath(reportname));//your report_name.jasper file
File reportFiled = new File(application.getRealPath("/reports"));
String abspath = reportFile.getAbsolutePath(); //tried getAbsolutePath() 
String path = reportFile.getPath(); 
System.out.println("Absolute Path = " + reportFile.getAbsolutePath()); 
System.out.println(" Path = " + reportFile.getPath()); 

try 
{ 
               Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
               ass.con = java.sql.DriverManager.getConnection(ass.url, ass.id, ass.pass);
               hm = new HashMap();
               hm.put("cvahed",Integer.parseInt(vds1_));
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
filename=reportFiled+"/reportg.xlsx";
}
catch(Exception ex)
{
ex.printStackTrace();
}
   String sender = request.getParameter("sender");   
   String recipient = request.getParameter("recipient");  
   String subject = request.getParameter("subject"); 
   String content = request.getParameter("content"); 
   
   String result="";
   final String username="ladanhatami54@gmail.com";
   final String password="lHw2Ba6ZICPN";
   Properties props=new Properties();
   props.put("mail.smtp.auth", "true");
   props.put("mail.smtp.starttls.enable", "true");
   props.put("mail.smtp.host", "mail.smtp2go.com");
   props.put("mail.smtp.port", "2525");
   Session session1 = Session.getInstance(props, new javax.mail.Authenticator() {
       protected PasswordAuthentication getPasswordAuthentication(){
           return new PasswordAuthentication(username, password);
       }
});

   try{
    String file="GR"+String.valueOf(Math.round(Math.floor((Math.random()*1000000000)+1)))+".xlsx";
    
    Message message = new MimeMessage(session1);
    Multipart mp=new MimeMultipart("alternative");
    BodyPart textmessage = new MimeBodyPart();
    textmessage.setText("It is a text message");
    BodyPart htmlmessage = new MimeBodyPart();
    htmlmessage.setContent(content,"text/html");
    mp.addBodyPart(textmessage);
    mp.addBodyPart(htmlmessage);
    
    BodyPart attachefile=new MimeBodyPart();
    DataSource source = new FileDataSource(filename);
    attachefile.setDataHandler(new DataHandler(source));
    attachefile.setFileName(file);
    mp.addBodyPart(attachefile);
    
    message.setFrom(new InternetAddress(sender));
    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
    message.setSubject(subject);
    message.setContent(mp);
    Transport.send(message);
    result = "Sent message successfully....";
}catch(MessagingException e){
    e.printStackTrace();
    result = "Error: unable to send message....";
}
%>
<html>
   <head>
      <title>Send Email using Creative Problem Solving System</title>
      <link rel="shortcut icon" type="image-icon" href="images/1.ico">
   </head>
   
   <body>
      <center>
         <h1>Send Email using Creative Problem Solving System</h1>
      </center>
      
      <p align = "center">
         <% 
            out.println("Result: " + result + "\n");
         %>
      </p>
   </body>
</html>
