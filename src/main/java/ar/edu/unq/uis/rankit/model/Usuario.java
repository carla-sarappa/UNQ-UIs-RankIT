package ar.edu.unq.uis.rankit.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Sarappa Carla on 22/10/16 21:49.
 */
public class Usuario extends Entity{
    private String nombre;
    private String password;
    private List<Calificacion> calificacionesRealizadas = new ArrayList<>();


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

    public void calificar(Evaluado evaluado, Integer puntuacion){
        Calificacion calificacion = Calificacion.nuevaCalificacion(puntuacion, this, evaluado);
    }

    public void agregarCalificacion(Calificacion calificacion){
        calificacionesRealizadas.add(calificacion);
    }



}