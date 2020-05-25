/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controladores_Interfaces.IAlimentoController;
import Logica.Alimento;
import Logica.Categoria;
import Logica.Fabrica;
import Logica.Plato;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "Alimentos", urlPatterns = {"/alimentos"})
public class Alimentos extends HttpServlet {
    IAlimentoController alimentoContoller = Fabrica.getInstancia().getAlimentoController();
    List<Plato> listaAlimentos = alimentoContoller.listarPlatos();

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
            
            String caso = (String) request.getSession().getAttribute("caso");
            
            if(!request.getParameterMap().containsKey("caso")){
                caso = "detallesCategoria";
                Categoria categoria = (Categoria) request.getSession().getAttribute("categoria");
            
                if(categoria != null){
//Obtenemos la lista de alimentos que tienen esa categoria y lo mandamos a mostrar.
                    List<Plato>  alimentoDeCategoria = getAlimentos(categoria.getId());
                    request.setAttribute("alimentos", alimentoDeCategoria);
                    request.setAttribute("foto", categoria.getImagen());
                }
            }
            
            switch(caso){
                case "detallesCategoria":
                    request.getRequestDispatcher("vistas/detallesCategoria.jsp").forward(request, response);
                    break;
                case "inicio":
                    response.sendRedirect("inicio");
                    break;
                default:
                    response.sendRedirect("ERROR");
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

    List<Plato> getAlimentos(Long id){
        List<Plato> alimentoDeCategoria = new ArrayList<Plato>();

        for (Plato aux : listaAlimentos){
            if(aux.getCategoria().getId() == id ){
                alimentoDeCategoria.add(aux);
            }
        }
        return alimentoDeCategoria;
    }
    
}
