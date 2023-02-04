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
import jakarta.servlet.http.HttpSession;
import java.sql.*;
import java.util.*;
import java.lang.*;

public class FetchProfile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            PrintWriter out = response.getWriter();
           String email=request.getParameter("email");
           String type=request.getParameter("type");
//           out.println(email);
//           out.println(type);
                dao d=new dao(getServletContext());
                Statement st=d.dbConnector();
                String q="";
                if(type.equals("user")){
                    q="SELECT email FROM ulogin_status_table where(login_status='"+1+"');";
                                       
                }else if(type.equals("worker")){
                    q="SELECT email FROM login_status_table where(login_status='"+1+"');";
                                      
                }
                ResultSet rs=d.fetchData(st, q);
                rs.next();
                String FetchedEmail=rs.getString("email");
                    String q2="";
                if(type.equals("user")){
                    q2="SELECT * FROM uuser_table where(email='"+FetchedEmail+"');";
                }else if(type.equals("worker")){
                    q2="SELECT * FROM user_table where(email='"+FetchedEmail+"');";
                }
                ResultSet rs2=d.fetchData(st, q2);
                rs2.next();
                HashMap<String,String> hash=new HashMap<String,String>();
                if(type.equals("user")){
                    hash.put("email",rs2.getString("email"));
                    hash.put("name",rs2.getString("name"));
                    hash.put("mobile_no",rs2.getString("mobile_no"));
                }else if(type.equals("worker")){
                    hash.put("email",rs2.getString("email"));
                    hash.put("name",rs2.getString("name"));
                    hash.put("mobile_number",rs2.getString("mobile_number"));
                    hash.put("work_experience", rs2.getString("work_experience"));
                    hash.put("specialization", rs2.getString("specialization"));
                }
                request.setAttribute("data", hash);
                request.getRequestDispatcher("Profile?type="+type).forward(request,response);
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
