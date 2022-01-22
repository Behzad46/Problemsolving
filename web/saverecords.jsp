<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="javax.swing.JOptionPane"%>
<%@page import= " java.sql.*"%>
<%@page import= " java.io.*"%>
<%@page import= " project.accessories"%>

<%
    project.accessories ass=new accessories();
    Integer c110,c210,c310,c410,c510,c610,c710,c810,c910,c1010,c1110,c1210;
    Integer cnaghsh0=0;
    Double perno10;
    String data="";
    String nuname1=request.getParameter("nuname1");
    String uname1=request.getParameter("uname1");
    String naghsh1=request.getParameter("naghsh1");
    String cvaheds1=request.getParameter("cvaheds1");
    String upass1=request.getParameter("upass1");
    String perno1=request.getParameter("perno1");
    String name1=request.getParameter("name1");
    name1=ass.getu_f(name1);
    String family1=request.getParameter("family1");
    family1=ass.getu_f(family1);
    String ghesmat1=request.getParameter("ghesmat1");
    ghesmat1=ass.getu_f(ghesmat1);
    String c11=request.getParameter("c11");
    String c21=request.getParameter("c21");
    String c31=request.getParameter("c31");
    String c41=request.getParameter("c41");
    String c51=request.getParameter("c51");
    String c61=request.getParameter("c61");
    String c71=request.getParameter("c71");
    String c81=request.getParameter("c81");
    String c91=request.getParameter("c91");
    String c101=request.getParameter("c101");
    String c111=request.getParameter("c111");
    String c121=request.getParameter("c121");
    if(perno1==null || perno1==""){
        perno10=0.0;
    }else{
        perno10=Double.parseDouble(perno1);
    }
    if(c11==null || c11==""){
        c110=0;
    }else{
        c110=1;
    }
    if(c21==null || c21==""){
        c210=0;
    }else{
        c210=1;
    }
    if(c31==null || c31==""){
        c310=0;
    }else{
        c310=1;
    }
    if(c41==null || c41==""){
        c410=0;
    }else{
        c410=1;
    }
    if(c51==null || c51==""){
        c510=0;
    }else{
        c510=1;
    }
    if(c61==null || c61==""){
        c610=0;
    }else{
        c610=1;
    }
    if(c71==null || c71==""){
        c710=0;
    }else{
        c710=1;
    }
    if(c81==null || c81==""){
        c810=0;
    }else{
        c810=1;
    }
    if(c91==null || c91==""){
        c910=0;
    }else{
        c910=1;
    }
    if(c101==null || c101==""){
        c1010=0;
    }else{
        c1010=1;
    }
    if(c111==null || c111==""){
        c1110=0;
    }else{
        c1110=1;
    }
    if(c121==null || c121==""){
        c1210=0;
    }else{
        c1210=1;
    }
    String code0;
    code0="";
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
    int updatequery=0;
    String sql1="";
    String cv="";
