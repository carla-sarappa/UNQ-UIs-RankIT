package ar.edu.unq.uis.rankit.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * Created by Sarappa Carla on 23/10/16 17:26.
 */
public class Entity {

    @JsonIgnore
    private int id;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
