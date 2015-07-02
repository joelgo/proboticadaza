
<%@page import="probotica.modelo.entidad.Presentacion"%>
<%@page import="probotica.modelo.entidad.Categoria"%>
<%@page import="probotica.modelo.entidad.UnidadMedida"%>
<%@page import="probotica.modelo.entidad.Producto"%>
<%@page import="probotica.modelo.dao.impl.ProductoDaoImpl"%>
<%@page import="probotica.modelo.dao.ProductoDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>

<div class="container">

<%
    
          HttpSession session1 = request.getSession();
    String idPedro = (String) session1.getAttribute("idusuario");

            ProductoDao dao = new ProductoDaoImpl();
            
            Producto producto = new Producto();
            
            String action = request.getParameter("action");
            action = action == null ? "" : action;
            
            String idcategoria = request.getParameter("idcategoria");
            idcategoria = idcategoria == null ? "" : idcategoria; 
            
          
            
            String idproducto = request.getParameter("idproducto");
            idproducto = idproducto == null ? "" : idproducto; 
            
            
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
             Stock_minimo = Stock_minimo == null ? "" : Stock_minimo;
            
            
            
            
            
            String opcion=request.getParameter("opcion");
            opcion=opcion == null? "" : opcion;
 
            String mensaje =""; 
                

            
            
               
             if (opcion.equals("actupro")) {
             if(!nombreproducto.equals("") & !concentracion.equals("") & !id_unidadmedida.equals("")){
                producto.setIdproducto(idproducto);
                producto.setIdcategoria(idcategoria);
                producto.setId_presentacion(id_presentacion);
                producto.setNombreproducto(nombreproducto);
                producto.setConcentracion(concentracion);
                producto.setId_unidadmedida(id_unidadmedida);
                producto.setPrecio_unitario(precio_unitario);
                producto.setStock_minimo(Stock_minimo);
                producto.setIdusuario(idusuario);
                producto.setEstado("1");
                if (dao.actualizarProducto(producto)) {
                    response.sendRedirect("moddate.jsp");
                } else {
                    mensaje = "No se pudo Actualizar el producto.";     
                }
            }
            }     
                
            
           
%>

<h2 >Actualizar_Producto</h2>


            <div class="row">
                <div class="col-xs-12 col-sm-3 col-md-1"></div>
                <div class="col-xs-12 col-sm-6 col-md-10 well">
                   
<form action="actu_producto.jsp"method="post" class="form-horizontal">
    <input type="hidden" name="opcion" value="actupro">
    <input type="hidden" name="idproducto" value="<%=idproducto%>" >
    <table class="table table-condensed">
                                        <tr>
                                        <td><label class="col-md-12">Nombre del producto</label></td>
                                       <td><input type="text" name="nombreproducto" value="<%=nombreproducto%>" class="form-control" ></td>
                                        <td><input type="text" name="concentracion" value="<%=concentracion%>" placeholder= "Concentracion" class="form-control" ></td>
                                        <td>
                                            <select name="id_unidadmedida" class="form-control" >
                                                <%
                                                    for (UnidadMedida unidadmedida : dao.listarUnidadMedida()) {

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
                                                    for (Categoria categoriaa : dao.listarCategoria()) {

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
                                                    for (Presentacion presentacionn : dao.listarPresentacion()) {

                                                %>
                                                <option value="<%=presentacionn.getIdPresentacion()%>"><%=presentacionn.getNombrepresentacion()%></option>
                                                <%}%>
                                            </select> 
                                        </td> 
                                        </tr>
                                        
                                        <tr>
                                        <td><label class="col-md-12">Precio_Salida</label></td>
                                        <td><input type="text" name="precio_unitario" value="<%=precio_unitario%>" class="form-control"></td>
                                        </tr>
                                        
                                         <tr>
                                        <td><label class="col-md-12">Stock_minimo</label></td>
                                        <td><input type="text" name="Stock_minimo" value="<%=Stock_minimo%>" class="form-control"></td>
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
<div class="col-xs-12 col-sm-3 col-md-1"></div>


</div>
</div>
<%@include file="WEB-INF/jspf/bottom.jspf"%>