/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import DAO.dao1;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.List;
import sanpham.products;

/**
 *
 * @author ADMIN
 */
@MultipartConfig
public class Edit extends HttpServlet {

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
            out.println("<title>Servlet Edit</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Edit at " + request.getContextPath() + "</h1>");
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
        String id = request.getParameter("id");
        int productId = Integer.parseInt(id);
        dao1 dao = new dao1();
        products p = dao.getPById(id);
        List<Integer> cateList = dao.getCategoryIdsByProductId(productId);
        request.setAttribute("cateList",cateList);
        request.setAttribute("cate1", cateList.contains(1));
        request.setAttribute("cate2", cateList.contains(2));
        request.setAttribute("cate3", cateList.contains(3));
        request.setAttribute("cate4", cateList.contains(4));
        request.setAttribute("cate5", cateList.contains(5));
        request.setAttribute("detail", p);
        request.setAttribute("listP", dao.getAll());
        request.setAttribute("listb", dao.getAllBrand());
        request.getRequestDispatcher("qlsp.jsp").forward(request, response);       
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
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String saleRaw = request.getParameter("sale_price");
        double salePrice = 0;
        if (saleRaw != null && !saleRaw.trim().isEmpty()) {
            salePrice = Double.parseDouble(saleRaw);
        }
        String des = request.getParameter("description");
        int brandId = Integer.parseInt(request.getParameter("brand_id"));
        int isNew = request.getParameter("is_new") != null ? 1 : 0;
        int isHot = request.getParameter("is_hot") != null ? 1 : 0;
        int isSale = request.getParameter("is_sale") != null ? 1 : 0;
        dao1 dao = new dao1();
        products oldProduct = dao.getPById(String.valueOf(id));
        String imagePath = oldProduct.getImage();
        Part filePart = request.getPart("image");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = new File(filePart.getSubmittedFileName()).getName();
            String uploadPath = getServletContext().getRealPath("/images");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            File saveFile = new File(uploadDir, fileName);
            try (InputStream input = filePart.getInputStream()) {
                Files.copy(input,saveFile.toPath(),StandardCopyOption.REPLACE_EXISTING);
            }
            imagePath = "images/" + fileName;
        }
        dao.updateProduct(id, name, price, imagePath, brandId, des, salePrice, isNew, isHot, isSale);
        dao.deleteProductCategory(id);
        String[] categories =  request.getParameterValues("category_id");
        if (categories != null) {
            for (String c : categories) {
                dao.insertProductCategory(id, Integer.parseInt(c));
            }
        }
        response.sendRedirect("ManagerProduct");
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
