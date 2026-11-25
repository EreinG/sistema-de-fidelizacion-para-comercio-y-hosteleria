-- Miembro de negocio: quién trabaja en un negocio y con qué rol (decisión 5).
-- Es lo que da acceso al panel de ese negocio. No es la relación de cliente (eso es membresia).
-- rol: DUENO (gestión completa) o EMPLEADO (solo canjes pendientes y consulta mínima).
-- activo = 0 retira el acceso sin borrar la fila (queda el historial).
-- UNIQUE (cuenta_id, negocio_id): una persona tiene un solo rol por negocio,
-- pero puede tener roles distintos en negocios distintos.
CREATE TABLE miembro_negocio (
    id          BIGINT      NOT NULL AUTO_INCREMENT,
    cuenta_id   BIGINT      NOT NULL,
    negocio_id  BIGINT      NOT NULL,
    rol         VARCHAR(20) NOT NULL,
    activo      TINYINT(1)  NOT NULL DEFAULT 1,
    creado_en   DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (id),
    CONSTRAINT uk_miembro_negocio_cuenta_negocio UNIQUE (cuenta_id, negocio_id),
    CONSTRAINT fk_miembro_negocio_cuenta FOREIGN KEY (cuenta_id) REFERENCES cuenta (id),
    CONSTRAINT fk_miembro_negocio_negocio FOREIGN KEY (negocio_id) REFERENCES negocio (id),
    CONSTRAINT ck_miembro_negocio_rol CHECK (rol IN ('DUENO', 'EMPLEADO'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
