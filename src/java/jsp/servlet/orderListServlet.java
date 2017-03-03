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
import jsp.model.User;
import jsp.model.User_order;
import jsp.model.User_orderDAO;
import jsp.model.confirm_order;

/**
 *
 * @author Reawpai
 */
public class orderListServlet extends HttpServlet {

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
            out.println("<title>Servlet orderListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet orderListServlet at " + request.getContextPath() + "</h1>");
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
        String myorder = request.getParameter("myorder");
        User u = (User) request.getSession().getAttribute("user");
        String target = "/order_list.jsp";
        try {
            int uid = u.getUser_id();
            int page = 1;
            int recordsPerPage = 8;
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
            User_orderDAO dao = new User_orderDAO();
            List<User_order> list = null;
            if (myorder == null) {
                list = dao.viewAllOrder((page - 1) * recordsPerPage,
                        recordsPerPage);
            } else {
                list = dao.viewAllOrder(uid, (page - 1) * recordsPerPage,
                        recordsPerPage);
                target = "/myOrderList.jsp";
            }
            int noOfRecords = dao.getNoOfRecords();
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
            request.setAttribute("listorder", list);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", page);
            
            
        } catch (Exception ex) {
            System.out.println("orderListServlet error: " + ex);
        }

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
        String[] updateitem = request.getParameterValues("updateitem");
        String target = "/order_list.jsp";
        String detail = request.getParameter("detail");
        String myorder = (String) request.getAttribute("myorder");
        User u = (User) request.getSession().getAttribute("user");
        try {
            if (updateitem != null) {

                for (int i = 0; i < updateitem.length; i++) {
                    User_order.completeOrder(Integer.parseInt(updateitem[i]));
                }
            }
        } catch (Exception ex) {
            System.out.println("orderListServlet error: " + ex);
        }

        try {
            if (detail != null) {
                target = "/showOrder?order_id=" + detail;
            }
            int uid = u.getUser_id();
            int page = 1;
            int recordsPerPage = 8;
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
            User_orderDAO dao = new User_orderDAO();
            List<User_order> list = null;
            if (myorder == null) {
                list = dao.viewAllOrder((page - 1) * recordsPerPage,
                        recordsPerPage);
            } else {
                list = dao.viewAllOrder(uid, (page - 1) * recordsPerPage,
                        recordsPerPage);
                target = "/myOrderList.jsp";
            }
            int noOfRecords = dao.getNoOfRecords();
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
            request.setAttribute("listorder", list);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", page);

        } catch (Exception ex) {
            System.out.println("orderListServlet error: " + ex);
        }

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
