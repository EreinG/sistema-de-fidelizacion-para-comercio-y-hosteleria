-- Ajustes del negocio (decisiones 3 y D del plan).
-- estado: ACTIVO o INACTIVO. El modo lectura por impago NO se guarda aquí: se calcula desde la suscripción.
-- intervalo_minimo_minutos: tiempo mínimo entre dos visitas del mismo cliente (30 por defecto, configurable por negocio).
-- max_visitas_dia: tope diario de visitas por cliente. NULL = sin tope (valor por defecto, lo activa el propietario).
ALTER TABLE negocio
    ADD COLUMN estado                    VARCHAR(20) NOT NULL DEFAULT 'ACTIVO',
    ADD COLUMN intervalo_minimo_minutos  INT         NOT NULL DEFAULT 30,
    ADD COLUMN max_visitas_dia           INT         NULL,
    ADD CONSTRAINT ck_negocio_estado CHECK (estado IN ('ACTIVO', 'INACTIVO')),
    ADD CONSTRAINT ck_negocio_intervalo CHECK (intervalo_minimo_minutos > 0),
    ADD CONSTRAINT ck_negocio_max_visitas_dia CHECK (max_visitas_dia IS NULL OR max_visitas_dia > 0);
