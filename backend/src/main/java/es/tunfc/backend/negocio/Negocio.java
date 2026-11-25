package es.tunfc.backend.negocio;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.time.LocalDateTime;

/**
 * Representa una fila de la tabla `negocio`.
 * No se mapea `visitas_necesarias` porque está obsoleta (decisión 9).
 */
@Entity
@Table(name = "negocio")
public class Negocio {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "slug", nullable = false, length = 80)
    private String slug;

    @Column(name = "nombre", nullable = false, length = 150)
    private String nombre;

    // Lo rellena MySQL solo (DEFAULT CURRENT_TIMESTAMP), por eso no se inserta ni se actualiza desde Java.
    @Column(name = "creado_en", insertable = false, updatable = false)
    private LocalDateTime creadoEn;

    // JPA necesita un constructor vacío.
    protected Negocio() {
    }

    public Long getId() {
        return id;
    }

    public String getSlug() {
        return slug;
    }

    public String getNombre() {
        return nombre;
    }

    public LocalDateTime getCreadoEn() {
        return creadoEn;
    }
}
