package servlets;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


import entidades.Usuario;
import negocio.negLogin;

@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ServletLogin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String usuarioForm = request.getParameter("usuario");
		String passwordForm = request.getParameter("password");
		
		Usuario usuario = new Usuario();
		usuario.setUsuario(usuarioForm);
		usuario.setContrasenia(passwordForm);
		
		negLogin negocio = new negLogin();
		boolean esValido = negocio.validarUsuario(usuario);
		
		if (esValido) {
			HttpSession session = request.getSession();
			session.setAttribute("usuarioLogueado", usuario);
			
			response.sendRedirect("altaCliente.jsp"); 
		} else {
			request.setAttribute("error", "Usuario o contraseña incorrectos.");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
	}
}