try{   
    
   ass.con = DriverManager.getConnection(ass.url, ass.id, ass.pass);
        if( nuname1!=null){
         if(nuname1!=""){ 
         ass.query1 = "SELECT * From code_problem ";
         ass.pst1=ass.con.prepareStatement(ass.query1);
         ass.rs1=ass.pst1.executeQuery();
         while(ass.rs1.next()){
            if(ass.rs1.getInt("tag")==0){
                code0=ass.rs1.getString("code").trim();
                break;
            } 
         }
         ass.query = "UPDATE code_problem SET  tag=? WHERE code=?";
         ass.pst=ass.con.prepareStatement(ass.query);
         ass.pst.setInt(1, 1);
         ass.pst.setString(2, code0);
         ass.pst.executeUpdate();
         }
        } 
         
         ass.query1 = "SELECT * From naghsh ";
         ass.pst1=ass.con.prepareStatement(ass.query1);
         ass.rs1=ass.pst1.executeQuery();
         while(ass.rs1.next()){
            if(ass.rs1.getString("naghsh").trim().equals(naghsh1.trim())){
                cnaghsh0=ass.rs1.getInt("code");
                break;
            } 
         }
   ass.query1 = "SELECT * FROM person WHERE perno=?";
   ass.st = ass.con.prepareStatement(ass.query1);
   ass.st.setDouble(1, perno10);
   ass.rs=ass.st.executeQuery();
       
   if(ass.rs.next()){
         ass.query = "UPDATE person SET  perno=?,names=?,family=?,ghesmat=? WHERE perno=?";
         ass.pst=ass.con.prepareStatement(ass.query);
         ass.pst.setDouble(1, perno10);
         ass.pst.setString(2, name1);
         ass.pst.setString(3, family1);
         ass.pst.setString(4, ghesmat1);
         ass.pst.setDouble(5, perno10);
         ass.pst.executeUpdate();
   }else{
         ass.query = "INSERT INTO person (perno,names,family,ghesmat) values (?,?,?,?)";
         ass.pst=ass.con.prepareStatement(ass.query);
         ass.pst.setDouble(1, perno10);
         ass.pst.setString(2, name1);
         ass.pst.setString(3, family1);
         ass.pst.setString(4, ghesmat1);
         ass.pst.executeUpdate();
   }      
         ass.pst1.close();
         ass.rs1.close();
         ass.st.close();
         ass.rs.close();
   if( nuname1!=null){
     if(nuname1!=""){ 
     ass.query = "INSERT INTO passwords (password,naghsh,cvahed,perno,name,family,ghesmat,ptree,telatha"
             + ",rahkar,pvahed,ppanel,pperson,ynrahkar,tmojri,rpt1,rpt2,rpt3,padmin,code,cnaghsh,username) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
   ass.pst=ass.con.prepareStatement(ass.query);
   ass.pst.setString(1, upass1);
   ass.pst.setString(2, ass.getu_f(naghsh1));
   ass.pst.setInt(3, Integer.parseInt(cvaheds1));
   ass.pst.setDouble(4, perno10);
   ass.pst.setString(5, name1);
   ass.pst.setString(6, family1);
   ass.pst.setString(7, ghesmat1);
   ass.pst.setInt(8, c110);
   ass.pst.setInt(9, c210);
   ass.pst.setInt(10, c310);
   ass.pst.setInt(11, c410);
   ass.pst.setInt(12, c510);
   ass.pst.setInt(13, c610);
   ass.pst.setInt(14, c710);
   ass.pst.setInt(15, c810);
   ass.pst.setInt(16, c910);
   ass.pst.setInt(17, c1010);
   ass.pst.setInt(18, c1110);
   ass.pst.setInt(19, c1210);
   ass.pst.setString(20, code0);
   ass.pst.setInt(21, cnaghsh0);
   ass.pst.setString(22, nuname1);
    }else{
     ass.query = "UPDATE passwords SET  password=?,naghsh=?,cvahed=?"+
                                 ",perno=?,name=?,family=?,ghesmat=?"+
                                 ",ptree=?,telatha=?,rahkar=?,pvahed=?,ppanel=?,pperson=?,ynrahkar=?,tmojri=?,rpt1=?,rpt2=?,rpt3=?"+
                                 ",padmin=?,cnaghsh=? WHERE username=?";
   ass.pst=ass.con.prepareStatement(ass.query);
   ass.pst.setString(1, upass1);
   ass.pst.setString(2, ass.getu_f(naghsh1));
   ass.pst.setInt(3, Integer.parseInt(cvaheds1));
   ass.pst.setDouble(4, perno10);
   ass.pst.setString(5, name1);
   ass.pst.setString(6, family1);
   ass.pst.setString(7, ghesmat1);
   ass.pst.setInt(8, c110);
   ass.pst.setInt(9, c210);
   ass.pst.setInt(10, c310);
   ass.pst.setInt(11, c410);
   ass.pst.setInt(12, c510);
   ass.pst.setInt(13, c610);
   ass.pst.setInt(14, c710);
   ass.pst.setInt(15, c810);
   ass.pst.setInt(16, c910);
   ass.pst.setInt(17, c1010);
   ass.pst.setInt(18, c1110);
   ass.pst.setInt(19, c1210);
   ass.pst.setInt(20, cnaghsh0);
   ass.pst.setString(21, uname1);
   }
   }   
   ass.pst.executeUpdate();
   ass.query = "SELECT * FROM passwords WHERE username=? "; 
   ass.pst = ass.con.prepareStatement(ass.query);
   if(nuname1!=null){
     if(nuname1!=""){  
       ass.pst.setString(1, nuname1);
   }else{
       ass.pst.setString(1, uname1);
   }
   }
   ass.rs=ass.pst.executeQuery();
       if(ass.rs.next())
        {
        //sql1 = "SELECT * FROM vaheds WHERE radif=? "; 
        //PreparedStatement pst1 = ass.con.prepareStatement(sql1);
        //pst1.setInt(1, ass.rs.getInt("cvahed"));
        //ass.rs1=pst1.executeQuery();
        //if(ass.rs1.next()){
        //   cv=ass.rs1.getString("vahed").trim();
        //}
        data = ":" + ass.rs.getString("username").trim() + ":" +String.valueOf(ass.rs.getLong("cnaghsh")) +":"+ String.valueOf(ass.rs.getLong("cvahed"))
                +":"+ ass.rs.getString("password")+":"+String.valueOf(ass.rs.getLong("perno"))+":"+ ass.rs.getString("name").trim()
                +":"+ ass.rs.getString("family").trim()+":"+ ass.rs.getString("ghesmat").trim()
                +":"+String.valueOf(ass.rs.getInt("ptree"))
                +":"+ String.valueOf(ass.rs.getInt("telatha"))
                +":"+ String.valueOf(ass.rs.getInt("rahkar"))
                +":"+ String.valueOf(ass.rs.getInt("pvahed"))
                +":"+ String.valueOf(ass.rs.getInt("ppanel"))
                +":"+ String.valueOf(ass.rs.getInt("pperson"))
                +":"+ String.valueOf(ass.rs.getInt("ynrahkar"))
                +":"+ String.valueOf(ass.rs.getInt("tmojri"))
                +":"+ String.valueOf(ass.rs.getInt("rpt1"))
                +":"+ String.valueOf(ass.rs.getInt("rpt2"))
                +":"+ String.valueOf(ass.rs.getInt("rpt3"))
                +":"+ String.valueOf(ass.rs.getInt("padmin"));
       }
       out.print(data);

   if(updatequery!=0){
       out.println("Unable...");
   }
   } catch (Exception e) {
       e.printStackTrace();
   }finally{
    ass.pst.close();
    ass.con.close();
    }
    
%>    