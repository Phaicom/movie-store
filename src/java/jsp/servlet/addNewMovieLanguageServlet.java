/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsp.servlet;

import com.oreilly.servlet.Base64Encoder;
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
import static jsp.model.has_language.isSamePath;

/**
 *
 * @author Reawpai
 */
public class addNewMovieLanguageServlet extends HttpServlet {

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
        String movie_name = request.getParameter("movie_name");
        try {
            Movie movie = null;
            List<Movie> lm = Movie.findByName(movie_name);
            for (Movie m : lm) {
                movie = m;
            }
            request.setAttribute("s", movie);
        } catch (Exception ex) {
            System.out.println(ex);
        }
        getServletContext().getRequestDispatcher("/add_language.jsp").forward(request, response);
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
        String language = mr.getParameter("language");
        String path = mr.getFilesystemName("path");
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
        try {
            List<Movie> lm = Movie.findByName(name);
            String movie_name = "";
            for (Movie m : lm) {
                movie_name = m.getName();
                if (isSamePath(movie_name, language_cast) == true) {
                    m.updateLanguage(movie_name, language_cast, path);
                    msg = "Update Language Complete!!";
                } else {
                    m.addLanguage(movie_name, language_cast, path);
                    msg = "Add New Language Complete!!";
                }
            }

        } catch (Exception ex) {
            System.out.println("addLanguage Movie error: " + ex);
            msg = "No Movie in DB!!";

        }
        request.setAttribute("msg", msg);
        getServletContext().getRequestDispatcher("/add_language.jsp").forward(request, response);
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
