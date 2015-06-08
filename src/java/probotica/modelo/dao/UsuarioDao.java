/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package probotica.modelo.dao;

import probotica.modelo.entidad.Usuario;

/**
 *
 * @author USUARIO
 */
public interface UsuarioDao {
  public String validarDato(String usuario, String password); 
  public Usuario mostrarUsuario(String id);
}
