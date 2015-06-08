<%@page import="probotica.modelo.dao.impl.ProductoDaoImpl"%>
<%@page import="probotica.modelo.dao.ProductoDao"%>
<%@page import="probotica.modelo.entidad.Presentacion"%>
<%@page import="probotica.modelo.entidad.Categoria"%>
<%@page import="probotica.modelo.entidad.UnidadMedida"%>
<%@page import="probotica.modelo.entidad.Producto"%>
<%@page import="probotica.modelo.dao.impl.ProboticaDaoImpl"%>
<%@page import="probotica.modelo.dao.ProboticaDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>

<!--<nav id="reg_pro">
      
<form action="registro" method="Post" >-->




<%
    
            ProductoDao dao = new ProductoDaoImpl();
           
            Producto producto = new Producto();
            
            
            String idproducto = request.getParameter("idproducto");
            idproducto = idproducto == null ? "" : idproducto;
            
            
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
            
            String estado = request.getParameter("estado");
            estado = estado == null ? "" : estado;
            
            String mensaje = "";
            
     
            if(!nombreproducto.equals("") & !concentracion.equals("") & !id_unidadmedida.equals("") & !composicion.equals("")){

               
                producto.setIdcategoria(idcategoria);
                producto.setId_presentacion(id_presentacion);
                producto.setNombreproducto(nombreproducto);
                producto.setConcentracion(concentracion);
                producto.setId_unidadmedida(id_unidadmedida);
                producto.setComposicion(composicion);
                producto.setEstado("1");
                
                if (dao.registarProducto(producto)) {
                    response.sendRedirect("logeo.jsp");
                } else {
                    mensaje = "No se pudo Inscribir al Asistente.";
                    
                }
            }

           
%>



<div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-3 col-md-1"></div>
                <div class="col-xs-12 col-sm-6 col-md-10 well">
<form action=" reg_producto.jsp " method="post" class="form-horizontal">
    <table class="table table-condensed">
        <tr>
            <td><label class="col-md-12">Nombre del producto</label></td>
            <td><input type="text" name="nombreproducto" placeholder= "Nombre producto" class="form-control" ></td>
            <td><input type="text" name="concentracion" placeholder= "Concentracion" class="form-control" ></td>
            <td>
              <select name="id_unidadmedida" class="form-control" >
                           <%
                                for (UnidadMedida unidadmedida : dao.listarUnidadMedida()){
                                    
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
                                for (Categoria categoria : dao.listarCategoria()){
                                    
                            %>
                       <option value="<%=categoria.getIdcategoria()%>"><%=categoria.getNombrecategoria()%></option>
                      <%}%>
              </select> 
            </td> 
        </tr>
        <tr>
            <td><label class="col-md-12">Presentacion</label></td>
           <td>
              <select name="id_presentacion" class="form-control" >
                           <%
                                for (Presentacion presentacion : dao.listarPresentacion()){
                                    
                            %>
                       <option value="<%=presentacion.getIdPresentacion()%>"><%=presentacion.getNombrepresentacion()%></option>
                      <%}%>
              </select> 
            </td> 
        </tr>
        <tr>
            <td><label class="col-md-12">Composición</label></td>
            <td><input type="text" name="composicion" placeholder= "Composicion" class="form-control"></td>
        </tr>
        
        <tr>
            <td colspan="2"><label><%=mensaje%></label></td>
        </tr>
        <tr>
            <td colspan="10"><input type="submit" class="btn btn-success" value="Guardar"><a type="submit" class="btn btn-success" href="bienvenido.jsp">Salir</a></td> 
        </tr>
</table>
</form>
</div> 
<div class="col-xs-12 col-sm-3 col-md-1"></div>
</div>
</div>
<!--</form>
  
</nav>-->
<%@include file="WEB-INF/jspf/bottom.jspf"%>