/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author bilal
 */
public class WorkerRegistration extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String name=request.getParameter("user");
            String mobile=request.getParameter("mobile");
            String email=request.getParameter("email");
            String specialization=request.getParameter("specialization");
            int work=Integer.parseInt(request.getParameter("Work-experience"));
            String password=request.getParameter("password");
            String cpassword=request.getParameter("cpassword");
        //storing the data
                dao d=new dao(getServletContext());
                Statement stmt=d.dbConnector();
                String check="SELECT email FROM user_table WHERE(email='"+email+"');";
                ResultSet rscheck=d.fetchData(stmt, check);
                if(rscheck.next()){
                    request.setAttribute("present","your email is already exist!!!!!!!!!!!!!!!!");
                    request.getRequestDispatcher("CreateWorker").forward(request, response);
                }
                
                String query="INSERT INTO login_table(uid,password,email,status) values(1,'"+password+"','"+email+"',0)";
                //String query2="INSERT INTO user_table(name,mobile_number,email,specialization,work_experience,password,uid) VALUES()";
                d.storeData(stmt, query);
                String q1="SELECT max(uid) FROM user_table";
                ResultSet rs=d.fetchData(stmt,q1);
                String q2;
                if(!rs.next()){
                    q2="INSERT INTO user_table(name,mobile_number,email,specialization,work_experience,password,confirm_pas,uid) VALUES('"+name+"','"+mobile+"','"+email+"','"+specialization+"','"+work+"','"+password+"','"+cpassword+"',1)";
                }
                else{
                    int sn=rs.getInt("max(uid)")+1;
                    q2="INSERT INTO user_table(name,mobile_number,email,specialization,work_experience,password,uid) VALUES('"+name+"','"+mobile+"','"+email+"','"+specialization+"','"+work+"','"+password+"','"+sn+"')";
                }
                d.storeData(stmt, q2);
                
                out.println("<h1>stored<h1>");
        //generating code
                GenUUID code=new GenUUID();
                String co=code.getCode();
                       String query1="INSERT INTO varification_table(email,code) VALUES('"+email+"','"+co+"')";
                       String query2="Insert Into login_status_table(email,login_status) values('"+email+"',0)";
                       d.storeData(stmt,query1);
                       d.storeData(stmt,query2);
                       MailSender ms=new MailSender();
                       
                       ms.sendMail(email.trim(),co,"worker");   
                request.getRequestDispatcher("SuccessfullRegistration").forward(request, response);
                
             // out.println("<h3> Heloo "+sname+" at your first servlet</h3>");
            } catch (Exception ex) {
               ex.printStackTrace();
            }
        }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    //@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    //@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
   // @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
