package ar.edu.unq.uis.rankit.model.repository;

import ar.edu.unq.uis.rankit.model.Evaluado;


import java.util.Optional;

/**
 * Created by Sarappa Carla on 23/10/16 00:32.
 */
public class EvaluadoRepository extends BaseRepository<Evaluado> {

    @Override
    public void save(Evaluado element) {
        findByName(element.getNombre()).ifPresent((e) -> {
            throw new RuntimeException("Ya existe lugar o servicio con ese nombre");
            }
        );
        super.save(element);
    }

    public Optional<Evaluado> findById(int id) {
        return findOneBy((evaluado) -> evaluado.getId() == id);
    }


    public Optional<Evaluado> findByName(String nombre){
        return findOneBy((evaluado) -> evaluado.getNombre().equals(nombre));
    }

    // TODO subir a la superclase, se repiten en todas las clases

}