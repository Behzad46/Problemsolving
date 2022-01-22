<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "javax.mail.*"%>
<%@ page import = "javax.mail.internet.*"%>
<%@ page import = "java.util.Properties"%>
<%@ page import = "javax.activation.DataHandler"%>
<%@ page import = "javax.activation.DataSource"%>
<%@ page import = "javax.activation.FileDataSource"%>
<%
   String recipient = request.getParameter("recipient");  
   String subject = request.getParameter("subject"); 
   String content = request.getParameter("content"); 
   String file = request.getParameter("file"); 
   
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
    Message message = new MimeMessage(session1);
    Multipart mp=new MimeMultipart("alternative");
    BodyPart textmessage = new MimeBodyPart();
    textmessage.setText("It is a text message");
    BodyPart htmlmessage = new MimeBodyPart();
    htmlmessage.setContent(content,"text/html");
    mp.addBodyPart(textmessage);
    mp.addBodyPart(htmlmessage);
    
    String filename = "/java/problemsolving/web/reports/report_rahkarha.jrxml";
    BodyPart attachefile=new MimeBodyPart();
    DataSource source = new FileDataSource(filename);
    attachefile.setDataHandler(new DataHandler(source));
    attachefile.setFileName(filename);
    mp.addBodyPart(attachefile);
    
    message.setFrom(new InternetAddress("ladanhatami54@gmail.com"));
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
