/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vanessa
 */
@WebServlet(name = "Alimentos", urlPatterns = {"/alimentos"})
public class Alimentos extends HttpServlet {

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
            String caso = request.getParameter("caso");
            String seleccion = (String) request.getSession().getAttribute("caso");
            
            if (caso == null) {
                caso = seleccion;
            }
            
            switch(caso){
                case "chivito":
                    request.getRequestDispatcher("vistas/detallesCategoria.jsp").forward(request, response);
                    break;
                case "inicio":
                    request.getSession().setAttribute("caso", "inicio");
                    response.sendRedirect("inicio");
                    break;
                default:
                    break;
            }
            
//            if(arg == null){
//                request.getRequestDispatcher("vistas/detallesCategoria.jsp").forward(request, response);
//            }else if(arg.contains("pzz")){
//                request.getSession().setAttribute("valor", "categoria pizza");
//                request.getRequestDispatcher("vistas/alimentos.jsp").forward(request, response);
//            }else if(arg.contains("ham")){
//                request.getSession().setAttribute("valor", "categoria hamburguesas");
//                request.getRequestDispatcher("vistas/alimentos.jsp").forward(request, response);
//            }else if(arg.contains("sndw")){
//                request.getSession().setAttribute("valor", "categoria sandwiches");
//                request.getRequestDispatcher("vistas/alimentos.jsp").forward(request, response);
//            }else if(arg.contains("beb")){
//                request.getSession().setAttribute("valor", "categoria bebidas");
//                request.getRequestDispatcher("vistas/alimentos.jsp").forward(request, response);
//            }else if(arg.contains("post")){
//                request.getSession().setAttribute("valor", "categoria postres");
//                request.getRequestDispatcher("vistas/alimentos.jsp").forward(request, response);
//            }
//
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
