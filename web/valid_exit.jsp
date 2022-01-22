<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import= " javax.swing.JOptionPane"%>
<%
    String data="";
Integer number=(Integer)session.getAttribute("requestNumber");   
if(number==null){
    number=1;
}else{
    number++;
}
session.setAttribute("requestNumber", number);  
Integer cvahed0_=(Integer)session.getAttribute("cvahed0");
session.setAttribute("cvahed0", cvahed0_); 
   if (cvahed0_==-1 && number>1){
       data = ":" +"1";
       out.print(data);
   }else{
       data = ":" +"0";
       out.print(data);

   }
%>