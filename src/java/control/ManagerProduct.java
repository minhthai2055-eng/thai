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
import java.util.List;
import sanpham.Brand;
import sanpham.cate;
import sanpham.products;

/**
 *
 * @author ADMIN
 */
public class ManagerProduct extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        dao1 dao = new dao1();
        String txtSearch = request.getParameter("txt");
        String type = request.getParameter("type");
        if (txtSearch == null) {
            txtSearch = "";
        }
        if (type == null) {
            type = "";
        }
        List<products> list = dao.searchByName(txtSearch, type);
        int totalProduct = dao.getTotalProduct();
        double totalValue = dao.getTotalValue();
        List<cate> listc = dao.getCategory();
        List<Brand> listb = dao.getAllBrand();
        int page = 1;
        int pageSize = 10;
        String indexPage = request.getParameter("page");
        if (indexPage != null) {
            try {
                page = Integer.parseInt(indexPage);
            } catch (Exception e) {
                page = 1;
            }
        }
        int totalProducts = list.size();
        int endPage = totalProducts / pageSize;
        if (totalProducts % pageSize != 0) {
            endPage++;
        }
        if (page > endPage && endPage != 0) {
            page = endPage;
        }
        if (page < 1) {
            page = 1;
        }
        int start = (page - 1) * pageSize;
        int end = Math.min(start + pageSize, totalProducts);
        List<products> listPage = list.subList(start, end);
        request.setAttribute("listP", listPage);
        request.setAttribute("currentPage", page);
        request.setAttribute("endPage", endPage);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("totalProduct", totalProduct);
        request.setAttribute("totalValue", totalValue);
        request.setAttribute("listc", listc);
        request.setAttribute("listb", listb);
        request.setAttribute("sortType", type);
        request.setAttribute("txtS", txtSearch);
        request.getRequestDispatcher("qlsp.jsp").forward(request, response);
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
