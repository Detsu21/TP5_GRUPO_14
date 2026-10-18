package negocio;
import dao.daoLogin;
import entidades.Usuario;

public class negLogin {
	
	public boolean validarUsuario(Usuario usuario)
	{
		daoLogin dao = new daoLogin();
		
		return dao.login(usuario.getUsuario(), usuario.getContrasenia());	
	}

}