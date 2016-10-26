package ar.edu.unq.uis.rankit.app

import ar.edu.unq.uis.rankit.model.repository.UserRepository
import ar.edu.unq.uis.rankit.model.Usuario
import ar.edu.unq.uis.rankit.model.Evaluado
import org.uqbar.xtrest.api.XTRest
import ar.edu.unq.uis.rankit.controller.RankITController
import ar.edu.unq.uis.rankit.model.repository.BaseRepository
import ar.edu.unq.uis.rankit.model.repository.Repositories

/**
 * Created by Sarappa Carla on 23/10/16 21:05.
 */
class RankITApp {

    def static void main(String[] args) {
        var repositories = new Repositories

        repositories.users.save(new Usuario("Carla", "123"))
        repositories.evaluados.save(new Evaluado("Heladeria"))

        XTRest.startInstance(new RankITController(repositories), 9000)
    }



}

