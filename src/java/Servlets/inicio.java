/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controladores_Interfaces.IAlimentoController;
import Persistencia.Conexion;
import Logica.Categoria;
import Logica.Fabrica;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vanessa
 */
@WebServlet(name = "inicio", urlPatterns = {"/inicio"})
public class inicio extends HttpServlet {
    IAlimentoController alimentoContoller = Fabrica.getInstancia().getAlimentoController();

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
            if (caso == null) {
                caso = "inicio";
            }

            
            switch(caso){
                case "chivito":
                    request.getSession().setAttribute("caso", "chivito");
                    response.sendRedirect("alimentos");
                    break;
                case "inicio":
                    List<Categoria> categorias =  alimentoContoller.listarCategoria();
                    request.setAttribute("categorias", categorias);
                    request.getRequestDispatcher("vistas/inicio.jsp").forward(request, response);
                    break;
                default:
                    
                    break;
            }

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
