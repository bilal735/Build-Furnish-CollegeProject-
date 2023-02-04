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
public class VarifyServlet2 extends HttpServlet {
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            PrintWriter out = response.getWriter();
            
               String getcode=request.getParameter("code");
               String type=request.getParameter("type");
//                        out.println("<h1>"+getcode+"</h1>");
//                        out.println("<h1>"+type+"</h1>");
                        dao d=new dao(getServletContext());
                            Statement st=d.dbConnector();

                            String q="";
                                if(type.equals("user")){
                                    q="SELECT email FROM uvarification_table WHERE(code='"+getcode+"');";
                                }else if(type.equals("worker")){
                                    q="SELECT email FROM varification_table WHERE(code='"+getcode+"');";
                                }
                            ResultSet rs= d.fetchData(st,q);
                            //out.println("hiiiiiiiii...");
                            rs.next();
                                if(rs.getString("email")!=null){
                                    String e=rs.getString("email");
                                   // out.println("<h1> mmmmmm</h1>");
                                   String s2="";
                                   if(type.equals("user")){
                                        s2="Update ulogin_table set status=1 where(email='"+e+"');";
                                   }else if(type.equals("worker")){
                                       s2="Update login_table set status=1 where(email='"+e+"');";
                                   }
                                    d.updateData(st,s2);
                                   // out.println("<h1>"+e+"</h1>");
                                }
                            
                            request.getRequestDispatcher("login").forward(request, response);

                
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
