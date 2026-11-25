package es.tunfc.backend.negocio;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Recibe las peticiones web sobre negocios.
 * GET /api/negocios/{slug} devuelve un negocio, o 404 si no existe.
 */
@RestController
@RequestMapping("/api/negocios")
public class NegocioController {

    private final NegocioService negocioService;

    public NegocioController(NegocioService negocioService) {
        this.negocioService = negocioService;
    }

    @GetMapping("/{slug}")
    public NegocioDto obtenerPorSlug(@PathVariable String slug) {
        return negocioService.buscarPorSlug(slug);
    }
}
