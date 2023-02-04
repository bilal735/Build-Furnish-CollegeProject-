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
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author bilal
 */
public class UserRegistration extends HttpServlet {

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
        try {
           PrintWriter out = response.getWriter();
           String name=(String)request.getParameter("user");
           String email=(String)request.getParameter("email");
           String mobile_no=(String)request.getParameter("mobile");
           String password=(String)request.getParameter("password");
            dao d=new dao(getServletContext());
                Statement stmt=d.dbConnector();
                String check="SELECT email FROM uuser_table WHERE(email='"+email+"');";
                ResultSet rscheck=d.fetchData(stmt, check);
                if(rscheck.next()){
                    request.setAttribute("present","your email is already exist!!!!!!!!!!!!!!!!");
                    request.getRequestDispatcher("CreateUser").forward(request, response);
                }
                
                
                String query="INSERT INTO ulogin_table(uid,password,email,status) values(1,'"+password+"','"+email+"',0)";
                //String query2="INSERT INTO user_table(name,mobile_number,email,specialization,work_experience,password,uid) VALUES()";
                d.storeData(stmt, query);
                String q1="SELECT max(uid) FROM uuser_table";
                ResultSet rs=d.fetchData(stmt,q1);
                String q2,q3;
                if(!rs.next()){
                    q2="INSERT INTO uuser_table(uid,email,name,mobile_no) VALUES(1,'"+email+"','"+name+"','"+mobile_no+"')";
                    q3="INSERT INTO ulogin_status_table(email,login_status) VALUES('"+email+"',0)";

                }
                else{
                    int sn=rs.getInt("max(uid)")+1;
                        q2="INSERT INTO uuser_table(uid,email,name,mobile_no) VALUES('"+sn+"','"+email+"','"+name+"','"+mobile_no+"')";    
                       q3="INSERT INTO ulogin_status_table(email,login_status) VALUES('"+email+"',0)";

                }
                d.storeData(stmt, q2);
                d.storeData(stmt, q3);
           
             //   out.println("<h1>stored<h1>");
                
                GenUUID code=new GenUUID();
                String co=code.getCode();
                       String query1="INSERT INTO uvarification_table(email,code) VALUES('"+email+"','"+co+"')";
                       d.storeData(stmt,query1);
                       MailSender ms=new MailSender();
                       ms.sendMail(email.trim(),co,"user");   
                    //out.println("<h1>mail send</h1>");
                                    request.getRequestDispatcher("SuccessfullRegistration").forward(request, response);

        }catch(Exception e){
            e.printStackTrace();
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
    @Override
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
