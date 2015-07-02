<%@page import="probotica.modelo.dao.impl.ProductoDaoImpl"%>
<%@page import="probotica.modelo.dao.ProductoDao"%>
<%@page import="probotica.modelo.entidad.Laboratorio"%>
<%@page import="probotica.modelo.entidad.Producto"%>
<%@page import="probotica.modelo.dao.impl.ProboticaDaoImpl"%>
<%@page import="probotica.modelo.dao.ProboticaDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%
    
            ProductoDao dao = new ProductoDaoImpl();
            Laboratorio laboratorio = new Laboratorio();
            
            String idlaboratorio = request.getParameter("idlaboratorio");
            idlaboratorio = idlaboratorio == null ? "" : idlaboratorio;
            
            
            String nombrelaboratorio=request.getParameter("nombrelaboratorio");
            nombrelaboratorio = nombrelaboratorio == null ? "" : nombrelaboratorio;
            String opcion=request.getParameter("opcion");
            opcion=opcion == null? "" : opcion;
            String mensaje =""; 
                            
                
                if(!nombrelaboratorio.equals("")){
                laboratorio.setIdlaboratorio(idlaboratorio);
                
                laboratorio.setNombrelaboratorio(nombrelaboratorio);  
                if (dao.modificarLaboratorio(laboratorio)) {
                    response.sendRedirect("rep_laboratorio.jsp"); 
                } else {
                    
                    mensaje = "No se pudo actualizar al Laboratorio.";
                    
                }
               
                }
            
           
%>



<div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-3 col-md-1"></div>
                <div class="col-xs-12 col-sm-6 col-md-10 well">
                   
<form action="actu_laboratorio.jsp"method="post" class="form-horizontal">
    <input type="hidden" name="idlaboratorio" value="<%=idlaboratorio%>" size="10">
    <table class="table table-condensed">
        <tr>
            <td><label class="col-md-12">Nombre del Laboratorio</label></td>
            <td><input type="text" name="nombrelaboratorio" placeholder= "Nombre laboratorio" class="form-control" ></td>
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
<%@include file="WEB-INF/jspf/bottom.jspf"%>
