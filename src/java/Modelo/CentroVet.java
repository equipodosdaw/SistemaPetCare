package Modelo;

public class CentroVet {
    
    private String cif;
    private String nombre;
    private String telefono;
    private String direccion;
    private String cp;
    private int id_ciudad;
    
    public String getCif(){
        return cif;
    }
    public void setCif(String cif){
        this.cif = cif;
    }
    public String getNombre(){
        return nombre;
    }
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    public String getTelefono(){
            return telefono;
    }
    public void setTelefono(String telefono){
        this.telefono = telefono;
    }
    public String getDireccion(){
            return direccion;
    }
    public void setDireccion(String direccion){
        this.direccion = direccion;
    }
    public String getCp(){
            return cp;
    }
    public void setCp(String cp){
        this.cp = cp;
    }
    public int getId_ciudad(){
            return id_ciudad;
    }
    public void setId_ciudad(int id_ciudad){
        this.id_ciudad = id_ciudad;
    }
}
