package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entidades.Cliente;

public class daoCliente {
    private String host = "jdbc:mysql://localhost:3306/sistema_clientes";
    private String user = "root";
    private String pass = "root";

    public boolean agregarCliente(Cliente cliente) {
        boolean estado = false;
        String query = "INSERT INTO clientes (dni, cuil, nombre, apellido, sexo, fecha_nacimiento, direccion, nacionalidad, localidad, provincia, correo_electronico, telefono) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection(host, user, pass);
            PreparedStatement pst = conexion.prepareStatement(query);
            
            pst.setString(1, cliente.getDni());
            pst.setString(2, cliente.getCuil());
            pst.setString(3, cliente.getNombre());
            pst.setString(4, cliente.getApellido());
            pst.setString(5, cliente.getSexo());
            pst.setString(6, cliente.getFechaNacimiento());
            pst.setString(7, cliente.getDireccion());
            pst.setString(8, cliente.getNacionalidad());
            pst.setString(9, cliente.getLocalidad());
            pst.setString(10, cliente.getProvincia());
            pst.setString(11, cliente.getCorreoElectronico());
            pst.setString(12, cliente.getTelefono());
            
            if(pst.executeUpdate() > 0) {
                estado = true;
            }
            conexion.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return estado;
    }
    
    public ArrayList<Cliente> listarClientes()
    {
        ArrayList<Cliente> listaClientes = new ArrayList<Cliente>();

        String query = "SELECT * FROM clientes";

        try
        {
            Class.forName("com.mysql.jdbc.Driver");

            Connection conexion =
                    DriverManager.getConnection(host, user, pass);

            PreparedStatement statement =
                    conexion.prepareStatement(query);

            ResultSet rs = statement.executeQuery();

            while(rs.next())
            {
                Cliente cliente = new Cliente();

                cliente.setDni(rs.getString("dni"));
                cliente.setCuil(rs.getString("cuil"));
                cliente.setNombre(rs.getString("nombre"));
                cliente.setApellido(rs.getString("apellido"));
                cliente.setSexo(rs.getString("sexo"));
                cliente.setFechaNacimiento(rs.getString("fecha_nacimiento"));
                cliente.setDireccion(rs.getString("direccion"));
                cliente.setNacionalidad(rs.getString("nacionalidad"));
                cliente.setLocalidad(rs.getString("localidad"));
                cliente.setProvincia(rs.getString("provincia"));
                cliente.setCorreoElectronico(rs.getString("correo_electronico"));
                cliente.setTelefono(rs.getString("telefono"));

                listaClientes.add(cliente);
            }

            conexion.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        return listaClientes;
    }
}