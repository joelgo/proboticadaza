<%@page import="probotica.modelo.entidad.Usuario"%>
<%@page import="probotica.modelo.entidad.Persona"%>
<%@page import="probotica.modelo.dao.impl.ProboticaDaoImpl"%>
<%@page import="probotica.modelo.dao.ProboticaDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<jsp:useBean id="mensaje" scope="request" class="java.lang.String" />
<jsp:useBean id="action" scope="request" class="java.lang.String" />

<jsp:useBean id="persona" scope="request" class="probotica.modelo.entidad.Persona" />


<div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-3 col-md-3"></div>
                <div class="col-xs-12 col-sm-6 col-md-6 well">
<%if(action.equals("Buscar")){%>
 <form method="POST" action="crudPer">
            <input type="hidden" name="action" value="registrar">
   <table class="table table-condensed">
        <tr>
            <td><label class="col-md-12">DNI:</label></td>
   <td><input type="text" name="buscarDni" placeholder="Ingrese su Dni"  class="form-control" maxlength="8"></td>
            <td><input type="submit" value="Buscar"></td>
        </tr>
        <tr>  
         <td colspan="3"><%=mensaje%></td>
        </tr> 
   </table>    
</form>
        <%}%>    
        <%if(action.equals("registrar")){ 
            
          if(persona.getIdpersona()!=null&&persona.getNombre()!=null){   
        %>
<form method="POST" action="crudPer" class="form-horizontal">
    <input type="hidden" name="idpersona" value="<%=persona.getIdpersona()%>" class="form-horizontal">
    <input type="hidden" name="action" value="registar" class="form-horizontal">
     <table>
         <tr>
            <td><label class="col-md-12">Nombre</label></td>
            <td><input type="text" name="nombre" placeholder= "Nombre" value="<%=persona.getNombre()%>" class="form-control" readonly="true"></td>
        </tr>
        <tr>
            <td><label class="col-md-12">Apellido Paterno</label></td>
            <td><input type="text" name="apellidoPat" placeholder= "Apellido Paterno" value="<%=persona.getApellidoPat()%>" class="form-control" readonly="true"></td>
        </tr>
        <tr>
            <td><label class="col-md-12">Apellido Materno</label></td>
            <td><input type="text" name="apellidoMat" placeholder= "Apellido Materno" value="<%=persona.getApellidoMat()%>" class="form-control" readonly="true"></td>
        </tr>
        <tr>
            <td><label class="col-md-12">Dni</label></td>
            <td><input type="text" name="dni" placeholder= "Dni" value="<%=persona.getDni()%>" class="form-control" readonly="true"></td>
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
            <td colspan="2"><label><%=mensaje%></label></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" class="btn btn-success" value="Registrar"></td>
        </tr>
</table>
         <%}else{%>
             <a href='reg_persona.jsp'>Registrar_Datos_Personales_Aquí</a>
          <%}%>
          
</form>  
        <%}%>
       
</div> 
        
<div class="col-xs-12 col-sm-3 col-md-3"></div>
</div>
</div>


<%@include file="WEB-INF/jspf/bottom.jspf"%>