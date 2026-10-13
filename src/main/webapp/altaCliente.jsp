
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
            <a href="#" class="d-block text-white text-decoration-none bg-dark rounded p-2 mb-2">Alta de Cliente</a>
            <a href="#" class="d-block text-white text-decoration-none p-2">Listado de Clientes</a>
        </nav>

        <main class="container-fluid p-4">
            <h2 class="mb-3">Formulario de Cliente</h2>
            <p><strong>Usuario:</strong> admin</p>
            <hr>

            <form action="#" method="post" class="border rounded bg-white p-3">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="dni" class="form-label">DNI *</label>
                        <input type="text" class="form-control" id="dni" name="dni" pattern="[0-9]{6,8}" title="Ingrese entre 6 y 8 números" required>
                        <div class="form-text">Solo números. De 6 a 8 dígitos.</div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="cuil" class="form-label">CUIL *</label>
                        <input type="text" class="form-control" id="cuil" name="cuil" pattern="[0-9]{11}" title="El CUIL debe tener 11 números" required>
                        <div class="form-text">Formato: 11 dígitos.</div>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="nombre" class="form-label">Nombre *</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" maxlength="50" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="apellido" class="form-label">Apellido *</label>
                        <input type="text" class="form-control" id="apellido" name="apellido" maxlength="50" required>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="sexo" class="form-label">Sexo *</label>
                        <select class="form-select" id="sexo" name="sexo" required>
                            <option value="">-- Seleccione --</option>
                            <option value="M">Masculino</option>
                            <option value="F">Femenino</option>
                            <option value="O">Otro</option>
                        </select>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="nacionalidad" class="form-label">Nacionalidad</label>
                        <input type="text" class="form-control" id="nacionalidad" name="nacionalidad" maxlength="40">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="fecha" class="form-label">Fecha de nacimiento *</label>
						<input type="date" class="form-control" id="fecha" name="fecha" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="direccion" class="form-label">Dirección</label>
                        <input type="text" class="form-control" id="direccion" name="direccion" maxlength="100">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="localidad" class="form-label">Localidad</label>
                        <input type="text" class="form-control" id="localidad" name="localidad" maxlength="60">
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="provincia" class="form-label">Provincia</label>
                        <input type="text" class="form-control" id="provincia" name="provincia" maxlength="60">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="correo" class="form-label">Correo electrónico *</label>
                        <input type="email" class="form-control" id="correo" name="correo" maxlength="100" placeholder="nombre@dominio.com" required>
                        <div class="form-text">Ej: nombre@dominio.com</div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="telefono" class="form-label">Teléfono</label>
                        <input type="tel" class="form-control" id="telefono" name="telefono" pattern="[0-9+() -]{8,20}" title="Ingrese un teléfono válido">
                    </div>
                </div>

                <button type="submit" class="btn btn-primary">Guardar cliente</button>
            </form>
        </main>
    </div>
</body>
</html>
