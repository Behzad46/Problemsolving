<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="javax.swing.JOptionPane"%>
<%@page import= " java.sql.*"%>
<%@page import= " java.io.*"%>
<%@page import= " project.accessories"%>

<%
    project.accessories ass=new accessories();
    String radif1=request.getParameter("radif1");
    String strkeyid=request.getParameter("strkeyid");
    String username0_=(String)session.getAttribute("username0"); 
    Integer radifi,i;
    radifi=0;
    String data="";
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
try{   
   radifi=Integer.parseInt(radif1); 
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
            if (radifi!=0) {
                ass.query = "SELECT * FROM rahkar  WHERE id=? AND radif=?"; 
                ass.st = ass.con.prepareStatement(ass.query);
                ass.st.setString(1, strkeyid);
                ass.st.setInt(2, radifi);
                ass.rs=ass.st.executeQuery();
                if (ass.rs.next()) {  
                    if (!ass.rs.getString("usern").trim().equals(username0_.trim())) {
                        ass.st.close();
                        ass.rs.close();
                        ass.con.close();
                        data = ":" + "1";
                        out.print(data);
                        return;
                    }
                }
                ass.query1 = "DELETE FROM rahkar  WHERE id=? AND radif=?";
                ass.st1 = ass.con.prepareStatement(ass.query1);
                ass.st1.setString(1, strkeyid);
                ass.st1.setInt(2, radifi);
                ass.st1.executeUpdate();
                i=1;
                ass.query1 = "SELECT * FROM rahkar WHERE id=? ORDER BY radif";
                ass.st2 = ass.con.prepareStatement(ass.query1);
                ass.st2.setString(1, strkeyid);
                ass.rs2=ass.st2.executeQuery();
                while(ass.rs2.next()){
                    ass.query2 = "UPDATE rahkar SET radif=? WHERE id=? AND radif=?";
                    ass.st3 = ass.con.prepareStatement(ass.query2);
                    ass.st3.setInt(1, i);
                    ass.st3.setString(2, strkeyid);
                    ass.st3.setInt(3, ass.rs2.getInt("radif"));
                    ass.st3.executeUpdate();
                   i++;
                }
                data = ":" + "0";
                out.print(data);
            }
   } catch (Exception e) {
       e.printStackTrace();
   }finally{
    ass.con.close();
    }
    
%>    