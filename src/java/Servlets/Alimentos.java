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
    List<Alimento> listaTodo = alimentoContoller.listarTodo();
    ictrl_Pedido pedidosController = Fabrica.getInstancia().getPedidoController();
    List<Categoria> listaCategorias =  alimentoContoller.listarCategoria();

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
                out.write(request.getParameter("password")); 
            }
            if(request.getParameterMap().containsKey("pagar")){
                caso = "pagar";
                out.write("Se ha solicitado el pago."); 
            }
            if(request.getParameterMap().containsKey("textobuscar")){
                String buscar=request.getParameter("textobuscar");
                //out.write("Se ha solicitado buscar"+buscar);
                String ret=BuscarString(buscar);
                out.write(ret);
                caso = "buscar";
            }
            
            if(caso == null){
                caso = "detallesCategoria";
                Categoria categoria = (Categoria) request.getSession().getAttribute("categoria");
                request.setAttribute("categoria", categoria);
            
                if(categoria != null){
//Obtenemos la lista de alimentos que tienen esa categoria y lo mandamos a mostrar.
                    List<Plato>  alimentoDeCategoria = getAlimentos(categoria.getId());
                    //aca tengo que setear los comentarios
                    request.setAttribute("alimentos", alimentoDeCategoria);
                }
                
                if(categoria.getSecundaria() != null){
                    Categoria secundaria = categoria.getSecundaria();
                    List<Plato>  acompaniamiento = getAlimentos(secundaria.getId());
                    request.setAttribute("acompaniamiento", acompaniamiento);
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
            String extra = (String) request.getParameter("extra");        //Este dato me lo manda del javascript por ajax
            String[] e = extra.split("\\,");
            List<Alimento> alimentosPedidos = new ArrayList<>();    
            HashMap<Integer, Integer> alimentos_cantidad= new HashMap<>();
            Date fecha = Calendar.getInstance().getTime();                  //Obtengo la fecha actual
            int precio_total = 0;
            String pass = (String) request.getParameter("password");    //La contraseña que el usuario puso cuando ingreso
            Long rut = null;
            if(!request.getParameter("rut").equals("")){
                rut = Long.parseLong(request.getParameter("rut"));
            }
            int numMesa = (int) request.getSession().getAttribute("mesa");
            List<Observaciones> observaciones = new ArrayList<>();
            Pago pago = new Pago();
            pago.setRut(rut);
                    
 //[nuevoAlimento,nuevoPrecio,nuevoCantidad,idAlimento,aclaracion];       Asi viene del javascript    

            for(int i=0; i<p.length; i=i+5){       //Ya que los datos quedaron en un array de string tengo que recorrerlos y avanzar de a 5 elementos 
                String idAlimento = p[i+3];
                Alimento ap = getAlimentoPorId(idAlimento);
                Observaciones obs = new Observaciones();
                obs.setAlimento(ap);
                for(int j=0; j<e.length; j++){
                    if(e[j].equals(idAlimento)){                       
                        e[j] = "";                                      //Borro el id que ya capture
                        j++;
                        while(!isParsable(e[j])){                       //Si en e no hay un idAlimento entonces es un gusto
                            Observaciones ext = new Observaciones();
                            ext.setObservacion(e[j]);
                            ext.setAlimento(ap);
                            observaciones.add(ext);
                            e[j] = "";                                  //Voy borrando los gustos que ya agrege
                            if(e.length>=j+2){                          //Si no hay mas elementos salgo del ciclo
                                j++;
                            }else{
                                break;
                            }
                        }
                    }
                }
                alimentosPedidos.add(ap);
                alimentos_cantidad.put(Integer.parseInt(idAlimento), Integer.parseInt(p[i+2]));
                precio_total += ap.getPrecio()*Integer.parseInt(p[i+2]);
                if(i+4 < p.length){
                    obs.setObservacion(p[i+4]);
                }
                observaciones.add(obs);
            }

            Mesa mesa = getMesaPorId(numMesa);
            Pedidos nuevo = new Pedidos(fecha,precio_total,pass,enum_Estado.Pendiente,mesa,alimentosPedidos,observaciones,pago,alimentos_cantidad);

            for(Observaciones o : observaciones){
                o.setPedido(nuevo);
            }
            pago.setPedido(nuevo);
            Conexion.getInstance().alta(nuevo);
        }
        if(request.getParameterMap().containsKey("pagar")){
            if(request.getParameter("idPedido") == null ){
                int numMesa = (int) request.getSession().getAttribute("mesa");
                pedidosController.solicitarPagarTodo(numMesa);
            }else{
                String idPedido = (String) request.getParameter("idPedido");
                Long id = Long.parseLong(idPedido);
                pedidosController.solicitarPago(id);
            }
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
    
    Mesa getMesaPorId(int numMesa){
        return pedidosController.buscarMesaPorNum(numMesa);
    }

    private String BuscarString(String textoABuscar) {
        String ret="";
        String todo="";
        String primeraPalabra="";
        
        String[] parte = textoABuscar.split(" ");
        primeraPalabra=parte[0];
        
        if(textoABuscar.length()<=0){                               //caso que no haya nada que buscar
            ret="-1";
            return ret;
        }
        if(primeraPalabra.length()>=4){                             //si la primer palabra es >4 busco categoria sugerida
            ret=ret+buscarCategoria(primeraPalabra);
        }
        todo=buscarEnLista(textoABuscar);                           //busco el texto
        if(todo.length()<=0){                                       //si no encuentro, busco la primer palabra
            todo="no//";                                            //le aviso que no se encontraron resultados
            todo=todo+buscarEnLista(primeraPalabra);                
            if(buscarEnLista(primeraPalabra).length()<=0){          //no se encontraron resultados en la segunda busqueda
                todo="no//no//";
            }
            
        }
        ret=ret+todo;
        return ret;
    }
    private String buscarEnLista(String textoABuscar){
        String ret="";
        for(int i=0;i<listaTodo.size();i++){
            if (listaTodo.get(i).getNombre().toLowerCase().startsWith(textoABuscar.toLowerCase())){
               ret=ret+listaTodo.get(i).getId().toString()+"-"+
                       listaTodo.get(i).getNombre()+"-"+
                       listaTodo.get(i).getIngredientes()+"-"+
                       listaTodo.get(i).getPrecio()+"-"+
                       listaTodo.get(i).getTiempoPreparacion()
                       +"//";
            }
         }
        return ret;
    }
    private String buscarCategoria(String textoABuscar){
        String ret="";
        for(int j=0;j<listaCategorias.size();j++){
                if(listaCategorias.get(j).getNombre().toLowerCase().contains(textoABuscar.toLowerCase())){
                    ret=ret+"categoria"+"//"+listaCategorias.get(j).getId()+"//"+listaCategorias.get(j).getNombre()+"'";
                }
            }
        return ret;
    }
    
    public static boolean isParsable(String input) {
        try {
            Integer.parseInt(input);
            return true;
        } catch (final NumberFormatException e) {
            return false;
        }
    }
    
   private  static Object[]  remueveElement(Object[] arrayObjetos, int i) {
    Object[] nuevoArray = new Object[arrayObjetos.length - 1];
     if (i > 0){
           System.arraycopy(arrayObjetos, 0, nuevoArray, 0, i);
     }
     if (nuevoArray.length > i){
      System.arraycopy(arrayObjetos, i + 1, nuevoArray, i, nuevoArray.length - i);
     }
     return nuevoArray;
   }
    
}
