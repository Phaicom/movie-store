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
import jsp.model.User;
import jsp.model.review;

/**
 *
 * @author Reawpai
 */
public class addReviewServlet extends HttpServlet {

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
            out.println("<title>Servlet addReviewServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addReviewServlet at " + request.getContextPath() + "</h1>");
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
        List<Movie> lm = Movie.findByName("");
        request.setAttribute("lm", lm);
        String from_servlet_name = request.getParameter("movie_name");
        String target = "/add_review.jsp?from_servlet_name="+from_servlet_name;
        if(from_servlet_name == null){
            from_servlet_name = "null";
        }
        request.setAttribute("msg", from_servlet_name);
        getServletContext().getRequestDispatcher(target).forward(request, response);
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
        String rating = request.getParameter("rating");
        List<Movie> lm =  Movie.findByName(movie_name);
        int mid = 0;
        User user = (User) request.getSession().getAttribute("user");
        int uid = user.getUser_id();
        String msg = "";
        try{
            int rate = Integer.parseInt(rating);
            for(Movie m :lm){
                mid = m.getMovie_id();
            }
            review found_review = review.findByMovieId(mid);
            if(found_review==null){
                review.addReview(name, description, uid, mid, rate);
                Movie m  = Movie.findById(mid);
                Double trating = m.getTotalrating();
                trating = (trating + rate)/2;
                m.updateRating(mid, trating);
                msg = "addReview Success!!";
            }else{
                msg = "Duplicate Review!!";
            }
        }catch(Exception ex){
            System.out.println("addReviewServlet post error: "+ex);
            msg  = "Movie not found!!";
        }
        request.setAttribute("msg", msg);
        getServletContext().getRequestDispatcher("/add_review.jsp").forward(request, response);
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
