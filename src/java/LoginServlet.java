/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author bilal
 */
public class LoginServlet extends HttpServlet {

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
          String type=request.getParameter("type").trim();
          String email=request.getParameter("email").trim();
          String password=request.getParameter("password").trim();
          dao d=new dao(getServletContext());
          Statement st=d.dbConnector();
          String q=null;
          if(type.equals("user")){
              q="SELECT * FROM ulogin_table WHERE(email='"+email+"');";
          }else if(type.equals("worker")){
              q="SELECT * FROM login_table WHERE(email='"+email+"');";
          }
          ResultSet rs=d.fetchData(st, q);
          if(rs.next()){
                String getemail=rs.getString("email");
                String getpassword=rs.getString("password");
                int getstatus=rs.getInt("status");
                if(getemail.equals(email) && getpassword.equals(password)){
                    if(getstatus==0 ){
                    
                            request.setAttribute("email", email);
                            request.setAttribute("password",getpassword);
                            request.setAttribute("type",type);
                            request.setAttribute("message","please verify your email");
                            //out.println("hii");
                            request.getRequestDispatcher("login").forward(request, response);
                    }else{ 
                        String checkquery="Select * FROM varification_table WHERE(email='"+getemail+"');";
                        ResultSet checkrs=d.fetchData(st,checkquery);
                        if(!checkrs.next()){
                                GenUUID code=new GenUUID();
                                String co=code.getCode();
                                String query1="INSERT INTO varification_table(email,code) VALUES('"+email+"','"+co+"')";
                                d.storeData(st,query1);
                                MailSender ms=new MailSender();
                                ms.sendMail(email.trim(),co,type);  
                        }
                        HttpSession session=request.getSession();
                        session.setAttribute("email",getemail);
                        session.setAttribute("password",getpassword);
                        session.setAttribute("type",type);
                        
                        String qupdate="";
                            if(type.equals("user")){
                                qupdate="UPDATE ulogin_status_table SET login_status=1 WHERE(email='"+email+"');";
                            }else if(type.equals("worker")){
                                qupdate= q="UPDATE login_status_table SET login_status=1 WHERE(email='"+email+"');";
                            }
                            d.updateData(st, qupdate);
                            //request.getRequestDispatcher("login").forward(request, response);
                        request.getRequestDispatcher("index").forward(request,response);
//                        out.print("<a href='HomeServlet'>Home Servlet</a>"); 
//                        out.println("<h1>you are successfully registered</h1>");
//                        out.println("<a href='UpdateJsp.jsp'>Update Details</a>");
                        
                    }
                }else{
                    request.setAttribute("data","Either password or email is incorreect!");
                    request.getRequestDispatcher("login").forward(request, response);
                }
                
            }else{
               // System.out.println("Email Incorrect");
                    //   HttpSession ss=request.getSession();
                    // ss.setAttribute("message", "you are not registered user please register here");
                     request.setAttribute("data","not a registered user register here!");
                           RequestDispatcher rd=null;
                     if(type.equals("user")){
                           rd=request.getRequestDispatcher("CreateUser");
                     }else if(type.equals("worker")){
                           rd=request.getRequestDispatcher("CreateWorker");     
                     }
                     
                    if(rd!=null)rd.forward(request,response);
                    
                //rd.forward(request,response);
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
