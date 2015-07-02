/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package probotica.modelo.controlador.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import probotica.modelo.dao.IngresoDao;
import probotica.modelo.dao.ProboticaDao;
import probotica.modelo.dao.impl.IngresoDaoImpl;
import probotica.modelo.dao.impl.ProboticaDaoImpl;
import probotica.modelo.entidad.Distribuidor;
import probotica.modelo.entidad.Ingreso;

/**
 *
 * @author USUARIO
 */
public class CrudIngreso extends HttpServlet {

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
        
       
                   String action = request.getParameter("action"); 
            action= action==null? "":action; 
            
            
        IngresoDao dao = new IngresoDaoImpl();
       Ingreso ingreso = new Ingreso();
    
       ProboticaDao dao1 = new ProboticaDaoImpl();
       Distribuidor distribuidor = new Distribuidor();
       
       
       String idusuario= request.getParameter("idusuario"); idusuario= idusuario==null?"":idusuario;
       
      String nombredis = request.getParameter("nombredis"); nombredis= nombredis==null?"":nombredis;
        
     String Direccion = request.getParameter("Direccion"); Direccion= Direccion==null?"":Direccion;
      String telefonoCelular = request.getParameter("telefonoCelular"); telefonoCelular= telefonoCelular==null?"":telefonoCelular;
      String correo = request.getParameter("correo"); correo= correo==null?"":correo;
             
      String ruc = request.getParameter("ruc"); ruc= ruc==null?"":ruc;
    
    
    

    String idtipoingreso = request.getParameter("idtipoingreso");
    idtipoingreso = idtipoingreso == null ? "" : idtipoingreso;
   
    String iddistribuidor = request.getParameter("iddistribuidor");
    iddistribuidor = iddistribuidor == null ? "" : iddistribuidor;
    

    String nombredistribuidor = request.getParameter("nombredistribuidor");
    nombredistribuidor = nombredistribuidor == null ? "" : nombredistribuidor;

    String iddocumento = request.getParameter("iddocumento");
    iddocumento = iddocumento == null ? "" : iddocumento;
    

    String codigo_com = request.getParameter("codigo_com");
    codigo_com = codigo_com == null ? "" : codigo_com;
  
    String porcentajeIGV = request.getParameter("porcentajeIGV");
    porcentajeIGV = porcentajeIGV == null ? "" : porcentajeIGV;

    String id_formapago = request.getParameter("id_formapago");
    id_formapago = id_formapago == null ? "" : id_formapago;

    String estado = request.getParameter("estado");
    estado = estado == null ? "" : estado;

    String mensaje = "";

    

    if (!idtipoingreso.equals("") & !iddistribuidor.equals("") & !iddocumento.equals("") & !codigo_com.equals("")) {

        ingreso.setIdtipoingreso(idtipoingreso);
        ingreso.setIddistribuidor(iddistribuidor);
        ingreso.setIddocumento(iddocumento);
        ingreso.setCodigo_com(codigo_com);
        ingreso.setPorcentajeIGV(porcentajeIGV);
        ingreso.setEstado("1");
        ingreso.setIdusuario(idusuario);
        if (dao.InsertarIngreso(ingreso)) {
           
            HttpSession session=request.getSession(); // nos permite para podder enviar la sesion
            session.setAttribute("codigo_com",codigo_com );
         request.getRequestDispatcher("reg_ingreso.jsp").forward(request, response); 
        } else {
            
            mensaje = "No se pudo Registrar el Ingreso.";
       }
        
        request.setAttribute("mensaje",mensaje);
        request.getRequestDispatcher("ingreso.jsp").forward(request, response);
    }
    
    
    
     if(!nombredis.equals("") & !Direccion.equals("") & !telefonoCelular.equals("") & !correo.equals("") & !estado.equals("") & !ruc.equals("")){
                 distribuidor.setNombredistribuidor(nombredis);
                 distribuidor.setDireccion(Direccion);
                 distribuidor.setTelefonoCelular(telefonoCelular);
                 distribuidor.setCorreo(correo);
                 distribuidor.setEstado(estado);
                 distribuidor.setRuc(ruc);
                 if(dao1.registrarDistribuidor(distribuidor)){
                  mensaje="Se registro Correctamente al Distribuidor";
                 }else{
                     mensaje ="No se pudo registrar al distribuidor";
                 }
               request.setAttribute("mensaje",mensaje);
               request.getRequestDispatcher("ingreso.jsp").forward(request, response); 
            
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
