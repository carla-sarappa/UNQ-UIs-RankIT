package ar.edu.unq.uis.rankit.model;

/**
 * Created by Sarappa Carla on 25/10/16 21:46.
 */
public class Calificacion extends Entity{
    public Evaluado evaluado;
    private Integer puntuacion;
    private Usuario evaluador;

    public static Calificacion nuevaCalificacion(Integer puntuacion, Usuario usuario, Evaluado evaluado){

        Calificacion calificacion = new Calificacion(puntuacion, usuario, evaluado);
        usuario.agregarCalificacion(calificacion);
        evaluado.aplicarCalificacion(calificacion);
        return calificacion;
    }



    public Calificacion(Integer puntuacion, Usuario evaluador, Evaluado evaluado) {
        this.puntuacion = puntuacion;
        this.evaluador = evaluador;
        this.evaluado = evaluado;
    }

    public Integer getPuntuacion() {
        return puntuacion;
    }


}
