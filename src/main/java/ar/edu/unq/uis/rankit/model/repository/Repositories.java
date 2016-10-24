package ar.edu.unq.uis.rankit.model.repository;

/**
 * Created by Sarappa Carla on 23/10/16 17:02.
 */
public class Repositories {
    public UserRepository users;

    public Repositories() {
        this.users = new UserRepository();
    }

}
