/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.alpha.servlet;

import com.alpha.dao.UserDao;
import com.alpha.entities.Message;
import com.alpha.entities.User;
import com.alpha.helper.ConnectionProvider;
import com.alpha.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author anurag
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

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
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Part profile = request.getPart("profile");
            String filename = profile.getSubmittedFileName();
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");
            user.setEmail(email);
            user.setName(name);
            String oldprofile = user.getProfile();
            user.setPassword(password);
            if (filename != "") {
                user.setProfile(filename);
            }

            UserDao userdao = new UserDao(ConnectionProvider.getConnection());
            boolean ans = userdao.updateUser(user);
            if (ans == true) {

                String path = request.getRealPath("/") + "Profile" + File.separator + user.getProfile();
                if (!oldprofile.equals("default.png")) {
                    Helper.deleteFile(request.getRealPath("/") + "Profile" + File.separator + oldprofile);
                }

                if (Helper.saveFile(profile.getInputStream(), path)) {
                    Message msg = new Message("Updated with Profile Picture", "Success", "alert-success");
                    session.setAttribute("msg", msg);
                } else {
                    Message msg = new Message("Updated", "Success", "alert-success");
                    session.setAttribute("msg", msg);
                }
                response.sendRedirect("profile.jsp");
            } else {
                Message msg = new Message("Not Updated.. Try Again", "Error", "alert-danger");
                session.setAttribute("msg", msg);
            }
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
