<%@page import= " java.sql.*"%>
<%@page import= " java.io.*"%>


<%
    String name1=request.getParameter("n1");
    String family1=request.getParameter("f1");
    String vahed1=request.getParameter("v1");
    String url = "jdbc:sqlserver://localhost:1433;databaseName=problems";
    Connection con = null;
    PreparedStatement pst=null;
    String id= "sa";
    String pass = "1234";
    String query;
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
    int updatequery=0;
    if(name1!=null &&family1!=null&&vahed1!=null){
        if(name1!="" &&family1!=""&&vahed1!=""){
try{

   con = java.sql.DriverManager.getConnection(url, id, pass);
   query = "INSERT INTO passwords (username,family,vahed) values (?,?,?) ";
   pst=con.prepareStatement(query);
   pst.setString(1, name1);
   pst.setString(2, family1);
   pst.setString(3, vahed1);
   updatequery=pst.executeUpdate();
   if(updatequery!=0){
       out.println("Unable...");
   }
   } catch (Exception e) {
       e.printStackTrace();
   }finally{
    pst.close();
    con.close();
}
 }
    }
    
%>    