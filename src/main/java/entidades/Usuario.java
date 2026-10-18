package entidades;

public class Usuario {
  
	private String usuario;
    private String contrasenia;
    
    // Constructors
    public Usuario() {
    }

    public Usuario(String usuario, String contrasenia) {
    	this.usuario = usuario;
    	this.contrasenia = contrasenia;
    }

    // Getters and Setters

    
    public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getContrasenia() {
		return contrasenia;
	}

	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
	}
}