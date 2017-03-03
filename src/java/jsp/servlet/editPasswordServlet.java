/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jsp.model.Secure;
import jsp.model.User;

/**
 *
 * @author Reawpai
 */
public class editPasswordServlet extends HttpServlet {

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
        getServletContext().getRequestDispatcher("/edit_password.jsp").forward(request, response);
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
        User user = (User) request.getSession().getAttribute("user");
        int user_id = user.getUser_id();
        String msg = "";
        String target = "/edit_password.jsp";
        String password_new_noenc = request.getParameter("password-new");
        String form_password = request.getParameter("password");
        String user_password_noenc = user.getPassword();
        String user_password = Secure.decrypt(user_password_noenc);

        try {
            if (password_new_noenc.trim().equals("") ) {
                msg = "Please Enter password!!";
            }else if(!form_password.equals(user_password)){
                msg = "Inccorrect password!!";
            } else {
                String password_new = Secure.encrypt(password_new_noenc);
                User.updatePassword(user_id, password_new);
                msg = "Update Success!!";
                User u = User.findById(user_id);
                request.getSession().setAttribute("user", u);
            }
        } catch (Exception ex) {
            System.out.println("editPasswordServlet error: " + ex);
            msg = "Update False!!";
        }
        request.setAttribute("msg", msg);
        getServletContext().getRequestDispatcher(target).forward(request, response);
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
