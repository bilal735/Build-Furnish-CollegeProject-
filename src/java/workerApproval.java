/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import java.sql.*;

/**
 *
 * @author DELL
 */
public class workerApproval extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            
          
          String email=request.getParameter("email").trim();
          String res=request.getParameter("value");
          //String app=request.getParameter("")
            //out.println(res);
            dao ob=new dao(getServletContext());
            Statement st=ob.dbConnector();
            String q=null;
            if(res.equals("yes")){
                q ="Update user_table SET approved=1 Where (email='"+email+"');";
                ob.updateData(st,q);
            }else{
                q="Delete from user_table where (email='"+email+"');";
                String q2="Delete from login_table where (email='"+email+"');";
                String q3="Delete from login_status_table where (email='"+email+"');";
                ob.updateData(st,q);
                ob.updateData(st,q3);
                ob.updateData(st,q2);
//                  q ="Update user_table SET approved=0 Where (email='"+email+"');";
            }
            
                
                response.sendRedirect("adminWorker.jsp");
            
              
     
//              HttpSession session=request.getSession();
//                        session.setAttribute("email",getemail);
//                        session.setAttribute("password",getpassword);
//                        session.setAttribute("type",type);
//                         String aupdate="";
//                                aupdate="UPDATE admin_login SET status=1 WHERE (email='"+email+"');";
//                                 d.updateData(st, aupdate);
//                        RequestDispatcher rd=request.getRequestDispatcher("adminWorker.jsp");
//                        rd.forward(request,response);
        }
    catch(Exception e){
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
