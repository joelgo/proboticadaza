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
import probotica.modelo.dao.ProboticaDao;
import probotica.modelo.dao.impl.ProboticaDaoImpl;
import probotica.modelo.entidad.Persona;
import probotica.modelo.entidad.Usuario;

/**
 *
 * @author USUARIO
 */
public class CrudPer extends HttpServlet {

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
        
              
                        
        
            Usuario usuario = new Usuario();

            String buscarDni = request.getParameter("buscarDni");
            buscarDni = buscarDni == null ? "" : buscarDni;
            
        

            String action = request.getParameter("action"); 
            action= action==null? "Buscar":action;  
             
              
            
             String idpersona = request.getParameter("idpersona");
             idpersona = idpersona == null ? "" : idpersona;
             System.out.println(""+idpersona);
             String nombre = request.getParameter("nombre"); nombre= nombre==null?"":nombre;
             System.out.println(""+nombre);
             String apellidoPat = request.getParameter("apellidoPat"); apellidoPat= apellidoPat==null?"":apellidoPat;
             System.out.println(""+apellidoPat);
             String apellidoMat = request.getParameter("apellidoMat"); apellidoMat= apellidoMat==null?"":apellidoMat;
             System.out.println(""+apellidoPat);
             String dni = request.getParameter("dni"); dni= dni==null?"":dni;
             System.out.println(""+dni);
             String genero = request.getParameter("genero"); genero= genero==null?"":genero;
             System.out.println(""+genero);
             String direccion = request.getParameter("direccion"); direccion= direccion==null?"":direccion;
              System.out.println(""+direccion);
             String telef_celular=request.getParameter("telef_celular"); telef_celular=telef_celular==null?"":telef_celular;
             System.out.println(""+telef_celular);
             
             
             String mensaje = "";
             
             
             
            String usuarioo = request.getParameter("usuarioo");
            usuarioo =usuarioo  == null ? "" : usuarioo;
           
            
            String password = request.getParameter("password");
            password = password == null ? "" : password;
           

            ProboticaDao dao = new ProboticaDaoImpl();
            Persona persona = new Persona();

            if(action.equals("insertar")){
              if(!nombre.equals("") & !apellidoPat.equals("") & !apellidoMat.equals("") & !dni.equals("") & !genero.equals("") & !direccion.equals("")){ 
                    
                persona.setIdpersona("");
                 persona.setNombre(nombre);
                 persona.setApellidoPat(apellidoPat);
                 persona.setApellidoMat(apellidoMat);
                 persona.setDni(dni);
                 persona.setGenero(genero);
                 persona.setDireccion(direccion);
                 persona.setTelefonoCelular(telef_celular); 
                 
                 
                 if(dao.registarPersona(persona)){
                    mensaje="La persona se registro correctamente";
                 }else{
                     mensaje ="No se pudo registrar a la Persona";
                 }
               request.setAttribute("mensaje",mensaje);
               request.getRequestDispatcher("reg_persona.jsp").forward(request, response); 
              }
              
       }
            
            if(action.equals("Buscar")){
           request.setAttribute("action",action); 
           request.getRequestDispatcher("reg_usuario.jsp?").forward(request, response);  
            }    
            
            if (!buscarDni.equals("")) {      
               request.setAttribute("action",action); 
               request.setAttribute("persona", dao.buscarPersona(buscarDni));
               request.getRequestDispatcher("reg_usuario.jsp").forward(request, response);
          
             }
            
           
            
            if (action.equals("registar")) {
                usuario.setIdusuario(idpersona);
                usuario.setUsuario(usuarioo);
                usuario.setPassword(password);
                usuario.setEstado("1");
                if (dao.registrarUsuario(usuario)){
                    mensaje="La Usuario se registro correctamente";
                } else {
                    mensaje = "No se pudo Registrar al usuario debido a que ya existe"; 
                }
                 request.setAttribute("mensaje",mensaje);
                 request.getRequestDispatcher("reg_usuario.jsp").forward(request, response); 
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
