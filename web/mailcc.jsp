<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "javax.mail.*"%>
<%@ page import = "javax.mail.internet.*"%>
<%@ page import = "java.util.Properties"%>
<%@ page import = "javax.activation.DataHandler"%>
<%@ page import = "javax.activation.DataSource"%>
<%@ page import = "javax.activation.FileDataSource"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import= " java.sql.*"%>
<%@page import= " java.io.*"%>
<%@page import= " project.accessories"%>
<%
   project.accessories ass=new accessories(); 
   String sender = request.getParameter("sender");  
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
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();   
    ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
    ass.query1 = "SELECT *  FROM helperlist";
    ass.st1 = ass.con.prepareStatement(ass.query1);
    ass.rs1=ass.st1.executeQuery();
    while(ass.rs1.next()){
try{
      Message message = new MimeMessage(session1);
      BodyPart mp1 = new MimeBodyPart();
      mp1.setContent(content+"\n","text/plain");
      BodyPart mp2 = new MimeBodyPart();
      mp2.setContent(content,"text/plain");
      Multipart mp=new MimeMultipart();
      mp.addBodyPart(mp1);
      mp.addBodyPart(mp2);
    
      message.setFrom(new InternetAddress(sender));
      message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(ass.rs1.getString("email").trim()));
      message.setSubject(subject);
      message.setContent(mp);
      Transport.send(message);
      result = "Sent message successfully....";
}catch(MessagingException e){
    e.printStackTrace();
    result = "Error: unable to send message....";
}
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
