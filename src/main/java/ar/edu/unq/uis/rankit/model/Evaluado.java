package ar.edu.unq.uis.rankit.model;
import ar.edu.unq.uis.rankit.model.Entity;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Sarappa Carla on 23/10/16 00:18.
 */
public class Evaluado extends Entity {

    private String tipo;
    private String nombre;

    private List<Calificacion> calificaciones = new ArrayList<>();

    public void aplicarCalificacion(Calificacion calificacion){
        calificaciones.add(calificacion);
    }

    public Evaluado(){}

    public Evaluado(String nombre, String tipo) {
        this.nombre = nombre;
        this.tipo = tipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Integer cantidadCalificaciones() {
        return calificaciones.size();
    }

}