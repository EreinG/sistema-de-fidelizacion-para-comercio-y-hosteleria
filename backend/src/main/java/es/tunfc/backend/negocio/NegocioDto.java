package es.tunfc.backend.negocio;

/**
 * Los datos de un negocio que se envían al navegador.
 * No incluye visitasNecesarias (obsoleta) ni datos internos.
 */
public record NegocioDto(Long id, String slug, String nombre) {

    public static NegocioDto desde(Negocio negocio) {
        return new NegocioDto(negocio.getId(), negocio.getSlug(), negocio.getNombre());
    }
}
