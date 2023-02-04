/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import UserTableClass.appointment_table;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;
import java.lang.*;
/**
 *
 * @author bilal
 */
public class InsertAppointment extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            PrintWriter out = response.getWriter();
            
            //out.println("<h1>'"+(String)request.getParameter("your_email")+"'</h1>");
            dao d=new dao(getServletContext());
            Statement st=d.dbConnector();
            String schedule_from=request.getParameter("schedule_from");
            String schedule_till=request.getParameter("schedule_till");
            String service=request.getParameter("specialization");
            String text_area=request.getParameter("text_area");
            String your_address=request.getParameter("your_address");
            String email=request.getParameter("email");
            String name=request.getParameter("name");
//            out.println("<h1>'"+(String)request.getParameter("name")+"'</h1>");
//            out.println("<h1>'"+text_area+"'</h1>");
//            out.println("<h1>'"+schedule_till+"'</h1>");
//            out.println("<h1>'"+schedule_from+"'</h1>");
//            out.println("<h1>'"+address+"'</h1>");
//            out.println("<h1>'"+specialization+"'</h1>");
//            out.println("<h1>'"+email+"'</h1>");
           // dao d=new dao(getServletContext());
           String fetch_email="SELECT email FROM ulogin_status_table WHERE(login_status=1)"; 
           ResultSet rs1=d.fetchData(st, fetch_email);
           rs1.next();
           String your_email=rs1.getString("email");
           String store="INSERT INTO appointment_table(service,service_provider_name,service_provider_email,schedule_till,schedule_from,your_email,your_address) Values('"+service+"','"+name+"','"+email+"','"+schedule_till+"','"+schedule_from+"','"+your_email+"','"+your_address+"');";
           boolean b=d.storeData(st,store); 
           //out.println(b); 
            appointment_table at=new appointment_table( service,email,name, schedule_from, schedule_till, your_email, your_address);
            request.setAttribute("appointment_details", at);
            MailSender2 ms=new MailSender2();
                       ms.sendMail(your_email); 
            request.getRequestDispatcher("Successfull").forward(request, response);
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
