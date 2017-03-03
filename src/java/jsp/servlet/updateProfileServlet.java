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
import jsp.model.Secure;
import jsp.model.User;

/**
 *
 * @author Reawpai
 */
public class updateProfileServlet extends HttpServlet {

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
        getServletContext().getRequestDispatcher("/edit_user.jsp").forward(request, response);
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
        String msg = "";
        String target = "/edit_user.jsp";
        User user = (User) request.getSession().getAttribute("user");
        int user_id = user.getUser_id();
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String addressline1 = request.getParameter("addressline1");
        String addressline2 = request.getParameter("addressline2");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String DOB = request.getParameter("DOB");
        String gender = request.getParameter("gender");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zip = request.getParameter("zip");
        String form_password = request.getParameter("password");
        //String new_password = Secure.encrypt(form_password);
        String user_password_noenc = user.getPassword();
        String user_password = Secure.decrypt(user_password_noenc);

        try {
            if (user_password.equals(form_password)) {
                User check_user = User.checkFormUpdateProfile(user_id, fname, lname, addressline1, addressline2, phone, email, DOB, gender, city, state, zip);
                String new_password = Secure.encrypt(form_password);
                User.updateUser(user_id, check_user.getFname(), check_user.getLname(), check_user.getAddressline1(), 
                        check_user.getAddressline2(), check_user.getPhone(), check_user.getEmail(), check_user.getDOB(), 
                        check_user.getGender(), check_user.getCity(), check_user.getState(), check_user.getZip());
                msg = "Update Success!!";
                User u = User.findById(user_id);
                request.getSession().setAttribute("user", u);
            } else {
                msg = "Password Incorrect!!";
            }
        } catch (Exception ex) {
            System.out.println("updateProfileServlet error " + ex);
            msg = "Update False!!";
        }
        request.setAttribute("msg", msg);
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
