package ar.edu.unq.uis.rankit.controller

import com.fasterxml.jackson.databind.exc.UnrecognizedPropertyException
import ar.edu.unq.uis.rankit.model.Biblioteca
import ar.edu.unq.uis.rankit.model.Libro
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Delete
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils

@Controller
class BibliotecaController {
    extension JSONUtils = new JSONUtils
	Biblioteca biblioteca
	
	new(Biblioteca biblioteca) {
		this.biblioteca = biblioteca
	}
	
    @Get("/libros")
    def getLibros(String string) {
        response.contentType = ContentType.APPLICATION_JSON
       	ok(this.biblioteca.searchLibros(string).toJson)
    }

    @Get("/libros/:id")
    def getLibroById() {
        response.contentType = ContentType.APPLICATION_JSON
        try {
            var libro = this.biblioteca.getLibro(Integer.valueOf(id))
            if (libro == null) {
            	notFound('{ "error": "No existe libro con ese id" }')
            } else {
            	ok(libro.toJson)
            }
        }
        catch (NumberFormatException ex) {
        	badRequest('{ "error": "El id debe ser un numero entero" }')
        }
    }

    @Delete('/libros/:id')
    def deleteLibroById() {
        response.contentType = ContentType.APPLICATION_JSON
        try {
            this.biblioteca.eliminarLibro(Integer.valueOf(id))
            ok()
        }
        catch (NumberFormatException ex) {
        	badRequest('{ "error": "El id debe ser un numero entero" }')
        }
    }

    @Post("/libros")
    def createLibro(@Body String body) {
        response.contentType = ContentType.APPLICATION_JSON
        try {
	        var Libro libro = body.fromJson(Libro)
	        this.biblioteca.setLibro(libro)
	    	ok()
        } catch (UnrecognizedPropertyException exception) {
        	badRequest('{ "error": "El body debe ser un Libro" }')        	
        }
        
    }

}