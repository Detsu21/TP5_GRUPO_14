<%@ page import="entidades.Usuario"%>
<%@ page import="entidades.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listado de Clientes</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#tablaClientes')
								.DataTable(
										{
											language : {
												url : 'https://cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json'
											}
										});
					});
</script>
</head>
<body class="bg-light">
	<div class="d-flex min-vh-100">
		<nav class="bg-primary text-white p-3"
			style="width: 220px; flex-shrink: 0;">
			<h5 class="text-center mb-4">Menú</h5>
			<a href="altaCliente.jsp"
				class="d-block text-white text-decoration-none p-2 ">Alta de
				Cliente</a> <a href="ServletCliente"
				class="d-block text-white text-decoration-none bg-dark rounded p-2 mb-2">Listado
				de Clientes</a>
		</nav>

		<main class="container-fluid p-4">
			<h2 class="mb-3">Formulario de Cliente</h2>
			<p>
				<strong>Usuario:</strong>
				<%
				if (request.getAttribute("listaClientes") == null) {
					response.sendRedirect("ServletCliente");
					return;
				}

				Usuario usu = (Usuario) session.getAttribute("usuarioLogueado");
				if (usu != null) {
					out.print(usu.getUsuario());
				} else {
					out.print("Invitado (No logueado)");
				}

				ArrayList<Cliente> listaClientes = (ArrayList<Cliente>) request.getAttribute("listaClientes");
				%>
			</p>

			<h3>
				Listado de Clientes (<%=listaClientes.size()%>)
			</h3>
			<form action="ServletCliente" method="get"
				class="border rounded bg-white p-3">
				<table id="tablaClientes" class="display">

					<thead>
						<tr>
							<th>DNI</th>
							<th>CUIL</th>
							<th>Nombre y Apellido</th>
							<th>Sexo</th>
							<th>Fecha de Nacimiento</th>
							<th>Dirección</th>
							<th>Nacionalidad</th>
							<th>Localidad</th>
							<th>Provincia</th>
						</tr>
					</thead>

					<tbody>

						<%
						for (Cliente c : listaClientes) {
						%>
						<tr>
							<td><%=c.getDni()%></td>
							<td><%=c.getCuil()%></td>
							<td><%=c.getNombre() + " " + c.getApellido()%></td>
							<td><%=c.getSexo()%></td>
							<td><%=c.getFechaNacimiento()%></td>
							<td><%=c.getDireccion()%></td>
							<td><%=c.getNacionalidad()%></td>
							<td><%=c.getLocalidad()%></td>
							<td><%=c.getProvincia()%></td>
						</tr>

						<%
						}
						%>

					</tbody>

				</table>

			</form>

		</main>
	</div>

</body>
</html>