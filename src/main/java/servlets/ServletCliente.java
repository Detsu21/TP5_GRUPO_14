package servlets;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import entidades.Cliente;
import negocio.negCliente;

@WebServlet("/ServletCliente")
public class ServletCliente extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ServletCliente() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getParameter("btnGuardar") != null) {
            Cliente nuevoCliente = new Cliente();
            
            nuevoCliente.setDni(request.getParameter("txtDni"));
            nuevoCliente.setCuil(request.getParameter("txtCuil"));
            nuevoCliente.setNombre(request.getParameter("txtNombre"));
            nuevoCliente.setApellido(request.getParameter("txtApellido"));
            nuevoCliente.setSexo(request.getParameter("ddlSexo"));
            nuevoCliente.setFechaNacimiento(request.getParameter("txtFechaNac"));
            nuevoCliente.setDireccion(request.getParameter("txtDireccion"));
            nuevoCliente.setNacionalidad(request.getParameter("txtNacionalidad"));
            nuevoCliente.setLocalidad(request.getParameter("txtLocalidad"));
            nuevoCliente.setProvincia(request.getParameter("txtProvincia"));
            nuevoCliente.setCorreoElectronico(request.getParameter("txtCorreo"));
            nuevoCliente.setTelefono(request.getParameter("txtTelefono"));

            negCliente negocio = new negCliente();
            boolean agregado = negocio.agregarCliente(nuevoCliente);

            if (agregado) {
                request.setAttribute("mensajeExito", "Cliente guardado exitosamente en la BD.");
            } else {
                request.setAttribute("mensajeError", "Error al guardar el cliente. Verifique si el DNI/CUIL ya existe.");
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("/altaCliente.jsp");
            dispatcher.forward(request, response);
        }
    }
}