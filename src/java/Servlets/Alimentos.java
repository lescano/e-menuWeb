/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controladores_Interfaces.IAlimentoController;
import Controladores_Interfaces.ictrl_Pedido;
import Logica.Alimento;
import Logica.Categoria;
import Logica.Fabrica;
import Logica.Mesa;
import Logica.Observaciones;
import Logica.Pago;
import Logica.Plato;
import Logica.Pedidos;
import Logica.enum_Estado;
import Persistencia.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
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
    ictrl_Pedido controladorPedido = Fabrica.getInstancia().getPedidoController();

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
            
            if(request.getParameterMap().containsKey("pedido")){
                caso = "finalizo";
            }
            
            if(caso == null){
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
                case "finalizo":
                    response.sendRedirect("salir");
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
        
        if(request.getParameterMap().containsKey("pedido")){
            String pedido = (String) request.getParameter("pedido");        //Este dato me lo manda del javascript por ajax
            String[] p = pedido.split("\\,");                               //Lo parceo ya que los datos vienen en un string
            List<Alimento> alimentosPedidos = new ArrayList<>();    
            HashMap<Integer, Integer> alimentos_cantidad= new HashMap<>();
            Date fecha = Calendar.getInstance().getTime();                  //Obtengo la fecha actual
            int precio_total = 0;
            String pass = (String) request.getParameter("password");    //La contraseña que el usuario puso cuando ingreso
            Long rut = Long.parseLong(request.getParameter("rut"));
            String idMesa = (String) request.getSession().getAttribute("mesa");
            List<Observaciones> observaciones = new ArrayList<>();
            Pago pago = new Pago();
            pago.setRut(rut);
                    
 //[nuevoAlimento,nuevoPrecio,nuevoCantidad,idAlimento,aclaracion];       Asi viene del javascript    

            for(int i=0; i<p.length; i= i+5){       //Ya que los datos quedaron en un array de string tengo que recorrerlos y avanzar de a 5 elementos 
                String idAlimento = p[i+3];         
                Alimento ap = getAlimentoPorId(idAlimento);
                alimentosPedidos.add(ap);
                alimentos_cantidad.put(Integer.parseInt(idAlimento), Integer.parseInt(p[i+2]));
                precio_total += ap.getPrecio();
                Observaciones obs = new Observaciones();
                obs.setAlimento(ap);
                if(i+4 < p.length){
                    obs.setObservacion(p[i+4]);
                }
                observaciones.add(obs);
            }

            Mesa mesa = getMesaPorId("41");
            Pedidos nuevo = new Pedidos(fecha,precio_total,pass,enum_Estado.Pendiente,mesa,alimentosPedidos,observaciones,pago,alimentos_cantidad);

            for(Observaciones o : observaciones){
                o.setPedido(nuevo);
            }
            pago.setPedido(nuevo);
            Conexion.getInstance().alta(nuevo);
        }
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
    
    Alimento getAlimentoPorId(String id){
        Long idAlimento = Long.parseLong(id);
        for (Plato aux : listaAlimentos){
            if(aux.getId() == idAlimento ){
                return aux;
            }
        }
        return null;
    }
    
    Mesa getMesaPorId(String id){
        return controladorPedido.buscarMesaPorId(Integer.parseInt(id));
    }
    
}
