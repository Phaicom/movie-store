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
import jsp.model.User_order;
import jsp.model.confirm_order;
import jsp.model.order_movie;

/**
 *
 * @author Reawpai
 */
public class confirmOrderServlet extends HttpServlet {

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
            out.println("<title>Servlet confirmOrderServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet confirmOrderServlet at " + request.getContextPath() + "</h1>");
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
        String id = request.getParameter("order_id");
        try{
            int order_id = Integer.parseInt(id);
            User_order uo = User_order.findById(order_id);
            List<order_movie> lom = order_movie.findByIdList(order_id);
            
            request.setAttribute("listmovie", lom);
            request.setAttribute("order", uo);
        }catch(Exception ex){
            System.out.println("confirmOrderServlet error: "+ex);
        }
        getServletContext().getRequestDispatcher("/confirmOrder.jsp").forward(request, response);
        return;
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
        String amt = request.getParameter("amount");
        String bank =request.getParameter("bank");
        String id = request.getParameter("order_id");
        String datetransfer = request.getParameter("datetransfer");
        try{
            double amount = Double.parseDouble(amt);
            int order_id = Integer.parseInt(id);
            confirm_order.addConfirm_order(amount, bank, order_id,datetransfer);
            User_order.updateStatus(order_id, -1);
            request.setAttribute("msg", "Confirm Success!!");
        }catch(Exception ex){
            request.setAttribute("msg", "Confirm False!!");
            System.out.println("confirmOrderServlet error: "+ex);
        }
//        request.setAttribute("myorder", "123");
//        bug
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        return;
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
