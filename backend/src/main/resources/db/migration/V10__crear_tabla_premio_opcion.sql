-- Opciones de un premio de tipo ELEGIR (decisión 4 y modelo-datos.md, sección 5).
-- Cada opción cuelga de un premio, así que pertenece siempre al negocio de ese premio.
-- activa = 0 deja de ofrecer la opción sin borrarla (puede tener historial en canjes).
CREATE TABLE premio_opcion (
    id         BIGINT       NOT NULL AUTO_INCREMENT,
    premio_id  BIGINT       NOT NULL,
    nombre     VARCHAR(150) NOT NULL,
    activa     TINYINT(1)   NOT NULL DEFAULT 1,
    PRIMARY KEY (id),
    CONSTRAINT fk_premio_opcion_premio FOREIGN KEY (premio_id) REFERENCES premio (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
