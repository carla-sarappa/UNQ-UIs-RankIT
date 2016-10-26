package ar.edu.unq.uis.rankit.controller

import ar.edu.unq.uis.rankit.model.Usuario
import ar.edu.unq.uis.rankit.model.repository.Repositories
import java.util.HashMap
import javax.servlet.http.Cookie
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Delete
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils

/**
 * Created by Sarappa Carla on 22/10/16 21:13.
 */

@Controller
class RankITController {
    extension JSONUtils = new JSONUtils
    Repositories repositories
    HashMap<String, Usuario> usuariosLogueados

    new(Repositories repositories){
        this.repositories = repositories
        this.usuariosLogueados = newHashMap()
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
    def login(@Body String body) {
        response.contentType = ContentType.APPLICATION_JSON

        var usuario = body.fromJson(Usuario)
        val dbUsuario = repositories.users.findUserByName(usuario.getNombre)

        if(!dbUsuario.isPresent){
            notFound('''{ "error": "No existe el usuario" }''')
        } else if (dbUsuario.get.getPassword == usuario.getPassword){
            val cookie = dbUsuario.get.hashCode.toString
            usuariosLogueados.put(cookie, dbUsuario.get)
            response.addCookie(new Cookie("session", cookie))
            ok( #{'id' -> dbUsuario.get.getId}.toJson)
        } else {
            body('''{ "error": "Contraseña incorrecta" }''')
            response.setStatus(401)
        }

        // TODO refactor

    }

    @Get("/usuarios")
    def verListaUsuarios(){
        response.contentType = ContentType.APPLICATION_JSON
        ok(repositories.users.findAll().toJson)
    }


    @Get("/evaluados")
    def verListaEvaluados() {
        // buscar por nombre, tipo,
        // cantidad de calificaciones >=, ranking >=
        response.contentType = ContentType.APPLICATION_JSON
        ok(repositories.evaluados.findAll().toJson)
    }

    @Get("/ranking")
    def getRanking(){
        response.contentType = ContentType.APPLICATION_JSON
        ok(repositories.ranking.findAll().toJson)

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