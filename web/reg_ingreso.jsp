<%@page import="probotica.modelo.entidad.Producto"%>
<%@page import="probotica.modelo.entidad.Presentacion"%>
<%@page import="probotica.modelo.entidad.Categoria"%>
<%@page import="probotica.modelo.entidad.UnidadMedida"%>
<%@page import="probotica.modelo.entidad.listproing"%>
<%@page import="probotica.modelo.entidad.produc_lab_lote"%>
<%@page import="probotica.modelo.entidad.Lote"%>
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
<jsp:useBean id="codigo_com" scope="session" class="java.lang.String" />

<div class="container">

    <%       
        

        ProductoDao dao2 = new ProductoDaoImpl();
        Laboratorio laboratorio1 = new Laboratorio();
        Producto producto = new Producto();
        
        

        String buscar_por = request.getParameter("buscar_por");
        buscar_por = buscar_por == null ? "nombre" : buscar_por;

        String buscar = request.getParameter("buscar");
        buscar = buscar == null ? "" : buscar;

        String opcion = request.getParameter("opcion");
        opcion = opcion == null ? "Buscar" : opcion;

        String opcion1 = request.getParameter("opcion1");
        opcion1 = opcion1 == null ? "" : opcion1;

        String mensaje = "";
        String mensaje1 = "";

        String iddistribuidor = "";

        String iddocumento = "";

        String idingreso = request.getParameter("idingreso");
        idingreso = idingreso == null ? "idingreso" : idingreso;

        String porcentajeIGV = "";

        String estado = "";
        
             String idcategoria = request.getParameter("idcategoria");
            idcategoria = idcategoria == null ? "" : idcategoria; 
            
            
            String id_presentacion = request.getParameter("id_presentacion");
            id_presentacion = id_presentacion == null ? "" : id_presentacion;     
        
               String nombreproducto = request.getParameter("nombreproducto");
            nombreproducto = nombreproducto == null ? "" : nombreproducto;
            
            String concentracion = request.getParameter("concentracion");
            concentracion = concentracion == null ? "" : concentracion;
            
            
            String id_unidadmedida = request.getParameter("id_unidadmedida");
            id_unidadmedida = id_unidadmedida == null ? "" : id_unidadmedida;
            
            
            String composicion = request.getParameter("composicion");
            composicion = composicion == null ? "" : composicion;
            
            String precio_unitario =request.getParameter("precio_unitario");
            precio_unitario = precio_unitario == null ? "" : precio_unitario;
            
            String Stock_minimo = request.getParameter("Stock_minimo");
             Stock_minimo = Stock_minimo == null ? "Stock_minimo" : Stock_minimo;
        
        
        
        

        String nombredistribuidor = request.getParameter("nombredistribuidor");
        nombredistribuidor = nombredistribuidor == null ? "nombredistribuidor" : nombredistribuidor;
        

        String nombrecomprobante = request.getParameter("nombrecomprobante");
        nombrecomprobante = nombrecomprobante == null ? "nombrecomprobante" : nombrecomprobante;
        

        String nomtipoingreso = request.getParameter("nomtipoingreso");
        nomtipoingreso = nomtipoingreso == null ? "nomtipoingreso" : nomtipoingreso;
        

        String fecha_registro = request.getParameter("fecha_registro");
        fecha_registro = fecha_registro == null ? "" : fecha_registro;
        

        String idproducto = request.getParameter("idproducto");
        idproducto = idproducto == null ? "" : idproducto;
        
        

        String nombreproductoo = request.getParameter("nombreproductoo");
        nombreproductoo = nombreproductoo == null ? "nombreproductoo" : nombreproductoo;

        String idlot = request.getParameter("idlot");
        idlot = idlot == null ? "idlot" : idlot;

        String precioingreso = request.getParameter("precioingreso");
        precioingreso = precioingreso == null ? "" : precioingreso;
        

        String cantidadunidades = request.getParameter("cantidadunidades");
        cantidadunidades = cantidadunidades == null ? "cantidadunidades" : cantidadunidades;

        String descuento = request.getParameter("descuento");
        descuento = descuento == null ? "descuento" : descuento;

        String fecha_vencimiento = request.getParameter("fecha_vencimiento");
        fecha_vencimiento = fecha_vencimiento == null ? "fecha_vencimiento" : fecha_vencimiento;

        String presentacion = request.getParameter("presentacion");
        presentacion = presentacion == null ? "presentacion" : presentacion;

        String categoria = request.getParameter("categoria");
        categoria = categoria == null ? "categoria" : categoria;

        String idlaboratorio = request.getParameter("idlaboratorio");
        idlaboratorio = idlaboratorio == null ? "idlaboratorio" : idlaboratorio;
   

        String laboratorioo = request.getParameter("laboratorioo");
        laboratorioo = laboratorioo == null ? "laboratorioo" : laboratorioo;

        String nombrelaboratorio = request.getParameter("nombrelaboratorio");
        nombrelaboratorio = nombrelaboratorio == null ? "" : nombrelaboratorio;
        
        

        if (!codigo_com.equals("") || opcion.equals("registrar") || opcion.equals("agregaringreso") || opcion.equals("actualizarin") || opcion.equals("eliminar") || opcion1.equals("reglaboratorio")|| opcion1.equals("regpro")) {

            IngresoDao dao1 = new IngresoDaoImpl();

            Ingreso ingreso = new Ingreso();

            ingreso = dao1.buscaringreso(codigo_com);

            idingreso = ingreso.getIdingreso();
            porcentajeIGV = ingreso.getPorcentajeIGV();
            nombredistribuidor = ingreso.getNombredistribuidor();
            nomtipoingreso = ingreso.getNomtipoingreso();
            fecha_registro = ingreso.getFecha_registro();
            iddocumento = ingreso.getIdingreso();
            nombrecomprobante = ingreso.getNomcomprobante();

            if (opcion.equals("registrar")) {

                if (!idingreso.equals("") & !idlot.equals("") & !fecha_vencimiento.equals("") & !idproducto.equals("") & !presentacion.equals("") & !idlaboratorio.equals("") & !cantidadunidades.equals("")) {
                    IngresoDao dao = new IngresoDaoImpl();
                    if (dao.insertarcompra(idlot, idlaboratorio, idproducto, precioingreso, cantidadunidades, descuento, idingreso, fecha_vencimiento)) {
                        opcion = "listar";

                    } else {
                        mensaje = "No se pudo Registrar la compra ";

                    }

                }

            }

            if (opcion.equals("actualizarin")) {
                if (!idingreso.equals("") & !idlot.equals("") & !fecha_vencimiento.equals("") & !idproducto.equals("") & !presentacion.equals("") & !idlaboratorio.equals("") & !cantidadunidades.equals("")) {
                    IngresoDao dao = new IngresoDaoImpl();
                    if (dao.actuIngreso(idlot, idlaboratorio, idproducto, precioingreso, cantidadunidades, descuento, idingreso, fecha_vencimiento)) {
                        opcion = "listar";
                    } else {
                        mensaje = "No se pudo Actualizar la compra";
                    }
                }
            }

            if (opcion.equals("eliminar")) {
                if (!idingreso.equals("") & !idlot.equals("") & !idproducto.equals("") & !idlaboratorio.equals("")) {
                    IngresoDao dao = new IngresoDaoImpl();
                    if (dao.EliminarIng(idlot, idlaboratorio, idproducto, idingreso)) {
                        out.println("Se eliminó saticfactoriamente");
                        opcion = "listar";
                    } else {
                        out.println("ocurrio u error al eliminar");
                        opcion = "listar";
                    }
                }
            }

            if (opcion1.equals("reglaboratorio")) {
                if (!nombrelaboratorio.equals("")) {
                    laboratorio1.setIdlaboratorio("");
                    laboratorio1.setNombrelaboratorio(nombrelaboratorio);
                    laboratorio1.setEstado("1");
                    if (dao2.reglaboratori(laboratorio1)) {
                        opcion = "agregaringreso";
                    } else {
                        mensaje1 = "No se pudo registar el laboratorio.";

                    }
                }
            }
            
             if (opcion1.equals("regpro")) {
             if(!nombreproducto.equals("") & !concentracion.equals("") & !id_unidadmedida.equals("") & !composicion.equals("")){
                producto.setIdcategoria(idcategoria);
                producto.setId_presentacion(id_presentacion);
                producto.setNombreproducto(nombreproducto);
                producto.setConcentracion(concentracion);
                producto.setId_unidadmedida(id_unidadmedida);
                producto.setComposicion(composicion);
                producto.setPrecio_unitario(precio_unitario);
                producto.setStock_minimo(Stock_minimo);
                producto.setIdusuario(idusuario);
                producto.setEstado("1");
                
                if (dao2.registarProducto(producto)) {
                    opcion = "listar";
                } else {
                    mensaje = "No se pudo registrar el producto.";     
                }
            }
            }
        }


    %>

    <div class="row well">
        <input type="hidden" name="idingreso"value="<%=idingreso%>" size="10">      
        <div class="col-xs-12 col-sm-6 col-md-8">Distribuidor:<%=nombredistribuidor%></div>
        <div class="col-xs-6 col-md-4">Tipo de Ingreso:<%=nomtipoingreso%></div>

        <div class="col-xs-6 col-md-4">COMPROBANTE : <%=nombrecomprobante%></div>

    </div>

    <div class="row"> 
        <%if (opcion.equals("agregaringreso") || opcion.equals("registrar") || opcion.equals("Buscar") || opcion.equals("actualizar") || opcion.equals("listar")) {%> 



        <div class="col-lg-5 well">

            <form action=" reg_ingreso.jsp" method="post"class="form-horizontal">
                <input type="hidden" name="codigo_com" value="<%=codigo_com%>" size="10">
                <input type="hidden" name="idingreso"value="<%=idingreso%>" size="10">  
                <table class="table table-condensed">
                    <tr>
                    <td><label>Nombre Producto:</label></td>
                    <td><input type="text" name="buscar" placeholder="Ingrese el nonbre"  class="form-control"></td>
                    <td><input type="submit" value="Buscar" class="btn btn-primary"></td>
                    </tr>
                    <tr>  
                    <td colspan="3"><%=mensaje%></td>
                    </tr>
                </table>
                <table class="table table-condensed">  
                    <tr>
                    <td>
                        <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                        Registro_Producto
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <input type="hidden" name="opcion1"value="regpro" size="10">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">Registro Producto</h4>
                                </div>
                                <div class="modal-body">

                                    <table class="table table-condensed">
                                        <tr>
                                        <td><label class="col-md-12">Nombre del producto</label></td>
                                        <td><input type="text" name="nombreproducto" placeholder= "Nombre producto" class="form-control" ></td>
                                        <td><input type="text" name="concentracion" placeholder= "Concentracion" class="form-control" ></td>
                                        <td>
                                            <select name="id_unidadmedida" class="form-control" >
                                                <%
                                                    for (UnidadMedida unidadmedida : dao2.listarUnidadMedida()) {

                                                %>
                                                <option value="<%=unidadmedida.getIdUnidadmedida()%>"><%=unidadmedida.getUnidadmedida()%></option>
                                                <%}%>
                                            </select> 
                                        </td> 
                                        </tr>
                                        <tr>
                                        <td><label class="col-md-12">Categoría</label></td>
                                        <td>
                                            <select name="idcategoria" class="form-control" >
                                                <%
                                                    for (Categoria categoriaa : dao2.listarCategoria()) {

                                                %>
                                                <option value="<%=categoriaa.getIdcategoria()%>"><%=categoriaa.getNombrecategoria()%></option>
                                                <%}%>
                                            </select> 
                                        </td> 
                                        </tr>
                                        <tr>
                                        <td><label class="col-md-12">Presentacion</label></td>
                                        <td>
                                            <select name="id_presentacion" class="form-control" >
                                                <%
                                                    for (Presentacion presentacionn : dao2.listarPresentacion()) {

                                                %>
                                                <option value="<%=presentacionn.getIdPresentacion()%>"><%=presentacionn.getNombrepresentacion()%></option>
                                                <%}%>
                                            </select> 
                                        </td> 
                                        </tr>
                                        <tr>
                                        <td><label class="col-md-12">Precio_Salida</label></td>
                                        <td><input type="text" name="precio_unitario" placeholder= "ingrese_precio" class="form-control"></td>
                                        </tr>
                                         <tr>
                                        <td><label class="col-md-12">Stock_minimo</label></td>
                                        <td><input type="text" name="Stock_minimo" placeholder= "ingrese_Stock_minimo" class="form-control"></td>
                                        </tr>
                                        <tr>
                                        <td><label class="col-md-12">Composición</label></td>
                                        <td><input type="text" name="composicion" placeholder= "Composicion" class="form-control"></td>
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
                </table>
            </form>

            <div class="table-responsive">
                <table class="table table-hover table-striped table-bordered">
                    <input type="hidden" name="codigo_com" value="<%=codigo_com%>" size="10"> 
                    <thead>
                        <tr>
                        <td width="5%" bgcolor="#FFEFCE"><strong>#</strong></td>
                        <td width="28%" bgcolor="#FFEFCE"><strong>Nombre del Producto</strong></td>
                        <td width="13%" bgcolor="#FFEFCE"><strong>Presentación</strong></td>
                        <td width="12%" ><strong>Categoría</strong></td>
                        <td width="12%" align="center" bgcolor="#FFEFCE"><strong>Opción</strong></td>
                        </tr>
                    </thead>
                    <%if (opcion.equals("Buscar")) {%>
                    <input type="hidden" name="codigo_com" value="<%=codigo_com%>" size="10">
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
                        <td align="center"><%=productoo.getNombrepresentacion()%></td>
                        <td align="center"><%=productoo.getNombrecategoria()%></td>
                        <td>
                            <a href="reg_ingreso.jsp?opcion=agregaringreso&idproducto=<%=productoo.getIdproducto()%>&nombreproductoo=<%=productoo.getNombreproducto()%>&presentacion=<%=productoo.getNombrepresentacion()%>&categoria=<%=productoo.getNombrecategoria()%>&codigo_com=<%=codigo_com%>&opcion1=reglaboratorio">Agregar registro ingreso</a>                    
                        </td>
                        </tr>
                        <%}%>
                    </tbody>
                    <%}%>               
                </table>                 
            </div>

            <div class="col-md-1"></div>
        </div>

        <div class="col-lg-7 well">    
            <%if (opcion.equals("agregaringreso") & !codigo_com.equals("")) {%>                      
            <div class="row"> 
                <div class="col-xs-12 col-sm-6 col-md-12 well">
                    <form action="reg_ingreso.jsp" method="post" class="form-horizontal">
                        <input type="hidden" name="codigo_com" value="<%=codigo_com%>" size="10">
                        <input type="hidden" name="idproducto" value="<%=idproducto%>" size="10">
                        <input type="hidden" name="idingreso"value="<%=idingreso%>" size="10">
                        <input type="hidden" name="opcion"value="registrar" size="10">
                        <table class="table table-condensed">
                            <tr>
                            <td><label class="col-md-12">Producto:</label></td>
                            <td><input type="text" name="nombreproductoo" value="<%=nombreproductoo%>" class="form-control" ></td>
                            </tr>
                            <tr>
                            <td><label class="col-md-12">Presentacion:</label></td>
                            <td><input type="text" name="presentacion" value="<%=presentacion%>" class="form-control" ></td>
                            </tr>
                            <tr>
                            <td><label class="col-md-12">Categoria:</label></td>
                            <td><input type="text" name="categoria" value="<%=categoria%>" class="form-control" ></td>
                            </tr>
                            <tr>
                            <td><label class="col-md-12">Laboratorio:</label></td>
                            <td><select name="idlaboratorio" class="form-control" >
                                    <%

                                        IngresoDao dao = new IngresoDaoImpl();
                                        for (Laboratorio laboratorio : dao.listarLaboratorio()) {

                                    %>

                                    <option value="<%=laboratorio.getIdlaboratorio()%>"><%=laboratorio.getNombrelaboratorio()%></option>
                                    <%}%>
                                </select></td>
                            <td>
                                <!-- Button trigger modal -->
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModa">
                                Registro Laboratorio
                            </button>
                            <div class="modal fade" id="myModa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <input type="hidden" name="opcion1"value="reglaboratorio" size="10">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="myModalLabel">Registro_Laboratorio</h4>
                                        </div>
                                        <div class="modal-body">
                                            <table class="table table-condensed">
                                                <tr>
                                                <td><label class="col-md-12">Nombre del Laboratorio</label></td>
                                                <td><input type="text" name="nombrelaboratorio" placeholder="Nombre laboratorio" class="form-control" ></td>
                                                </tr>
                                                <tr>
                                                <td colspan="2"><label><%=mensaje1%></label></td>
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
                            <td><label class="col-md-12">Lote:</label></td>
                            <td><input type="text" name="idlot" placeholder="ingrese" class="form-control"></td>
                            </tr>
                            <tr>
                            <td><label class="col-md-12">Fecha_vencimiento:</label></td>
                            <td><input type="date" name="fecha_vencimiento"placeholder= "ingrese fecha" class="form-control" ></td>
                            </tr>
                            <tr>
                            <td><label class="col-md-12">Cantidad</label></td>
                            <td><input type="text" name="cantidadunidades" placeholder= "cantidad" class="form-control" ></td>
                            </tr>
                            <tr>
                            <td><label class="col-md-12">Precio</label></td>
                            <td><input type="text" name="precioingreso" placeholder="precio" class="form-control" ></td>
                            </tr>
                            <tr>
                            <td><label class="col-md-12">Descuento:</label></td>
                            <td><input type="text" name="descuento" placeholder= "Descuento" class="form-control" ></td>
                            </tr>
                            <tr>
                            <td colspan="2"><label><%=mensaje%></label></td>
                            </tr>
                            <tr>
                            <td>
                            <tr>
                            <td colspan="2"><input type="submit" class="btn btn-success col-md-3" value="Guardar"></td>
                            </tr>
                            </td>                  
                            </tr>
                        </table>
                    </form>
                </div> 
                <div class="col-xs-12 col-sm-3 col-md-3"></div>
            </div>

            <%}%>

            <form action="reg_ingreso.jsp" method="post" class="form-horizontal">
                <input type="hidden" name="codigo_com" value="<%=codigo_com%>" size="10">
                <input type="hidden" name="idingreso" value="<%=idingreso%>" size="10">     
                <div class="table-responsive">                  
                    <table class="table table-hover table-striped table-bordered">
                        <thead>
                            <tr>
                            <td  bgcolor="#FFEFCE"><strong>#</strong></td>
                            <td  bgcolor="#FFEFCE"><strong>Nombre del Producto</strong></td>
                            <td  bgcolor="#FFEFCE"><strong>Presentacion</strong></td>
                            <td  bgcolor="#FFEFCE"><strong>Laboratorio</strong></td>
                            <td  bgcolor="#FFEFCE"><strong>Lote</strong></td>
                            <td  bgcolor="#FFEFCE"><strong>Fecha_Vencimiento</strong></td>
                            <td  align="center" bgcolor="#FFEFCE"><strong>Cantidad</strong></td>
                            <td  align="center" bgcolor="#FFEFCE"><strong>Precio</strong></td>
                            <td  align="center" bgcolor="#FFEFCE"><strong>Descuento</strong></td>
                            <td  align="center" bgcolor="#FFEFCE"><strong>Subtotal</strong></td>
                            <td  align="center" bgcolor="#FFEFCE"><strong>Actualizar</strong></td> 
                            <td  align="center" bgcolor="#FFEFCE"><strong>Eliminar</strong></td> 

                            </tr>
                        </thead>

                        <tbody>
                            <%

                                int count = 0;
                                IngresoDao dao = new IngresoDaoImpl();
                                for (listproing Listproing : dao.listarproductosing(idingreso)) {
                                    count++;

                            %>

                            <tr> 
                            <input type="hidden" name="codigo_com" value="<%=codigo_com%>" size="10">

                            <td><%=count%>.-</td> 
                            <td><%=Listproing.getNombreproducto()%></td>
                            <td align="center"><%=Listproing.getNombrepresentacion()%></td>
                            <td align="center"><%=Listproing.getNombrelaboratorio()%></td>
                            <td align="center"><%=Listproing.getIdlote()%></td>
                            <td align="center"><%=Listproing.getFecha_vencimiento()%></td>
                            <td align="center"><%=Listproing.getCantidad_unidades()%></td>
                            <td align="center"><%=Listproing.getPrecio_ingreso()%></td>
                            <td align="center"><%=Listproing.getDescuento()%></td>
                            <td align="center"><%=Listproing.getSubtotal()%></td>
                            <td><a href="reg_ingreso.jsp?opcion=actualizar&idproducto=<%=Listproing.getIdproducto()%>&idlaboratorio=<%=Listproing.getIdlaboratorio()%>&laboratorioo=<%=Listproing.getNombrelaboratorio()%>&idlot=<%=Listproing.getIdlote()%>&nombreproductoo=<%=Listproing.getNombreproducto()%>&presentacion=<%=Listproing.getNombrepresentacion()%>&fecha_vencimiento=<%=Listproing.getFecha_vencimiento()%>&cantidadunidades=<%=Listproing.getCantidad_unidades()%>&precioingreso=<%=Listproing.getPrecio_ingreso()%>&descuento=<%=Listproing.getDescuento()%>&codigo_com=<%=codigo_com%>">Actualizar</a></td>    
                            <td><a href="reg_ingreso.jsp?opcion=eliminar&idproducto=<%=Listproing.getIdproducto()%>&idlaboratorio=<%=Listproing.getIdlaboratorio()%>&idlot=<%=Listproing.getIdlote()%>&codigo_com=<%=codigo_com%>">Eliminar</a></td>
                            </tr>
                            <%
                                }
                               for(listproing Li : dao.TotalIngreso(idingreso)){
                                 
                            %>
                           
                                             
                        </tbody>               
                    </table>
                            <dir aling="left"><td aling="right">Total: S/=<%=Li.getTOTAL()%></td></dir>
                            
                       <%}%> 
                </div>
                <div class="col-md-1"></div>     
            </form>

            <%if (opcion.equals("actualizar")) {%>                      
            <div class="row">         
                <div class="col-xs-12 col-sm-6 col-md-12 well">
                    <form action="reg_ingreso.jsp" method="post" class="form-horizontal">
                        <input type="hidden" name="codigo_com"value="<%=codigo_com%>" size="10">
                        <input type="hidden" name="idproducto" value="<%=idproducto%>" size="10">
                        <input type="hidden" name="idingreso"value="<%=idingreso%>" size="10">
                        <input type="hidden" name="idlaboratorio"value="<%=idlaboratorio%>" size="10">
                        <input type="hidden" name="opcion" value="actualizarin" size="10">
                        <table class="table table-condensed">
                            <tr>
                            <td><label class="col-md-12">Producto:</label></td>
                            <td><input type="text" name="nombreproductoo" value="<%=nombreproductoo%>" class="form-control" ></td>
                            </tr>
                            <tr>
                            <td><label class="col-md-12">Presentacion:</label></td>
                            <td><input type="text" name="presentacion" value="<%=presentacion%>" class="form-control" ></td>
                            </tr>
                            <tr>
                            <td><label class="col-md-12">Laboratorio:</label></td>
                            <td><input type="text" name="laboratorioo" value="<%=laboratorioo%>" </td>
                            </tr>
                            <tr>
                            <td><label class="col-md-12">Lote:</label></td>
                            <td><input type="text" name="idlot" value="<%=idlot%>" class="form-control"></td>
                            </tr>
                            <tr>
                            <td><label class="col-md-12">Fecha_vencimiento:</label></td>
                            <td><input type="text" name="fecha_vencimiento" value= "<%=fecha_vencimiento%>" class="form-control"  ></td>
                            </tr>
                            <tr>
                            <td><label class="col-md-12">Cantidad</label></td>
                            <td><input type="text" name="cantidadunidades" value= "<%=cantidadunidades%>" class="form-control" ></td>
                            </tr>
                            <tr>
                            <td><label class="col-md-12">Precio</label></td>
                            <td><input type="text" name="precioingreso" value= "<%=precioingreso%>" class="form-control" ></td>
                            </tr>
                            <tr>
                            <td><label class="col-md-12">Descuento:</label></td>
                            <td><input type="text" name="descuento" value="<%=descuento%>" class="form-control" ></td>
                            </tr>
                            <tr>
                            <td colspan="2"><label><%=mensaje%></label></td>
                            </tr>
                            <tr>
                            <td>
                            <tr>
                            <td colspan="2"><input type="submit"class="btn btn-success col-md-3" value="Guardar"></td>
                            </tr>
                            </td>                  
                            </tr>
                        </table>
                    </form>
                </div> 
                <div class="col-xs-12 col-sm-3 col-md-3"></div>
            </div>     
            <%}%>
        </div>
        <div class="row">
            
            <div class="col-xs-12 col-sm-12 col-md-12 well " align="center" >
                 <form method="POST" action="close">
            <input type="hidden" name="action" value="cerrarcom">     
                <p><input type="submit" class="btn btn-primary btn-lg " value="Finalizar" ></p>
                </form>
            </div>
        </div>   
        <%}%>
    </div>
</div>
<%@include file="WEB-INF/jspf/bottom.jspf"%>
