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
import java.sql.*;
/**
 *
 * @author bilal
 */
public class UpdateServlet extends HttpServlet {

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
            String email=request.getParameter("email");
            String type=request.getParameter("type");
            String name=request.getParameter("name");
            int mobile_no=Integer.parseInt(request.getParameter("mobile_no"));
            String old_email=request.getParameter("old_email");
            dao d=new dao(getServletContext());
            Statement st=d.dbConnector();
            String q="";
           // String q2="";
            if(type.equals("user")){
              //  q2="Update ulogin_table SET email='"+email+"' where(email='"+old_email+"');";               
                q="Update uuser_table SET name='"+name+"', mobile_no='"+mobile_no+"', email='"+email+"' where(email='"+old_email+"');";               
                
            }else if(type.equals("worker")){
                q="Update user_table SET name='"+name+"', mobile_number='"+mobile_no+"', email='"+email+"' where(email='"+old_email+"');";               
              //  q2="Update login_table SET email='"+email+"' where(email='"+old_email+"');";               

            }
           int result= d.updateData(st, q);
          // int result2= d.updateData(st, q2);
           //out.println("<h1>"+result+"</h1>");

           if(result==1){
//               request.getRequestDispatcher("Profile").forward(request, response);
           }else{
  //             request.getRequestDispatcher("UserUpdate").forward(request, response);

           }

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
