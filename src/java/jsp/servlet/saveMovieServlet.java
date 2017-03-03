/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsp.servlet;

import com.oreilly.servlet.MultipartRequest;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
public class saveMovieServlet extends HttpServlet {

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
        List<categories> lc = categories.findByNameList("");
        request.setAttribute("lc", lc);
        getServletContext().getRequestDispatcher("/add_movie.jsp").forward(request, response);
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
        MultipartRequest mr = new MultipartRequest(request, "C:\\Users\\Reawpai\\Desktop\\MovieStore\\web\\movies", 1000000000);
        String name = mr.getParameter("name");
        String path = mr.getFilesystemName("path");
        String poster = mr.getParameter("poster");
        String price = mr.getParameter("price");
        String description = mr.getParameter("description");
        String releasedyear = mr.getParameter("releasedyear");
        String totaltime = mr.getParameter("totaltime");
        String language = mr.getParameter("language");
        String category_name = mr.getParameter("category");
        String trailer = mr.getParameter("trailer");
        String msg = "";
        int language_cast = 0;
        switch (language) {
            case "thai":
                language_cast = 1;
                break;
            case "english":
                language_cast = 2;
                break;
        }
        int x = 0;
        double price_cast = Double.parseDouble(price);
        int category_id = categories.findByName(category_name).getCategory_id();
        try {
            List<Movie> lm = Movie.findByName(name);
            String movie_name = "";
            for (Movie m : lm) {
                movie_name = m.getName();
            }
            msg = "Duplicate Movie!!";

        } catch (Exception ex) {
            System.out.println("saveMovieServlet error: " + ex);
            x = Movie.saveMovie(name, price_cast, description, poster, releasedyear, totaltime, language_cast, path, category_id, trailer);
            msg = "Add Movie Success!!";
        }
        request.setAttribute("msg", msg);
        getServletContext().getRequestDispatcher("/add_movie.jsp").forward(request, response);
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
