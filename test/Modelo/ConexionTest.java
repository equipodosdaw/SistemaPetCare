
package Modelo;

import java.sql.Connection;
import org.junit.Test;
import static org.junit.Assert.*;

public class ConexionTest {
    
    @Test
    public void testConexionExitosa() {
        Conexion miConexion = new Conexion();
        try {
            miConexion.conectar(false);
            Connection resultado = miConexion.getConexion();
            assertNotNull(resultado);
            assertFalse(resultado.isClosed());
            resultado.close();
        } catch (Exception e) {
            fail("Fallo en la conexión: " + e.getMessage());
        }
    }
}