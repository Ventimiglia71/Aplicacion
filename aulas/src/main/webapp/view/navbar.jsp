<div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
        <li class="nav-item dropdown">
        	<a class="top nav-link" href="/aulas/admin">Administración</a>
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
    </ul>
    <form action="/aulas" method="GET" class="form-inline my-2 my-lg-0">
        <button class="btpurp btn-purpura my-2 my-sm-0" type="submit">Salir</button>
    </form>
</div>