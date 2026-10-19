<%@ page import="entidades.Usuario" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Alta de Cliente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="d-flex min-vh-100">
        <nav class="bg-primary text-white p-3" style="width: 220px; flex-shrink: 0;">
            <h5 class="text-center mb-4">Menú</h5>
            <a href="altaCliente.jsp" class="d-block text-white text-decoration-none bg-dark rounded p-2 mb-2">Alta de Cliente</a>
            <a href="ServletCliente" class="d-block text-white text-decoration-none p-2">Listado de Clientes</a>
        </nav>

        <main class="container-fluid p-4">
            <h2 class="mb-3">Formulario de Cliente</h2>
            <p><strong>Usuario:</strong> 
                <% 
                    Usuario usu = (Usuario) session.getAttribute("usuarioLogueado");
                    if(usu != null) { 
                        out.print(usu.getUsuario());
                    } else {
                        out.print("Invitado (No logueado)");
                    }
                %>
            </p>
            <hr>

            <% if(request.getAttribute("mensajeExito") != null) { %>
                <div class="alert alert-success"><%= request.getAttribute("mensajeExito") %></div>
            <% } %>
            <% if(request.getAttribute("mensajeError") != null) { %>
                <div class="alert alert-danger"><%= request.getAttribute("mensajeError") %></div>
            <% } %>

            <form action="ServletCliente" method="post" class="border rounded bg-white p-3">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="txtDni" class="form-label">DNI *</label>
                        <input type="text" class="form-control" id="txtDni" name="txtDni" pattern="[0-9]{6,8}" title="Ingrese entre 6 y 8 números" required>
                        <div class="form-text">Solo números. De 6 a 8 dígitos.</div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="txtCuil" class="form-label">CUIL *</label>
                        <input type="text" class="form-control" id="txtCuil" name="txtCuil" pattern="[0-9]{11}" title="El CUIL debe tener 11 números" required>
                        <div class="form-text">Formato: 11 dígitos.</div>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="txtNombre" class="form-label">Nombre *</label>
                        <input type="text" class="form-control" id="txtNombre" name="txtNombre" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+" title="Solo se permiten letras" maxlength="50" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="txtApellido" class="form-label">Apellido *</label>
                        <input type="text" class="form-control" id="txtApellido" name="txtApellido" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+" title="Solo se permiten letras" maxlength="50" required>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="ddlSexo" class="form-label">Sexo *</label>
                        <select class="form-select" id="ddlSexo" name="ddlSexo" required>
                            <option value="">-- Seleccione --</option>
                            <option value="M">Masculino</option>
                            <option value="F">Femenino</option>
                            <option value="O">Otro</option>
                        </select>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="txtNacionalidad" class="form-label">Nacionalidad *</label>
                        <input type="text" class="form-control" id="txtNacionalidad" name="txtNacionalidad" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+" title="Solo se permiten letras" maxlength="40" required>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="txtFechaNac" class="form-label">Fecha de nacimiento *</label>
                        <input type="date" class="form-control" id="txtFechaNac" name="txtFechaNac" max="<%= java.time.LocalDate.now() %>" title="La fecha no puede ser futura" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="txtDireccion" class="form-label">Dirección *</label>
                        <input type="text" class="form-control" id="txtDireccion" name="txtDireccion" pattern="[a-zA-Z0-9áéíóúÁÉÍÓÚñÑ\s]+" title="Permite letras y números" maxlength="100" required>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="txtLocalidad" class="form-label">Localidad *</label>
                        <input type="text" class="form-control" id="txtLocalidad" name="txtLocalidad" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+" title="Solo se permiten letras" maxlength="60" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="txtProvincia" class="form-label">Provincia *</label>
                        <input type="text" class="form-control" id="txtProvincia" name="txtProvincia" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+" title="Solo se permiten letras" maxlength="60" required>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="txtCorreo" class="form-label">Correo electrónico *</label>
                        <input type="email" class="form-control" id="txtCorreo" name="txtCorreo" maxlength="100" placeholder="nombre@dominio.com" required>
                        <div class="form-text">Ej: nombre@dominio.com</div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="txtTelefono" class="form-label">Teléfono *</label>
                        <input type="tel" class="form-control" id="txtTelefono" name="txtTelefono" pattern="[0-9]{10}" title="Debe contener exactamente 10 dígitos numéricos" required>
                    </div>
                </div>

                <button type="submit" name="btnGuardar" class="btn btn-primary">Guardar cliente</button>
            </form>
        </main>
    </div>
</body>
</html>