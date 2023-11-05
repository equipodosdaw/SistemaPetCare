
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class DAOMASCOTA extends Conexion {
    
    public List<Mascota> listarMascota() throws Exception {
        List<Mascota> mascotas;
        Mascota mascota;
        ResultSet rs = null;
        
        String sql = "SELECT M.id_mascota, M.nombre, M.sexo, M.dni, M.estado, U.nombreusuario"
                + " FROM mascota M INNER JOIN usuario U "
                + "ON U.dni = M.dni "
                + "ORDER BY M.id_mascota";
        
        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            mascotas = new ArrayList<>();
            //devuelve un conjunto de datos
            while (rs.next() == true) {
                mascota = new Mascota();
                mascota.setId_mascota(rs.getInt("id_mascota"));
                mascota.setNombreMascota(rs.getString("nombre"));
                mascota.setEstado(rs.getBoolean("estado"));
                mascota.setSexo(rs.getString("sexo"));
                mascota.setDni(rs.getString("dni"));
                mascota.setUsuario(new Usuario());
                mascota.getUsuario().setNombreUsuario(rs.getString("nombreusuario"));

                mascotas.add(mascota);

            }
            this.cerrar(true);
        } catch (Exception e) {
            throw e;
        } finally {
        }
        
        return mascotas;
        
    }
    
    
    public void registrarMascota(Mascota masc) throws Exception {
        String sql;
        sql = "INSERT INTO mascota (nombre, sexo, raza, especie, microchip, esterilizada, peso, color, dni) VALUES"
                + " ('" + masc.getNombreMascota() + "', '" +  masc.getSexo()  + "' , '" +  masc.getRaza()  + "' , '" +  
                 masc.getEspecie()  + "' , '" +  masc.getMicrochip()  + "' , "   +  masc.getEsterilizada() + " , "
                +  masc.getPeso() + " , '" +  masc.getColor()  + "' , '"  + masc.getUsuario().getDni()  + "'  )"; 
        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;

        } finally {

        }
    }
    
    public Mascota leerMascota(Mascota mas) throws Exception {
        Mascota mascota = null;
        ResultSet rs = null;
        String sql = "SELECT id_mascota , nombre, sexo, raza, especie, fecha_nacimiento, microchip, esterilizada, peso, color, dni, estado "
                + " FROM mascota  WHERE id_mascota = " + mas.getId_mascota();

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);

            //devuelve solo un dato. Si el usuario existe o no
            if (rs.next() == true) {
                mascota = new Mascota();
                mascota.setId_mascota(rs.getInt("id_mascota"));
                mascota.setNombreMascota(rs.getString("nombre"));
                mascota.setEstado(rs.getBoolean("estado"));
                mascota.setSexo(rs.getString("sexo"));
                mascota.setRaza(rs.getString("raza"));
                mascota.setEspecie(rs.getString("especie"));
                mascota.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
                mascota.setMicrochip(rs.getString("microchip"));
                mascota.setEsterilizada(rs.getInt("esterilizada"));
                mascota.setPeso(rs.getFloat("peso"));
                mascota.setColor(rs.getString("color"));
                mascota.setDni(rs.getString("dni"));
                mascota.setEstado(rs.getBoolean("estado"));
      

            }
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        } finally {
        }
        return mascota;
        
    }
    
    
    public void actualizarMascota(Mascota masc) throws Exception {
        String sql = "UPDATE mascota SET nombre = '"
                + masc.getNombreMascota() + "' , sexo = '"
                + masc.getSexo() + "' , raza = '"
                + masc.getRaza() + "' , especie = '"
                + masc.getEspecie() + "' , microchip = '"
                + masc.getMicrochip() + "' , peso = "
                + masc.getPeso() + ", color = '"
                + masc.getColor() + "', estado = "
                + (masc.isEstado() == true ? "1" : "0")
                + " WHERE id_mascota = " + masc.getId_mascota();
        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
            //commit
            this.cerrar(true);
        } catch (Exception e) {
            //rollback
            this.cerrar(false);
            throw e;
        }
    }
    
    public void eliminarMascota(Mascota masc) throws Exception {
        String sql = "DELETE FROM mascota"
                + " WHERE id_mascota = " + masc.getId_mascota();

        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }

    }
    
    public void cambiarEstado(Mascota mascota) throws Exception {
        String sql = "UPDATE mascota SET estado = "
                + (mascota.isEstado() == true ? "1" : "0")
                + " WHERE id_mascota = " + mascota.getId_mascota();

        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        } 
    }

    
}
