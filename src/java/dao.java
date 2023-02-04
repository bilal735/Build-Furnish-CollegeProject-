/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import jakarta.servlet.*;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;

import java.io.Serializable;


public class dao implements Serializable{
        ServletContext context;
        Statement stmt;
        public dao(ServletContext ctx){
            context=ctx;
    }
        public Statement dbConnector() throws ClassNotFoundException,SQLException{
            String url=context.getInitParameter("url");
            String user=context.getInitParameter("un");
            String pass=context.getInitParameter("pass");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,user,pass);
            stmt=con.createStatement();
            return stmt;
        }
        public boolean storeData(Statement st,String query) throws SQLException{
            return st.execute(query);
        }
        public int updateData(Statement st,String query) throws SQLException{
            return st.executeUpdate(query);
        }
        public ResultSet fetchData(Statement st,String query) throws SQLException{
            return st.executeQuery(query);
        }
}
