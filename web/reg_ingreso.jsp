<%@page import="probotica.modelo.entidad.Laboratorio"%>
<%@page import="probotica.modelo.entidad.Ingreso"%>
<%@page import="probotica.modelo.entidad.ProductoCatUnmPre"%>
<%@page import="probotica.modelo.dao.impl.IngresoDaoImpl"%>
<%@page import="probotica.modelo.dao.IngresoDao"%>
<%@page import="probotica.modelo.dao.impl.ProductoDaoImpl"%>
<%@page import="probotica.modelo.dao.ProductoDao"%>
<%@page import="probotica.modelo.entidad.Usuario"%>
<%@page import="probotica.modelo.entidad.Persona"%>
<%@page import="probotica.modelo.dao.impl.ProboticaDaoImpl"%>
<%@page import="probotica.modelo.dao.ProboticaDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>

<div class="container">

    <%  String codigo_com = request.getParameter("codigo_com");
        codigo_com = codigo_com == null ? "" : codigo_com;
        String buscar_por = request.getParameter("buscar_por");
        buscar_por = buscar_por == null ? "nombre" : buscar_por;
        String buscar = request.getParameter("buscar");
        buscar = buscar == null ? "" : buscar;
        String opcion = request.getParameter("opcion");
        opcion = opcion == null ? "Buscar" : opcion;
        String idproducto = request.getParameter("idproducto");
        idproducto = idproducto == null ? "" : idproducto;
        String mensaje = "";

        String nombredistribuidor = request.getParameter("nombredistribuidor");
        nombredistribuidor = nombredistribuidor == null ? "nombredistribuidor" : nombredistribuidor;
       

        String nomtipoingreso = request.getParameter("nomtipoingreso");
        nomtipoingreso = nomtipoingreso == null ? "nomtipoingreso" : nomtipoingreso;

        String fecha_registro = request.getParameter("fecha_registro");
        fecha_registro = fecha_registro == null ? "fecha_registro" : fecha_registro;

        String nombrecomprobante = request.getParameter("nombrecomprobante");
        nombrecomprobante = nombrecomprobante == null ? "nombrecomprobante" : nombrecomprobante;

        String nombreproducto = request.getParameter("nombreproducto");
        nombreproducto = nombreproducto == null ? "nombreproducto" : nombreproducto;

        String concentracion = request.getParameter("concentracion");
        concentracion = concentracion == null ? "concentracion" : concentracion;
        String unidadmedida = request.getParameter("unidadmedida");
        unidadmedida = unidadmedida == null ? "unidadmedida" : unidadmedida;
        String presentacion = request.getParameter("presentacion");
        presentacion = presentacion == null ? "presentacion" : presentacion;
        String categoria = request.getParameter("categoria");
        categoria = categoria == null ? "categoria" : categoria;
        String idlaboratorio = request.getParameter("idlaboratorio");
        idlaboratorio = idlaboratorio == null ? "idlaboratorio" : idlaboratorio;

        String iddistribuidor = "";

        String iddocumento = "";

        String idingreso = "";

        String porcentajeIGV = "";

        String estado = "";

        if (!codigo_com.equals("")) {

            IngresoDao dao1 = new IngresoDaoImpl();

            Ingreso ingreso = new Ingreso();

            ingreso = dao1.buscaringreso(codigo_com);

            idingreso = ingreso.getIdingreso();
            porcentajeIGV = ingreso.getPorcentajeIGV();
            nombredistribuidor = ingreso.getNombredistribuidor();
            nomtipoingreso = ingreso.getNomtipoingreso();
            fecha_registro = ingreso.getFecha_registro();
            iddocumento = ingreso.getIdingreso();
            nombrecomprobante=ingreso.getNomcomprobante();
            

        }
        
       

    %>

 <div class="row well">
  <div class="col-xs-12 col-sm-6 col-md-8">Distribuidor:<%=nombredistribuidor%></div>
  <div class="col-xs-6 col-md-4">Tipo de Ingreso:<%=nomtipoingreso%></div>
  <div class="col-xs-12 col-sm-6 col-md-8">Fecha_Registro:<%=fecha_registro%></div>
  <div class="col-xs-6 col-md-4">COMPROBANTE : <%=nombrecomprobante%></div>
  <div class="col-xs-12 col-sm-6 col-md-8">PORCENTAJE DE IGV:<%=porcentajeIGV%></div>
