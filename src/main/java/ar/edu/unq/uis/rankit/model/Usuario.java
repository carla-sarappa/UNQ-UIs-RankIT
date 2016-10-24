package ar.edu.unq.uis.rankit.model;

/**
 * Created by Sarappa Carla on 22/10/16 21:49.
 */
public class Usuario extends Entity{
    private String nombre;
    private String password;


    public Usuario(){}

    public Usuario(String nombre, String password) {
        this.nombre = nombre;
        this.password = password;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}