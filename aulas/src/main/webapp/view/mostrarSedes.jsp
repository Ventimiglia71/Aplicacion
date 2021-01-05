<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/aulas/css/resulClas.css" rel="stylesheet" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="/aulas/bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/aulas/bootstrap-4.5.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/aulas/css/navbarmio.css">
    <link rel="stylesheet" href="/aulas/css/sedes.css">
    
    <script>
		var idSede;
		function configurarBorrado(id){
			idSede=id;
		}
		
		function borrar(){
			window.location.href = "/aulas/sedes/deleteSede?idSede=" + idSede;
		}
		
		function modificar(idSede){
			window.location.href = "/aulas/sedes/findSede?codigo=" + idSede;
		}
	</script>
    
    <title>Listado Sedes</title>
</head>

<body>
	<c:import url="navbarVero.jsp"/>
    <h1 id="tit-listado">
        LISTADO DE SEDES
    </h1>
    <div class="container-md w-75 table-responsive" id="div-contenedor">
		<table class="table table-striped alineacionVerticalCentrada" id="tabla-sedes">
			<thead class="colores-base">
				<tr>
					<th scope="col" class="estilo-col-w5">Código</th>
					<th scope="col">Nombre</th>
					<th scope="col">Dirección</th>
                    <th scope="col">Teléfono</th>
                    <th scope="col">Aulas</th>
                    <th scope="col"></th>
                    <th scope="col"></th>                    
				</tr>
			</thead>
			<tbody>
                <c:forEach items="${sedes}" var="sede">
                    <tr>
                        <td >${sede.cod_sede}</td>  
                        <td class="estilo-col-w30">${sede.nombre_sede}</td>
                        <td class="estilo-col-w40">${sede.direccion}</td>
                        <td class="estilo-col-w10">${sede.telefono}</td>
                        <td class="estilo-col-w5">${sede.num_aulas}</td>
                        <td class="estilo-col-w5">
                        	<button type="button" class="btn btn-secondary tooltip-buttons btn-listado colores-base" data-placement="top" title="BORRAR" id="btn-borrar" data-toggle="modal" data-target="#divBorrado" onclick="configurarBorrado('${sede.cod_sede}')">
								Borrar
							</button>
                        </td>
                        <td class="estilo-col-w5">                        						
                        	<button type="button" class="btn btn-secondary tooltip-buttons btn-listado colores-base" data-placement="top" title="MODIFICAR" id="btn-modificar" onclick="modificar('${sede.cod_sede}')">
								Modificar 
							</button>									
                        </td>
                    </tr>
                </c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="modal fade" id="divBorrado" tabindex="-1" role="dialog" aria-labelledby="confirmacion-borrado" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header colores-base">
					<h5 class="modal-title" id="confirmacion-borrado">Confirmación de Borrado de Sede</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					¿Está seguro de que desea borrar?
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light" data-dismiss="modal">Cancelar</button>
					<button type="button" class="btn btn-modal-ok colores-base" id="btn-confirmar" onclick="borrar()">Confirmar</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>