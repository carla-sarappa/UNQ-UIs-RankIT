package ar.edu.unq.uis.rankit.controller

import com.fasterxml.jackson.databind.exc.UnrecognizedPropertyException;
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Delete
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Put
import ar.edu.unq.uis.rankit.model.repository.BaseRepository
import ar.edu.unq.uis.rankit.model.Usuario
import ar.edu.unq.uis.rankit.model.Evaluado
import ar.edu.unq.uis.rankit.model.Calificacion
import ar.edu.unq.uis.rankit.model.repository.Repositories

/**
 * Created by Sarappa Carla on 22/10/16 21:13.
 */

@Controller
class RankITController {
    extension JSONUtils = new JSONUtils
    Repositories repositories;

    new(Repositories repositories){
        this.repositories = repositories
    }


    def safeRun(Runnable lambda){
        var result = ok()
        try{
            lambda.run
        }catch(RuntimeException e){
            result = badRequest('''{ "error": "«e.message»" }''')
        }
        return result
    }

    @Put("/usuarios")
    def crearNuevoUsuario(@Body String body) {
        response.contentType = ContentType.APPLICATION_JSON

        return safeRun[repositories.users.save(body.fromJson(Usuario))]
    }

    @Post("/usuarios")
    def login(String nombre, String password) {
        response.contentType = ContentType.APPLICATION_JSON

        ok()
    }

    @Get("/usuarios")
    def verListaUsuarios(){
        response.contentType = ContentType.APPLICATION_JSON
        ok(repositories.users.findAll().toJson)
    }


    @Get("/evaluados")
    def getEvaluadosById() {
        response.contentType = ContentType.APPLICATION_JSON
        ok()
    }

    @Get("/ranking")
    def getRanking(){
        response.contentType = ContentType.APPLICATION_JSON
        ok()

    }


    @Post("/calificaciones")
    def createCalificacion(@Body String body) {
        response.contentType = ContentType.APPLICATION_JSON
        ok()

    }


    @Put("/calificaciones")
    def setCalificacion(String lugar, String calificacion){
        response.contentType = ContentType.APPLICATION_JSON
        ok()

    }

    @Delete("/calificaciones")
    def deleteCalificacionById() {
        response.contentType = ContentType.APPLICATION_JSON
        ok()

    }

    @Get("/calificaciones")
    def getCalificacion(){
        response.contentType = ContentType.APPLICATION_JSON
        ok()

    }

}