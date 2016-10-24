package ar.edu.unq.uis.rankit.app

import ar.edu.unq.uis.rankit.controller.BibliotecaController
import org.uqbar.xtrest.api.XTRest
import ar.edu.unq.uis.rankit.model.Libro
import ar.edu.unq.uis.rankit.model.Biblioteca

class BibliotecaApp {
	
	def static void main(String[] args) {
		var biblioteca = new Biblioteca
		biblioteca.setLibro(new Libro(5, "Ficciones"))
		biblioteca.setLibro(new Libro(7, "El Aleph"))
		biblioteca.setLibro(new Libro(11, "Historia universal de la infamia"))
		biblioteca.setLibro(new Libro(13, "El informe de Brodie"))
		biblioteca.setLibro(new Libro(17, "El libro de arena"))

        XTRest.startInstance(new BibliotecaController(biblioteca), 9000)
    }
	
}