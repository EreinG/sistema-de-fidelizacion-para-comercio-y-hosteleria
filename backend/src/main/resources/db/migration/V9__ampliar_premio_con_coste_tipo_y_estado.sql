-- Premios con coste propio (decisión 4 y modelo-datos.md, sección 5).
-- coste_visitas: visitas que cuesta el premio (mayor que 0).
-- descripcion: texto opcional, máximo 500 caracteres.
-- tipo: NORMAL (un premio fijo) o ELEGIR (el cliente elige entre opciones del propio negocio).
-- estado: ACTIVO, INACTIVO o ARCHIVADO. Un premio con historial nunca se borra, se archiva.
-- Esta migración da por hecho que la tabla premio está vacía (coste_visitas no tiene valor por defecto).
ALTER TABLE premio
    ADD COLUMN coste_visitas  INT          NOT NULL,
    ADD COLUMN descripcion    VARCHAR(500) NULL,
    ADD COLUMN tipo           VARCHAR(20)  NOT NULL DEFAULT 'NORMAL',
    ADD COLUMN estado         VARCHAR(20)  NOT NULL DEFAULT 'ACTIVO',
    ADD CONSTRAINT ck_premio_coste CHECK (coste_visitas > 0),
    ADD CONSTRAINT ck_premio_tipo CHECK (tipo IN ('NORMAL', 'ELEGIR')),
    ADD CONSTRAINT ck_premio_estado CHECK (estado IN ('ACTIVO', 'INACTIVO', 'ARCHIVADO'));

-- La columna activo se sustituye por estado: se copia su valor y se elimina.
UPDATE premio SET estado = IF(activo = 1, 'ACTIVO', 'INACTIVO');

ALTER TABLE premio DROP COLUMN activo;
