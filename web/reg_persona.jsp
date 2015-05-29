<%@page import="probotica.modelo.entidad.Persona"%>
<%@page import="probotica.modelo.dao.ProboticaDao"%>
<%@page import="probotica.modelo.dao.impl.ProboticaDaoImpl"%>
<%@include file="WEB-INF/jspf/top.jspf"%>

<!--<nav class="geme">
  
<!--<form action="registro" method="Post">-->
<%
            ProboticaDao dao = new ProboticaDaoImpl();
            Persona persona = new Persona();
            
             String idPersona = request.getParameter("idPersona"); idPersona= idPersona==null?"":idPersona;
             out.println(""+idPersona);
             String nombre = request.getParameter("nombre"); nombre= nombre==null?"":nombre;
             String apellidoPat = request.getParameter("apellidoPat"); apellidoPat= apellidoPat==null?"":apellidoPat;
             String apellidoMat = request.getParameter("apellidoMat"); apellidoMat= apellidoMat==null?"":apellidoMat;
             String dni = request.getParameter("dni"); dni= dni==null?"":dni;
             String genero = request.getParameter("genero"); genero= genero==null?"":genero;
             String direccion = request.getParameter("direccion"); direccion= direccion==null?"":direccion;
             String mensaje = "";
             
             if(!nombre.equals("") & !apellidoPat.equals("") & !apellidoMat.equals("") & !dni.equals("") & !genero.equals("") & !direccion.equals("")){
             
                 
                 persona.setNombre(nombre);
                 persona.setApellidoPat(apellidoPat);
                 persona.setApellidoMat(apellidoMat);
                 persona.setDni(dni);
                 persona.setGenero(genero);
                 persona.setDireccion(direccion);

                 if(dao.registarPersona(persona)){
                     response.sendRedirect("reg_persona.jsp");
                 }else{
                     mensaje ="No se pudo registrar al Asistente";
                 }
             }
             
             
        
        %>

        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-3 col-md-3"></div>
                <div class="col-xs-12 col-sm-6 col-md-6 well">
<form action=" reg_persona.jsp " method="post" class="form-horizontal">
    <table class="table table-condensed">
        <tr>
            <td><label class="col-md-12">Nombre</label></td>
            <td><input type="text" name="nombre" placeholder= "Nombre" class="form-control" ></td>
        </tr>
        <tr>
            <td><label class="col-md-12">Apellido Paterno</label></td>
            <td><input type="text" name="apellidoPat" placeholder= "Apellido Paterno" class="form-control" ></td>
        </tr>
        <tr>
            <td><label class="col-md-12">Apellido Materno</label></td>
            <td><input type="text" name="apellidoMat" placeholder= "Apellido Materno" class="form-control" ></td>
        </tr>
        <tr>
            <td><label class="col-md-12">Dni</label></td>
            <td><input type="text" name="dni" placeholder= "Dni" class="form-control" ></td>
        </tr>
        <tr>
            <td><label class="col-md-12">Genero</label></td>
            <td><select name="genero">
                 <option value="M">Masculino</option>
                 <option value="F">Femenino</option>
                </select>
            </td>
        </tr>
         <tr>
            <td><label class="col-md-12">Dirección</label></td>
            <td><input type="text" name="direccion" placeholder= "Dirección" class="form-control" ></td>
        </tr>
        <tr>
            <td colspan="2"><label><%=mensaje%></label></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" class="btn btn-success col-md-3" value="Guardar"></td>
        </tr>
</table>
</form>
</div> 
<div class="col-xs-12 col-sm-3 col-md-3"></div>
</div>
</div>


<!--</form>
  


  </nav>-->

<%@include file="WEB-INF/jspf/bottom.jspf"%>


