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
import java.util.*;
import UserTableClass.UserTable;
/**
 *
 * @author bilal
 */
public class SearchServlet extends HttpServlet {

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
                dao d=new dao(getServletContext());
                Statement st=d.dbConnector();
                Statement st2=d.dbConnector();
                String target=request.getParameter("text");
              //  out.println(target);
                KMP k=new KMP();
                ArrayList<UserTable> arr2=new ArrayList<UserTable>();
                //HashMap<String,String> map=new HashMap<String,String>();
                 String result="";
                 result=k.kmp("plumber", target.toLowerCase());
                 
                 if(result==null){
                        result=k.kmp("contractor", target.toLowerCase());
                        if(result!=null){
                                    // arr.add(result);
                            String s="Select * from user_table where(specialization='"+result+"')";
                                     ResultSet rs=d.fetchData(st, s);
                                      ArrayList<UserTable> arr=new ArrayList<>();
                                         while(rs.next()){
                                             arr.add(new UserTable(rs.getString("name"),rs.getString("email"),rs.getString("specialization"),rs.getInt("work_experience"),rs.getString("password"),rs.getInt("uid")));
                                         }
                                       request.setAttribute("data", arr);
                                       request.getRequestDispatcher("SearchResultsJSP").forward(request, response);
                        }
                        if(result ==null){
                            result=k.kmp("labour", target.toLowerCase());
                            if(result!=null){
                                //arr.add(result);
                            String s="Select * from user_table where(specialization='"+result+"')";
                                     ResultSet rs=d.fetchData(st, s);
                                      ArrayList<UserTable> arr=new ArrayList<>();
                                         while(rs.next()){
                                             arr.add(new UserTable(rs.getString("name"),rs.getString("email"),rs.getString("specialization"),rs.getInt("work_experience"),rs.getString("password"),rs.getInt("uid")));
                                         }
                                       request.setAttribute("data", arr);
                                       request.getRequestDispatcher("SearchResultsJSP").forward(request, response);
                                       
                            }   if(result==null){    
                                // String type=request.getParameter("type");
                                   String q="";
                                // if(type.equals("user")){
                                   q="SELECT name FROM user_table";
                                   ResultSet rs=d.fetchData(st, q);
                                   while(rs.next()){

                                        result=k.kmp(rs.getString("name"),target);
                                        
                                       if(result!=null){
                                         //  arr.add(result);
                                            String s="Select * from user_table where(name='"+result+"')";
                                            ResultSet rs2=d.fetchData(st2, s);
                                           // ArrayList<UserTable> arr=new ArrayList<>();
                                            while(rs2.next()){
                                                arr2.add(new UserTable(rs2.getString("name"),rs2.getString("email"),rs2.getString("specialization"),rs2.getInt("work_experience"),rs2.getString("password"),rs2.getInt("uid")));
                                            }
                                               rs2.close();
                                               request.setAttribute("data", arr2);
                                               request.getRequestDispatcher("SearchResultsJSP").forward(request, response);
                                            
                                       }
                                   }
                                   if(arr2.isEmpty()){
                                              ArrayList<UserTable> ar=new ArrayList<>();
                                              
                                             request.setAttribute("data", ar);
                                            request.getRequestDispatcher("SearchResultsJSP").forward(request, response);
                                            
                                    }
                                   rs.close();
                                }
                        }
                 }else if(result!=null){
                            String s="Select * from user_table where(specialization='"+result+"')";
                            ResultSet rs=d.fetchData(st, s);
                             ArrayList<UserTable> arr=new ArrayList<>();
                                while(rs.next()){
                                    arr.add(new UserTable(rs.getString("name"),rs.getString("email"),rs.getString("specialization"),rs.getInt("work_experience"),rs.getString("password"),rs.getInt("uid")));
                                }
                              request.setAttribute("data", arr);
          //  String your_email=(String)request.getParameter("your_email");
            
                                  request.getRequestDispatcher("SearchResultsJSP").forward(request, response);
                 }
                 
                 //request.getRequestDispatcher().forward(request, response);
               // }else if(type.equals("worker")){
                    
                    
                    
               // }
              
        
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