</div>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10"
        <form class="form-horizontal" action="reg_ingreso.jsp" method="post"> 
                <input type="hidden" name="codigo_com"value="<%=codigo_com%>" size="10">   
                <div class="form-group">
                    <label class="control-label col-xs-3">BUSCAR:</label>
                    <div class="col-xs-5">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Realiza la b&uacute;squeda aqu&iacute;" name="buscar">
                            <span class="input-group-btn">
                                <button type="submit" class="btn btn-primary">Buscar</button>
                            </span>
                        </div><!-- /input-group -->
                    </div>  
                </div>
            </form>
        </div>
        <div class="col-md-1"></div>
    </div>
  </div>
    <br>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10" id="aler">
            <br>
            <%
                if (!mensaje.equals("")) {
            %>
            <div class="alert alert-danger"><%=mensaje%></div> 
            <%}%>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10 well">
            <div class="tab-pane">
                <table class="table table-hover table-striped table-bordered">
                    <thead>
                        <tr>
                            <td width="5%" bgcolor="#FFEFCE"><strong>#</strong></td>
                            <td width="28%" bgcolor="#FFEFCE"><strong>Nombre del Producto</strong></td>
                            <td width="12%" bgcolor="#FFEFCE"><strong>Concentración</strong></td>
                            <td width="13%" bgcolor="#FFEFCE"><strong>Presentación</strong></td>
                            <td width="12%" ><strong>Categoría</strong></td>
                            <td width="12%" align="center" bgcolor="#FFEFCE"><strong>Lote</strong></td>
                            <td width="12%" align="center" bgcolor="#FFEFCE"><strong>Laboratorio</strong></td>
                            <td width="12%" align="center" bgcolor="#FFEFCE"><strong>Opción</strong></td>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            String espacio = "  ";
                            int count = 0;
                            IngresoDao dao = new IngresoDaoImpl();
                            for (ProductoCatUnmPre productoo : dao.listarproductobuscado(buscar)) {
                                count++;


                        %>

                        <tr>     
                    <input type="hidden" name="idproducto"value="<%=productoo.getIdproducto()%>" size="10">
                    <td><%=count%>.-</td> 
                    <td><%=productoo.getNombreproducto()%></td>
                    <td align="center"><%=productoo.getConcentracion()%><%=productoo.getUnidadmedida()%></td>
                    <td align="center"><%=productoo.getNombrecategoria()%></td>
                    <td align="center"><%=productoo.getNombrepresentacion()%></td>
                    <td><input type="text" name="lote" placeholder= "ingrese" class="form-control" ></td>
                    <td>
                        <select name="idlaboratorio" class="form-control" >
                            <%

                                for (Laboratorio laboratorio : dao.listarLaboratorio()) {

                            %>
                            <option value="<%=laboratorio.getIdlaboratorio()%>"><%=laboratorio.getNombrelaboratorio()%></option>
                            <%}%>
                        </select> 
                    </td>
                    <td>
                        <a href="reg_ingreso.jsp?opcion=agregaringreso&idproducto=<%=productoo.getIdproducto()%>&nombreproducto=<%=productoo.getNombreproducto()%>&concentracion=<%=productoo.getConcentracion()%><%=productoo.getUnidadmedida()%>&presentacion=<%=productoo.getNombrepresentacion()%>&categoria=<%=productoo.getNombrecategoria()%>">Agregar registro ingreso</a>                    
                    </td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>

                    

<form action="reg_usuario.jsp" method="post" class="form-horizontal">
    <input type="hidden" name="codigo_com"value="<%=codigo_com%>" size="10">
    <input type="hidden" name="idproducto"value="<%=idproducto%>" size="10">
    <div class="container" >
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10 well">
                <div class="tab-pane">
                    <table class="table table-hover table-striped table-bordered">
                        <thead>
                            <tr>
                                <td width="5%" bgcolor="#FFEFCE"><strong>#</strong></td>
                                <td width="28%" bgcolor="#FFEFCE"><strong>Nombre del Producto</strong></td>
                                <td width="12%" bgcolor="#FFEFCE"><strong>Concentración</strong></td>
                                <td width="13%" bgcolor="#FFEFCE"><strong>Presentación</strong></td>
                                <td width="12%" align="center" bgcolor="#FFEFCE"><strong>Categoría</strong></td>
                                <td width="12%" align="center" bgcolor="#FFEFCE"><strong>Cantidad</strong></td>
                                <td width="12%" align="center" bgcolor="#FFEFCE"><strong>Opción</strong></td>         

                            </tr>
                        </thead>
                        <tbody>
                            <%

                                for (ProductoCatUnmPre productoo : dao.listarproductobuscado(buscar)) {
                                    count++;
                            %>


                            <tr>      
                                <td><%=count%>.-</td> 
                                <td><%=productoo.getNombreproducto()%></td>
                                <td align="center"><%=productoo.getConcentracion()%><%=productoo.getUnidadmedida()%></td>
                                <td align="center"><%=productoo.getNombrecategoria()%></td>
                                <td align="center"><%=productoo.getNombrepresentacion()%></td>
                                <td><input type="text" name="cantidad" placeholder= "ingrese" class="form-control" ></td>
                                <td>
                                    <a href="reg_ingreso.jsp?opcion=agregaringreso&idproducto=<%=productoo.getIdproducto()%>&nombreproducto=<%=productoo.getNombreproducto()%>&concentracion=<%=productoo.getConcentracion()%><%=productoo.getUnidadmedida()%>&presentacion=<%=productoo.getNombrepresentacion()%>&categoria=<%=productoo.getNombrecategoria()%>">Agregar registro ingreso</a>                    
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-1"></div>
        </div>
    </div>      
</form>

<%@include file="WEB-INF/jspf/bottom.jspf"%>
