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
import javax.servlet.http.HttpSession;
import jsp.model.Cart;
import jsp.model.Movie;
import jsp.model.User;
import jsp.model.order_movie;

/**
 *
 * @author Reawpai
 */
public class CartServlet extends HttpServlet {

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
        HttpSession s = request.getSession();
        Cart c = (Cart) s.getAttribute("Cart");
        String movie_id_String = request.getParameter("movie_id");
        String quantityString = request.getParameter("quantity");
        if (c == null) {
            c = new Cart();
        }
        int qty = 1;
        int movie_id = 0;
        try {
            movie_id = Integer.parseInt(movie_id_String);
            qty = Integer.parseInt(quantityString);
            if (qty < 0) {
                qty = 1;
            }
        } catch (Exception ex) {
            qty = 1;
        }

        User u = (User) s.getAttribute("user");
        int uid = 0;
        if (u != null) {
            uid = u.getUser_id();
        }

        try {
            Movie m = Movie.findById(movie_id);

            order_movie order = new order_movie();
            order.setMovie(m);
            order.setMovie_id(movie_id);
            order.setUser_id(uid);
            order.setQty(qty);

            if (qty > 0) {
                c.addMovie(order);
            } else if (qty == 0) {
                c.removeItem(order);
            }
        } catch (Exception ex) {
            System.out.println("error: " + ex);
        }
        s.setAttribute("Cart", c);
        getServletContext().getRequestDispatcher("/cart.jsp").forward(request, response);
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
