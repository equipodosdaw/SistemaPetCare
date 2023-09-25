
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class DAOPROVINCIA extends Conexion {
    
    public List<Provincias> listarProvincias() throws Exception {
        List<Provincias> listarProvincias;
        Provincias provincias;
        ResultSet rs = null;
        String sql = "SELECT P.id, P.provincia FROM provincias P "
                + "ORDER BY P.id";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            listarProvincias = new ArrayList<>();
            while (rs.next() == true) {
                provincias = new Provincias();
                provincias.setId(rs.getInt("id"));
                provincias.setNombreProvincia(rs.getString("provincia"));
                listarProvincias.add(provincias);
            }
            this.cerrar(true);
        } catch (Exception e) {
            throw e;
        } finally {
        }
        return listarProvincias;
    }
    
}
