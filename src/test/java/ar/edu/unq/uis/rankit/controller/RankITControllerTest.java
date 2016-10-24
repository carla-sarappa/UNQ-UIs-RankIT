package ar.edu.unq.uis.rankit.controller;

import ar.edu.unq.uis.rankit.model.repository.Repositories;
import org.eclipse.jetty.http.HttpTester;
import org.eclipse.jetty.server.Response;
import org.junit.Before;
import org.junit.Test;
import org.junit.Assert;
import org.uqbar.xtrest.api.Result;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

/**
 * Created by Sarappa Carla on 23/10/16 19:19.
 */
public class RankITControllerTest {
    Repositories repositories;
    RankITController controller;

    @Before
    public void setUp(){
        repositories = new Repositories();
        controller = new RankITController(repositories);
    }

//    @Test
//    public void cuandoCreoUnNuevoUsuario_loCreaCorrectamente(){
//        HttpServletResponse responseMock = new HttpServletResponseMock();
//        Result result = controller.crearNuevoUsuario("Carla", "123", null, null, null, responseMock);
//        result.process(responseMock);
//
//        Assert.assertEquals(200, responseMock.getStatus());
//
//    }

    @Test
    public void cuandoQuieroCrearUnUsuarioRepetido_tiraExcepcion(){

    }
}
