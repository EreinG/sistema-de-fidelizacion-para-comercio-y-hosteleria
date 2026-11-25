-- Cuenta global: una por persona (decisión 1).
-- password_hash es NULL si la persona solo entra con Google.
-- google_sub es NULL si no usa Google (MySQL permite varios NULL en una columna UNIQUE).
-- El email no distingue mayúsculas por el tipo de ordenación de la tabla.
CREATE TABLE cuenta (
    id                BIGINT       NOT NULL AUTO_INCREMENT,
    email             VARCHAR(254) NOT NULL,
    email_verificado  TINYINT(1)   NOT NULL DEFAULT 0,
    password_hash     VARCHAR(255) NULL,
    google_sub        VARCHAR(255) NULL,
    nombre            VARCHAR(100) NOT NULL,
    apellidos         VARCHAR(150) NULL,
    rol_global        VARCHAR(20)  NOT NULL DEFAULT 'USUARIO',
    activa            TINYINT(1)   NOT NULL DEFAULT 1,
    creada_en         DATETIME(6)  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (id),
    CONSTRAINT uk_cuenta_email UNIQUE (email),
    CONSTRAINT uk_cuenta_google_sub UNIQUE (google_sub),
    CONSTRAINT ck_cuenta_rol_global CHECK (rol_global IN ('USUARIO', 'ADMIN'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membresía: la relación de una cuenta con un negocio (consumidor-negocio).
-- De ella colgarán visitas, saldo y canjes. Una sola por cuenta y negocio.
CREATE TABLE membresia (
    id          BIGINT      NOT NULL AUTO_INCREMENT,
    cuenta_id   BIGINT      NOT NULL,
    negocio_id  BIGINT      NOT NULL,
    creada_en   DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (id),
    CONSTRAINT uk_membresia_cuenta_negocio UNIQUE (cuenta_id, negocio_id),
    CONSTRAINT fk_membresia_cuenta FOREIGN KEY (cuenta_id) REFERENCES cuenta (id),
    CONSTRAINT fk_membresia_negocio FOREIGN KEY (negocio_id) REFERENCES negocio (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
