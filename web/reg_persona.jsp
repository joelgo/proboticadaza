<%@page import="probotica.modelo.entidad.Persona"%>
<%@page import="probotica.modelo.dao.ProboticaDao"%>
<%@page import="probotica.modelo.dao.impl.ProboticaDaoImpl"%>
<%@include file="WEB-INF/jspf/top.jspf"%>

<!--<nav class="geme">
  
<!--<form action="registro" method="Post">-->

<jsp:useBean id="mensaje" scope="request" class="java.lang.String" />
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-3 col-md-3"></div>
                <div class="col-xs-12 col-sm-6 col-md-6 well">
  <form method="POST" action="crudPer">
            <input type="hidden" name="action" value="insertar">
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
<td><input type="text" name="dni" placeholder= "Dni" class="form-control" maxlength="8"></td>
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
        
        <td><label class="col-md-12">telef/celular:</label></td>
 <td><input type="text" name="telef_celular" placeholder= "telef_celular" class="form-control" maxlength="10"></td>
        
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


