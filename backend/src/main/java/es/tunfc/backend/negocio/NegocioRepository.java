package es.tunfc.backend.negocio;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

/**
 * Lee y guarda negocios en la base de datos.
 * Spring crea la implementación solo a partir de los nombres de los métodos.
 */
public interface NegocioRepository extends JpaRepository<Negocio, Long> {

    Optional<Negocio> findBySlug(String slug);
}
