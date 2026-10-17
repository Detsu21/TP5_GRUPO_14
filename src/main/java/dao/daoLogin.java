package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class daoLogin {
	private String host = "jdbc:mysql://localhost:3306/";
	private String user = "root";
	private String pass = "root";
	private String dbName = "sistema_clientes";

	public daoLogin()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
				e.printStackTrace();
		}
	}

	public boolean login(String usuario, String contrasena) {
	    String sql = "SELECT id_usuario FROM " + dbName + ".usuarios WHERE usuario = ? AND contrasena = ?";

	    try (Connection con = DriverManager.getConnection(host + dbName, user, pass);
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setString(1, usuario);
	        ps.setString(2, contrasena);

	        try (ResultSet rs = ps.executeQuery()) {
	            return rs.next();
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
}


