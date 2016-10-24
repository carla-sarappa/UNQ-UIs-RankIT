package ar.edu.unq.uis.rankit.model.repository;

import ar.edu.unq.uis.rankit.model.Entity;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.function.Predicate;
import java.util.stream.Collectors;

/**
 * Created by Sarappa Carla on 23/10/16 00:48.
 */
public class BaseRepository<T extends Entity> {
    private int lastId = 0;

    List<T> elements = new ArrayList<>();

    public void save(T element){
        elements.add(element);
        element.setId(++lastId);
    }

    public Optional<T> findOneBy(Predicate<T> condicion){
        return elements.stream().filter(condicion).findFirst();
    }

    public void delete(T element){
        elements.remove(element);
    }

    public List<T> findAll(){
        return elements;
    }

    public List<T> findBy(Predicate<T> condicion){
        return elements.stream().filter(condicion).collect(Collectors.toList());
    }

}