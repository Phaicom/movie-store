/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jsp.model.Movie;
import jsp.model.categories;
import jsp.model.review;

/**
 *
 * @author Reawpai
 */
public class editReviewServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editReviewServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editReviewServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String id = request.getParameter("review_id");
        String movie_name = request.getParameter("movie_name");
//        String language = request.getParameter("language");
//        int language_cast = 0;
        int review_id = 0;
        try {
            if (id != null) {
                review_id = Integer.parseInt(id);
            }else if(movie_name!=null){
                int movie_id =0;
                List<Movie> lm = Movie.findByName(movie_name);
                for(Movie m:lm){
                    movie_id = m.getMovie_id();
                }
                review r = review.findByMovieId(movie_id);
                if(r == null){
                    request.setAttribute("msg", "No Review!!");
                    getServletContext().getRequestDispatcher("/edit_review.jsp").forward(request, response);
                }
                review_id = r.getReview_id();
            }
            review r = review.findById(review_id);
            request.setAttribute("review", r);
//            request.setAttribute("language", language);
        } catch (Exception ex) {
            System.out.println("editReviewServlet error: " + ex);
        }
        getServletContext().getRequestDispatcher("/edit_review.jsp").forward(request, response);
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
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String movie_name = request.getParameter("movie_name");
        String rate = request.getParameter("rating");
        String id = request.getParameter("review_id");
        String msg = "";
        try {
            int review_id = Integer.parseInt(id);
            int rating = Integer.parseInt(rate);
            review.updateReview(name, description, rating, review_id);
            msg = "Update Success!!";
            
        } catch (Exception ex) {
            msg = "Update False!!";
            System.out.println("editReviewServlet error: " + ex);
        }
        
        
        
        
        request.setAttribute("msg", msg);
        getServletContext().getRequestDispatcher("/edit_review.jsp").forward(request, response);
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
