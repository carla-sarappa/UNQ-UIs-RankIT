package ar.edu.unq.uis.rankit.model;
import ar.edu.unq.uis.rankit.model.Entity;

/**
 * Created by Sarappa Carla on 23/10/16 00:18.
 */
public class Evaluado extends Entity {
    private String nombre;

    public Evaluado(){}

    public Evaluado(String nombre) {
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}