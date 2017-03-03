/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsp.servlet;

import com.oreilly.servlet.MultipartRequest;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jsp.model.Movie;
import jsp.model.categories;
import jsp.model.has_language;

/**
 *
 * @author Reawpai
 */
public class updateMovieServlet extends HttpServlet {

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
            out.println("<title>Servlet updateMovieServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateMovieServlet at " + request.getContextPath() + "</h1>");
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
        String name = request.getParameter("movie_name");
        String id = request.getParameter("movie_id");
//        String language = request.getParameter("language");
//        int language_cast = 0;
        int movie_id = 0;
        try {
            if (id != null) {
                movie_id = Integer.parseInt(id);
            }else{
                List<Movie> lm = Movie.findByName(name);
                for(Movie m:lm){
                    movie_id = m.getMovie_id();
                }
            }
            Movie m = Movie.findById(movie_id);
            request.setAttribute("movie", m);
//            request.setAttribute("language", language);
        } catch (Exception ex) {
            System.out.println("updateMovieServlet error: " + ex);
        }
        List<categories> lc = categories.findByNameList("");
        request.setAttribute("lc", lc);
        getServletContext().getRequestDispatcher("/edit_movie.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("name");
        String poster = request.getParameter("poster");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        String releasedyear = request.getParameter("releasedyear");
        String totaltime = request.getParameter("totaltime");
        String category_name = request.getParameter("category");
        String trailer = request.getParameter("trailer");
        String msg = "";
        int mid = 0;
        int x = 0;
        try {
            int category_id = categories.findByName(category_name).getCategory_id();
            double price_cast = Double.parseDouble(price);
            List<Movie> lm = Movie.findByName(name);
            String movie_name = "";
            for (Movie m : lm) {
                movie_name = m.getName();
                mid = m.getMovie_id();
            }
            
            x = Movie.updateMovie(name, price_cast, description, poster, releasedyear, totaltime, category_id, trailer, mid);
            msg = "Update Movie Success!!";

        } catch (Exception ex) {
            System.out.println("updateMovieServlet error: " + ex);
            msg = "No Movie in Database!!";
        }
        
        
        Movie m = Movie.findById(mid);
        request.setAttribute("movie", m);
        
        List<categories> lc = categories.findByNameList("");
        request.setAttribute("lc", lc);
        
        request.setAttribute("msg", msg);
        getServletContext().getRequestDispatcher("/edit_movie.jsp").forward(request, response);
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
