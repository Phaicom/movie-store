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
import jsp.model.Movie;
import jsp.model.User;

/**
 *
 * @author Reawpai
 */
public class watchServlet extends HttpServlet {

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
        String id = request.getParameter("id");
        String path = request.getParameter("path");
        User u = (User) request.getSession().getAttribute("user");
        try {
            int movie_id = Integer.parseInt(id);
            int uid = 0;
            int role = 0;
            if (u != null) {
                uid = u.getUser_id();
                role = u.getRole();
            }
            if (!User.isBuy(uid, movie_id)) {
                if(role == 0){
                String referer = request.getHeader("Referer");
                response.sendRedirect(referer);
//                getServletContext().getRequestDispatcher(referer).forward(request, response);
                return;
                }
            }
            Movie m = Movie.findById(movie_id);
            request.setAttribute("movie", m);
            request.setAttribute("path", path);
        } catch (Exception ex) {
            System.out.println("watchServlet error: " + ex);
        }
        getServletContext().getRequestDispatcher("/watch.jsp").forward(request, response);
        return;
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
