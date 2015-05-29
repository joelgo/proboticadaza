<%@page import="probotica.modelo.entidad.Usuario"%>
<%@page import="probotica.modelo.entidad.Persona"%>
<%@page import="probotica.modelo.dao.impl.ProboticaDaoImpl"%>
<%@page import="probotica.modelo.dao.ProboticaDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>

<%

            ProboticaDao dao = new ProboticaDaoImpl();
            Persona persona = new Persona();
            Usuario usuario = new Usuario();
        
            
            String buscarDni = request.getParameter("buscarDni");
            buscarDni = buscarDni == null ? "" : buscarDni;
            out.println("dni"+buscarDni);
           
            String idpersona = request.getParameter("idpersona");
            idpersona = idpersona == null ? "" : idpersona;
            out.println("dni"+idpersona);
            
            String nombre = request.getParameter("nombre");
            nombre = nombre == null ? "" : nombre;
            out.println("nombre"+nombre);
            
            String apellidoPat = request.getParameter("apellidoPat");
            apellidoPat = apellidoPat == null ? "" : apellidoPat;
            out.println("Apellido paterno"+apellidoPat);
            
            
            String apellidoMat = request.getParameter("apellidoMat");
            apellidoMat = apellidoMat == null ? "" : apellidoMat;
            out.println("Apellido Materno"+apellidoMat);
            
            String dni = request.getParameter("dni");
            dni = dni == null ? "" : dni;
            
            out.println("dni"+buscarDni);
            
            String usuarioo = request.getParameter("usuarioo");
            usuarioo =usuarioo  == null ? "" : usuarioo;
            out.println("usuario"+usuarioo);
            
            String password = request.getParameter("password");
            password = password == null ? "" : password;
            out.println("dni"+password);
            
            String opcion = request.getParameter("opcion");
            opcion = opcion == null ? "" : opcion; // isrvepara poder validar si es que se va a inscribir o solo buscar
            out.println("opcion"+opcion);
            String mensaje = "";
            String mensajeError = "";

            
            if (!buscarDni.equals("")) {
                persona = dao.buscarPersona(buscarDni);
                if (persona!= null) {
                    idpersona = persona.getIdpersona();
                    nombre= persona.getNombre();
                    apellidoPat = persona.getApellidoPat();
                    apellidoMat=persona.getApellidoMat();
                    dni = persona.getDni();                   
                } else {
                    mensaje = "La persona no tiene registro Registrar <a href='reg_persona.jsp'>aqui</a>";
                }

            }

            if (opcion.equals("registar")) {
                
                usuario.setIdpersona(idpersona);
                usuario.setUsuario(usuarioo);
                usuario.setPassword(password);
                usuario.setEstado("1");
                if (dao.registrarUsuario(usuario)) {
                    response.sendRedirect("bienvenido.jsp");
                } else {
                    mensajeError = "No se pudo Registrar al usuario debido a que ya existe"; 
                }
            }

           //oculta hidden
%>
<div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-3 col-md-3"></div>
                <div class="col-xs-12 col-sm-6 col-md-6 well">
<form action=" reg_usuario.jsp " method="post" class="form-horizontal">
   <table class="table table-condensed">
        <tr>
            <td><label class="col-md-12">DNI:</label></td>
            <td><input type="text" name="buscarDni" placeholder="Ingrese su Dni"  class="form-control"></td>
            <td><input type="submit" value="Buscar"></td>
        </tr>
        <tr>
         <td colspan="3"><%=mensaje%></td>
        </tr> 
   </table>    
</form>
<form action=" reg_usuario.jsp " method="post" class="form-horizontal">
    <input type="hidden" name="idpersona" value="<%=idpersona%>" class="form-horizontal">
    <input type="hidden" name="opcion" value="registar" class="form-horizontal">
     <table>
         <tr>
            <td><label class="col-md-12">Nombre</label></td>
            <td><input type="text" name="nombre" placeholder= "Nombre" value="<%=nombre%>" class="form-control" readonly="true"></td>
        </tr>
        <tr>
            <td><label class="col-md-12">Apellido Paterno</label></td>
            <td><input type="text" name="apellidoPat" placeholder= "Apellido Paterno" value="<%=apellidoPat%>" class="form-control" readonly="true"></td>
        </tr>
        <tr>
            <td><label class="col-md-12">Apellido Materno</label></td>
            <td><input type="text" name="apellidoMat" placeholder= "Apellido Materno" value="<%=apellidoMat%>" class="form-control" readonly="true"></td>
        </tr>
        <tr>
            <td><label class="col-md-12">Dni</label></td>
            <td><input type="text" name="dni" placeholder= "Dni" value="<%=dni%>" class="form-control" readonly="true"></td>
        </tr>
        
        <tr>
            <td><label class="col-md-12">Nombre usuario</label></td>
            <td><input type="text" name="usuarioo" placeholder= "Nombre de usuario" class="form-control" ></td>
        </tr>
        
        <tr>
            <td><label class="col-md-12">password</label></td>
            <td><input type="password" name="password" placeholder= "password" class="form-control"></td>
        </tr> 
        <tr>
            <td colspan="2"><label><%=mensajeError%></label></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" class="btn btn-success" value="Guardar"></td>
        </tr>
</table>
</form>
</div> 
<div class="col-xs-12 col-sm-3 col-md-3"></div>
</div>
</div>


<%@include file="WEB-INF/jspf/bottom.jspf"%>