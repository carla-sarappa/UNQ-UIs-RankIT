package ar.edu.unq.uis.rankit.model.repository;

import org.eclipse.jetty.io.RuntimeIOException;
import org.eclipse.xtend.lib.annotations.Accessors;
import java.util.ArrayList;
import java.util.Optional;

import ar.edu.unq.uis.rankit.model.Usuario;

/**
 * Created by Sarappa Carla on 23/10/16 00:08.
 */


public class UserRepository extends BaseRepository<Usuario> {

    @Override
    public void save(Usuario element) {
        findUserByName(element.getNombre()).ifPresent((e) -> {
            throw new RuntimeException("Ya existe usuario con ese nombre");}
        );
        super.save(element);
    }

    public Optional<Usuario> findUserByName(String nombre){
        return findOneBy((usuario) -> usuario.getNombre().equals(nombre));
    }
}