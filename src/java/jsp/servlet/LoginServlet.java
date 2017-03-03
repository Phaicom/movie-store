/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsp.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jsp.model.Secure;
import jsp.model.User;

/**
 *
 * @author Reawpai
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
        String username = "";
        String password = "";
        String remember = "";
//        if (request.getRequestURI().equals("/MovieStore/Login")) {
            username = request.getParameter("username");
            password = request.getParameter("password");
            remember = request.getParameter("remember");
//        } else {
//            username = (String) request.getAttribute("username");
//            password = (String) request.getAttribute("password");
//            remember = (String) request.getAttribute("remember");
//        }
        User u = null;
        String msg = "";
        String target = "/login.jsp";

        try {
            if (username != null && password != null) {
                u = User.findByUsername(username);
                if (u == null) {
                    msg = "User doesn't Exist!!!";
                    target = "/login.jsp";
                } else if (username.equals(u.getUsername()) && password.equals(Secure.decrypt(u.getPassword()))) {
                    request.getSession().setAttribute("user", u);
                    msg = "Login Success!!!";
                    target = "/index.jsp";
                    if (remember.equals("true")) {
                        Cookie ck = new Cookie("uname", u.getUsername());
                        ck.setMaxAge(7 * 24 * 60 * 60);
                        response.addCookie(ck);
//                        request.getSession().setMaxInactiveInterval(-1);
                    }

                } else {
                    msg = "Incorrect Password!!";
                    target = "/login.jsp";
                }

            }
        } catch (Exception ex) {
            System.out.println("LoginServlet  error: " + ex);
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
