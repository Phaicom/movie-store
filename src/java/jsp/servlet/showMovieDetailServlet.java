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
import jsp.model.History;
import jsp.model.Movie;
import jsp.model.User;
import jsp.model.review;

/**
 *
 * @author Reawpai
 */
public class showMovieDetailServlet extends HttpServlet {

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
        String movie_name = request.getParameter("movie_name");
        String role = request.getParameter("role");
        String type = request.getParameter("type");
        String value1 = request.getParameter("value1");
        String value2 = request.getParameter("value2");
        User u = null;
        String imgs = "";
        Movie s = null;
        int uid = 0;
        try {
            int movie_id = Integer.parseInt(id);
            if (movie_name == "" || movie_name == null) {

                s = Movie.findById(movie_id);
                imgs = s.getPoster();
            } else {
                List<Movie> lm = Movie.findByName(movie_name);
                int count = 0;
                for (Movie m : lm) {
                    count++;
                    if (count == 1) {
                        s = m;
                    }
                }
                imgs = s.getPoster();

            }
            u = (User) request.getSession(false).getAttribute("user");
            if (u != null) {
                uid = u.getUser_id();
                request.setAttribute("uid", uid);
            }
//            history

            if (History.findById(movie_id) != null) {
                History.deleteById(movie_id);
            }
                History.saveHistory(movie_id, uid);
            
            History.deleteHistory(uid);

        } catch (Exception ex) {
            System.out.println("showMovieDetailServlet error: " + ex);
        }
        request.setAttribute("s", s);
        request.setAttribute("imgs", imgs);
        getServletContext().getRequestDispatcher("/movie_detail.jsp").forward(request, response);
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
