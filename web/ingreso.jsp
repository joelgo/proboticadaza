<%@page import="probotica.modelo.dao.impl.ProboticaDaoImpl"%>
<%@page import="probotica.modelo.dao.ProboticaDao"%>
<%@page import="probotica.modelo.entidad.forma_pago"%>
<%@page import="probotica.modelo.entidad.TipoIngreso"%>
<%@page import="probotica.modelo.entidad.Comprobante"%>
<%@page import="probotica.modelo.entidad.Distribuidor"%>
<%@page import="probotica.modelo.entidad.Ingreso"%>
<%@page import="probotica.modelo.dao.IngresoDao"%>
<%@page import="probotica.modelo.dao.impl.IngresoDaoImpl"%>

<%@include file="WEB-INF/jspf/top.jspf"%>
<jsp:useBean id="mensaje" scope="request" class="java.lang.String" />

<%    HttpSession session1 = request.getSession();
    String idPedro = (String) session1.getAttribute("idusuario");

    IngresoDao dao = new IngresoDaoImpl();
    Ingreso ingreso = new Ingreso();
    
       ProboticaDao dao1 = new ProboticaDaoImpl();
       Distribuidor distribuidor = new Distribuidor();
 

%>


<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-3 col-md-3"></div>
        <div class="col-xs-12 col-sm-6 col-md-6 well">
            <form action="crudIngreso" method="post" class="form-horizontal">
                <input type="hidden" name="idusuario" value="<%=idusuario%>" class="form-horizontal">
                <table class="table table-condensed">
                    <tr>
                    <td><label class="col-md-12">Distribuidor</label></td>
                    <td><select name="iddistribuidor" class="form-control" >
                            <% for (Distribuidor distribuidorr : dao.listardistribuidor()) {

                            %>
                            <option value="<%=distribuidorr.getIddistribuidor()%>"><%=distribuidorr.getNombredistribuidor()%></option>
                            <%}%>
                        </select> 
                    </td>

                    <td>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                        Registrar Distribuidor
                    </button>
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">Registro de Distribuidor</h4>
                                </div>
                                <div class="modal-body">
                                            <table class="table table-condensed">
                                                <tr>
                                                <td><label class="col-md-12">Distribuidor</label></td>
                                            <td><input type="text" name="nombredis" placeholder= "Nombre distribuidor" class="form-control" maxlength="99" ></td>
                                                </tr>
                                                <tr>
                                                <td><label class="col-md-12">Dirección</label></td>
                            <td><input type="text" name="Direccion" placeholder= "direccion" class="form-control" maxlength="99" ></td>
                                                </tr>
                                                <tr>
                                                <td><label class="col-md-12">Telefono/Celular</label></td>
                                                <td><input type="text" name="telefonoCelular" placeholder= "Telefono/Celular" class="form-control" maxlength="10"></td>
                                                </tr>
                                                <tr>
                                                <td><label class="col-md-12">Correo</label></td>
                                                <td><input type="text" name="correo" placeholder="Correo" class="form-control" ></td>
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
                                                <td><input type="text" name="ruc" placeholder= "ruc"  maxlength="18" class="form-control" ></td>
                                                </tr>
                                                <tr>
                                                <td colspan="2"><label><%=mensaje%></label></td>
                                                </tr>
                                            </table>      
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Guardar</button>
                                </div>
                            </div>
                        </div>
                    </div> 
                    </td>

                    </tr>
                    <tr>
                    <td><label class="col-md-12">Comprobante</label></td>
                    <td><select name="iddocumento" class="form-control" >
                            <%
                                for (Comprobante comprobante : dao.listarcomprobante()) {

                            %>
                            <option value="<%=comprobante.getIddocumento()%>"><%=comprobante.getNomcomprobante()%></option>
                            <%}%>
                        </select></td>
                    </tr>
                    <tr>
                    <td><label class="col-md-12">Tipo de Ingreso</label></td>
                    <td><select name="idtipoingreso" class="form-control" >
                            <%
                                for (TipoIngreso tipoingreso : dao.listartipoingreso()) {

                            %>
                            <option value="<%=tipoingreso.getIdtipoingreso()%>"><%=tipoingreso.getNomtipoingreso()%></option>
                            <%}%>
                        </select> 
                    </td> 
                    </tr>
                    <tr>
                    <td><label class="col-md-12">codigo_com</label></td>
                <td><input type="text" name="codigo_com" placeholder= "codigo comprobante" class="form-control" maxlength="15"></td>
                    </tr>
                    <tr>
                    <td><label class="col-md-12">porcentajeIGV</label></td>
                <td><input type="text" name="porcentajeIGV" placeholder= "IGV" class="form-control" maxlength="3"></td>
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


<%@include file="WEB-INF/jspf/bottom.jspf"%>

