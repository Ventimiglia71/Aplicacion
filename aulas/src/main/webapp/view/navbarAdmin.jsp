<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">            
            <li class="nav-item dropdown"><a
                class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                role="button" data-toggle="dropdown" aria-haspopup="true"
                aria-expanded="false"> Equipamientos </a>
                <div class="dropdown-menu darkBG" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="/aulas/admin/AgregarEquipamiento">Alta</a>
                    <a class="dropdown-item" href="/aulas/admin/ListadoEquipo">Listado</a>
                </div>
            </li>
            <li class="nav-item dropdown"><a
                class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                role="button" data-toggle="dropdown" aria-haspopup="true"
                aria-expanded="false"> Ordenadores </a>
                <div class="dropdown-menu darkBG" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/aulas/admin/altaordenador">Alta</a>
                    <a class="dropdown-item" href="/aulas/admin/findAllOrdenador">Listado</a>
                </div>
            </li>
            <li class="nav-item dropdown"><a
                class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                role="button" data-toggle="dropdown" aria-haspopup="true"
                aria-expanded="false"> Sedes </a>
                <div class="dropdown-menu darkBG" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/aulas/admin/prepararAddSede">Alta</a>
                    <a class="dropdown-item" href="/aulas/admin/findAllSedes">Listado</a>
                    <a class="dropdown-item" href="/aulas/admin/prepararFindSede">Modificación</a>
                </div>
            </li>
            <li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Aulas </a>
				<div class="dropdown-menu darkBG" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="/aulas/admin/altaAula">Alta</a> 
					<a class="dropdown-item" href="/aulas/admin/mostrarAulas">Listado</a> 
                </div>
            </li> 
            <li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Usuarios </a>
				<div class="dropdown-menu darkBG" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="/aulas/admin/altaUsuario">Alta</a> <a
						class="dropdown-item" href="/aulas/admin/mostrarUsuarios">Listado
						usuarios</a>
				</div>
			</li>           
            <li class="nav-item dropdown"><a
                class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                role="button" data-toggle="dropdown" aria-haspopup="true"
                aria-expanded="false"> Reservas </a>
                <div class="dropdown-menu darkBG" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/aulas/preReservaUnitaria?modo=1&mensaje=Introduzca los datos">Unitarias</a>
                    <a class="dropdown-item" href="/aulas/preReservaUnitaria?modo=2&mensaje=Introduzca los datos">Por Rango de Fechas</a>
                </div>
            </li>
            <li class="nav-item dropdown">
            	<a class="top nav-link" href="/aulas/preConsulta">Consultar</a>
            </li>
            <li class="nav-item"><form action="/aulas/admin" method="GET" >
       			 <button class="btpurp btn-purpura ml-3 my-2 my-sm-0" type="submit">Inicio</button>
    		</form></li>  
        </ul>
        <a class="nav-item btn btn-primary ml-5" href="<c:url value="/logout" />">Logout</a>
    </div>