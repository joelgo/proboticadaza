<%@page import="probotica.modelo.dao.impl.ProboticaDaoImpl"%>
<%@page import="probotica.modelo.entidad.Distribuidor"%>
<%@page import="probotica.modelo.entidad.Persona"%>
<%@page import="probotica.modelo.dao.ProboticaDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%
            ProboticaDao dao = new ProboticaDaoImpl();
            Distribuidor distribuidor = new Distribuidor();
            
             String iddistribuidor = request.getParameter("iddistribuidor"); iddistribuidor= iddistribuidor==null?"":iddistribuidor;
            
             String nombredis = request.getParameter("nombredis"); nombredis= nombredis==null?"":nombredis;
             String Direccion = request.getParameter("Direccion"); Direccion= Direccion==null?"":Direccion;
             String telefonoCelular = request.getParameter("telefonoCelular"); telefonoCelular= telefonoCelular==null?"":telefonoCelular;
             String correo = request.getParameter("correo"); correo= correo==null?"":correo;
             String estado = request.getParameter("estado"); estado= estado==null?"":estado;
             String ruc = request.getParameter("ruc"); ruc= ruc==null?"":ruc;
             String mensaje = "";
             
             if(!nombredis.equals("") & !Direccion.equals("") & !telefonoCelular.equals("") & !correo.equals("") & !estado.equals("") & !ruc.equals("")){
             
             
                 distribuidor.setNombredistribuidor(nombredis);
                 distribuidor.setDireccion(Direccion);
                 distribuidor.setTelefonoCelular(telefonoCelular);
                 distribuidor.setCorreo(correo);
                 distribuidor.setEstado(estado);
                 distribuidor.setRuc(ruc);

                 if(dao.registrarDistribuidor(distribuidor)){
                     response.sendRedirect("reg_distribuidor.jsp");
                 }else{
                     mensaje ="No se pudo registrar al distribuidor";
                 }
             }
             
             
        
        %>

        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-3 col-md-3"></div>
                <div class="col-xs-12 col-sm-6 col-md-6 well">
<form action=" reg_distribuidor.jsp " method="post" class="form-horizontal">
    <table class="table table-condensed">
        <tr>
            <td><label class="col-md-12">Distribuidor</label></td>
            <td><input type="text" name="nombredis" placeholder= "Nombre distribuidor" class="form-control" ></td>
        </tr>
        <tr>
            <td><label class="col-md-12">Dirección</label></td>
            <td><input type="text" name="Direccion" placeholder= "direccion" class="form-control" ></td>
        </tr>
        <tr>
            <td><label class="col-md-12">Telefono/Celular</label></td>
<td><input type="text" name="telefonoCelular" placeholder= "Telefono/Celular" class="form-control" maxlength="10"></td>
        </tr>
        <tr>
            <td><label class="col-md-12">Correo</label></td>
            <td><input type="text" name="correo" placeholder= "Correo" class="form-control" ></td>
        </tr>
        <tr>
            <td><label class="col-md-12">Estado</label></td>
           <td><select name="estado">
                 <option value="1">Activo</option>
                </select>
            </td>
        </tr>
         <tr>
            <td><label class="col-md-12">Ruc</label></td>
<td><input type="text" name="ruc" placeholder= "ruc" class="form-control" maxlength="15"></td>
        </tr>
        <tr>
            <td colspan="2"><label><%=mensaje%></label></td>
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


<!--</form>
  


  </nav>-->



<%@include file="WEB-INF/jspf/bottom.jspf"%>
