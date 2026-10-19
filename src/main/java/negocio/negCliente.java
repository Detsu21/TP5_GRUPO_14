package negocio;

import java.util.ArrayList;

import dao.daoCliente;
import entidades.Cliente;

public class negCliente {
    private daoCliente dao = new daoCliente();
    
    public boolean agregarCliente(Cliente cliente) {
        return dao.agregarCliente(cliente);
    }
    
    public ArrayList<Cliente> listarClientes()
    {

        return dao.listarClientes();
    }
}