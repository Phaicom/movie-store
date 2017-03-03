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
import jsp.model.MovieDAO;
import jsp.model.movie_feature;
import jsp.model.movie_featureDAO;
import jsp.model.review;
import jsp.model.reviewDAO;

/**
 *
 * @author Reawpai
 */
public class searchServlet extends HttpServlet {

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
        String movie_name = request.getParameter("movie_name");
        String role = request.getParameter("role");
        String type = request.getParameter("type");
        String value1 = request.getParameter("value1");
        String value2 = request.getParameter("value2");
        String msg = "";
        int page = 1;
        int recordsPerPage = 16;
        int noOfPages = 0;
        int noOfRecords = 0;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        try {
            if (role.equalsIgnoreCase("Review")) {

                reviewDAO dao = new reviewDAO();
                List<review> list = dao.findByName(movie_name, (page - 1) * recordsPerPage,
                        recordsPerPage);
                noOfRecords = dao.getNoOfRecords();
                noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
                request.setAttribute("List", list);
                if (list == null) {
                    msg = "Find Review By " + movie_name + " doesn't Exist!!";
                }
            } else if(role.equalsIgnoreCase("Movie") || role.equalsIgnoreCase("")){
                MovieDAO dao = new MovieDAO();
                List<Movie> list = null;
                if (type.equalsIgnoreCase("Name") || type.equalsIgnoreCase("")) {
                    list = dao.findByName(movie_name, (page - 1) * recordsPerPage,
                            recordsPerPage);
                    noOfRecords = dao.getNoOfRecords();
                    noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
                    if (list == null) {
                        msg = "Find Movie By " + movie_name + " doesn't Exist!!";
                    }
                } else {
                    if (value1.equalsIgnoreCase("") || value2.equalsIgnoreCase("")) {
                        msg = "Please Enter Value!!";
                    }
                    double p1 = Double.parseDouble(value1);
                    double p2 = Double.parseDouble(value2);
                    list = dao.findByPrice(p1, p2, (page - 1) * recordsPerPage,
                            recordsPerPage);
                    noOfRecords = dao.getNoOfRecords();
                    noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

                    request.setAttribute("value1", p1);
                    request.setAttribute("value2", p2);
                    if (list == null) {
                        msg = "Find Review By Price " + value1 + " and " + value2 + " doesn't Exist!!";
                    }
                }
                noOfRecords = dao.getNoOfRecords();
                noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
                request.setAttribute("List", list);
            }else {
//                feature
                movie_featureDAO dao = new movie_featureDAO();
                List<movie_feature> list = null;
//                Name
                if (type.equalsIgnoreCase("Name") || type.equalsIgnoreCase("")) {
                    list = dao.viewAllFeature((page - 1) * recordsPerPage,
                            recordsPerPage,movie_name);
                    noOfRecords = dao.getNoOfRecords();
                    noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
                    if (list == null) {
                        msg = "Find Feature By " + movie_name + " doesn't Exist!!";
                    }
                } else {
//                    price
                    if (value1.equalsIgnoreCase("") || value2.equalsIgnoreCase("")) {
                        msg = "Please Enter Value!!";
                    }
                    double p1 = Double.parseDouble(value1);
                    double p2 = Double.parseDouble(value2);
                    list = dao.viewAllFeature(p1, p2, (page - 1) * recordsPerPage,
                            recordsPerPage);
                    noOfRecords = dao.getNoOfRecords();
                    noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

                    request.setAttribute("value1", p1);
                    request.setAttribute("value2", p2);
                    if (list == null) {
                        msg = "Find Feature By Price " + value1 + " and " + value2 + " doesn't Exist!!";
                    }
                }
                noOfRecords = dao.getNoOfRecords();
                noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
                request.setAttribute("List", list);
//                end
            }
        } catch (Exception ex) {
            System.out.println("searchServlet error: " + ex);
        }

        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("role", role);
        request.setAttribute("type", type);
        request.setAttribute("movie_name", movie_name);
        request.setAttribute("msg", msg);

        getServletContext().getRequestDispatcher("/search.jsp").forward(request, response);
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
