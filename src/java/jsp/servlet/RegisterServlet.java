/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsp.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jsp.model.ConnectionBuilder;
import jsp.model.Secure;
import jsp.model.User;

/**
 *
 * @author Reawpai
 */
public class RegisterServlet extends HttpServlet {

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

        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String addressline1 = request.getParameter("addressline1");
        String addressline2 = request.getParameter("addressline2");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String DOB = request.getParameter("DOB");
        String gender = request.getParameter("gender");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zip = request.getParameter("zip");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String encrypt = Secure.encrypt(password);
        String msg = "";
        String target = "/register.jsp";

        try {
//            Cehck Save
            if (User.findByUsername(username)!=null) {
                msg = "Username Duplicate!!";
            } else if(username.trim().length()<=3){
                msg = "Username should be 4 character long.";
            }else {
                User.registerUser(fname, lname, addressline1, addressline2, phone, email, DOB, username, encrypt, gender, city, state, zip);
                msg = "Register Successs!!";
//                request.setAttribute("username", username);
//                request.setAttribute("password", password);
//                request.setAttribute("remember", "false");
                target = "/login.jsp";
            }
        } catch (Exception ex) {
            msg = "Register False!!";
            System.out.println("RegisterServlet error: " + ex);
        }
        request.setAttribute("msg", msg);
        getServletContext().getRequestDispatcher(target).forward(request, response);
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
