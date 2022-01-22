<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= " project.accessories"%>
<%@page import= " project.SortArray"%>
<%@ page import= "java.sql.*"%>
<%@page import= " javax.swing.JOptionPane"%>
<%
project.accessories ass=new accessories();  

%>    
        <%
            String username0_ = request.getParameter("username");
            String pass1_ = request.getParameter("password");
            if (username0_ != null || pass1_ != null) {
                String sql = "select * from passwords where username=? and password=?";
                try {
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    ass.con = java.sql.DriverManager.getConnection(ass.url, ass.id, ass.pass);
                    ass.pst = ass.con.prepareStatement(sql);
                    ass.pst.setString(1, username0_);
                    ass.pst.setString(2, pass1_);
                    ass.rs = ass.pst.executeQuery();

                    if (!ass.rs.next()) {

        %>
        <SCRIPT LANGUAGE="JavaScript">
            <%session.setAttribute("demo", true);%>
            window.location.replace("index.jsp")
        </SCRIPT>
        <%      } else {
            session.setAttribute("username0", username0_);
            session.setAttribute("password", pass1_);
            session.setAttribute("ptree", ass.rs.getInt("ptree"));
            session.setAttribute("pvahed", ass.rs.getInt("pvahed"));
            session.setAttribute("padmin", ass.rs.getInt("padmin"));
            session.setAttribute("ppanel", ass.rs.getInt("ppanel"));
            session.setAttribute("cvahed0", ass.rs.getInt("cvahed"));
            session.setAttribute("code0", ass.rs.getString("code"));
            session.setAttribute("naghsh0", ass.rs.getString("naghsh"));
            session.setAttribute("cnaghsh0", ass.rs.getInt("cnaghsh"));
            session.setAttribute("rahkar", ass.rs.getInt("rahkar"));
            session.setAttribute("ynrahkar", ass.rs.getInt("ynrahkar"));
            session.setAttribute("tmojri", ass.rs.getInt("tmojri"));
            session.setAttribute("telatha", ass.rs.getInt("telatha"));
            session.setAttribute("rpt1", ass.rs.getInt("rpt1"));
            session.setAttribute("rpt2", ass.rs.getInt("rpt2"));
            session.setAttribute("rpt3", ass.rs.getInt("rpt3"));
            session.setAttribute("crow", 1);
            session.setAttribute("lang", 1);
        %>
        
        <SCRIPT LANGUAGE="JavaScript">
            <%session.setAttribute("demo", false);%>
            var myWindow;
            if(<%=ass.rs.getInt("cnaghsh")%>==1 ||<%=ass.rs.getInt("cnaghsh")%>==5){
               myWindow=window.location.replace('main_menu_u.jsp'); 
            }else{
               myWindow=window.location.replace('main_menu.jsp'); 
            }
            
        </SCRIPT>
        <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (ass.rs != null) {
                        ass.rs.close();
                    }
                    if (ass.rs != null) {
                        ass.rs.close();
                    }
                    if (ass.con != null) {
                        ass.con.close();
                    }
                }
            }

        %>
