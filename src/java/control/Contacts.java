/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import DAO.dao1;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import sanpham.User;
import sanpham.gioHang;

/**
 *
 * @author ADMIN
 */
public class Contacts extends HttpServlet {

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
            out.println("<title>Servlet NewServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");

        gioHang cart = new gioHang();

        if (user != null) {
            dao1 dao = new dao1();
            cart = dao.getCartByUserId(user.getId());

            if (cart == null) {
                cart = new gioHang();
            }
        }

        request.setAttribute("cart", cart);
        request.getRequestDispatcher("lienhe.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        dao1 a = new dao1();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");
        if (user == null) {
            response.sendRedirect("TrangChu#dangnhap");
            return;
        }
        gioHang cart = a.getCartByUserId(user.getId());

        if (cart == null) {
            cart = new gioHang();
        }
        request.setAttribute("cart", cart);
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");

        if (fullname == null || fullname.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            phone == null || phone.trim().isEmpty() ||
            message == null || message.trim().isEmpty()){

            request.setAttribute("error", "Không được để trống");
            request.getRequestDispatcher("lienhe.jsp").forward(request,response);
            return;
        }

        if(!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")){
            request.setAttribute("error", "Email không đúng định dạng");
            request.getRequestDispatcher("lienhe.jsp").forward(request,response);
            return;
        }

        if(!phone.matches("^[0-9]{10}$")){
            request.setAttribute("error", "Số điện thoại không hợp lệ");
            request.getRequestDispatcher("lienhe.jsp").forward(request,response);
            return;
        }
        a.Contact(fullname, email, phone, message);
        request.setAttribute("success", "Gửi liên hệ thành công");
        request.getRequestDispatcher("lienhe.jsp").forward(request,response);
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
