package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class DAOCENTROVET extends Conexion {
    public List<CentroVet> listarCentros() throws Exception {
        List<CentroVet> centros;
        CentroVet centro;
        ResultSet rs = null;
        String selectCentros = "SELECT cv.cif,cv.nombre,cv.telefono,cv.direccion,cv.cp, cv.id_ciudad FROM centro_veterinario cv ORDER BY nombre ASC";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(selectCentros);
            centros = new ArrayList<>();
            //devuelve un conjunto de datos
            while (rs.next() == true) {
                centro = new CentroVet();
                centro.setCif(rs.getString("cif"));
                centro.setNombre(rs.getString("nombre"));
                centro.setTelefono(rs.getString("telefono"));
                centro.setDireccion(rs.getString("direccion"));
                centro.setCp(rs.getString("cp"));
                centro.setId_ciudad(rs.getInt("id_ciudad"));
                

                centros.add(centro);

            }
           
            for(CentroVet centrovet: centros){
                System.out.println(centrovet.toString());
            }
            
            this.cerrar(true);
        } catch (Exception e) {
            throw e;
        } finally {
        }
        return centros;
    }
}
