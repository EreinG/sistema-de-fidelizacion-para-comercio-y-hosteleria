-- 1. Quitar la clave foránea (se vuelve a crear al final con el nombre nuevo)
ALTER TABLE premio DROP FOREIGN KEY fk_premio_restaurante;

-- 2. Renombrar la tabla y lo que lleva dentro
RENAME TABLE restaurante TO negocio;
ALTER TABLE negocio RENAME INDEX uk_restaurante_slug TO uk_negocio_slug;
ALTER TABLE negocio DROP CHECK ck_restaurante_visitas;
ALTER TABLE negocio ADD CONSTRAINT ck_negocio_visitas CHECK (visitas_necesarias > 0);

-- 3. Renombrar la columna de premio y su índice
ALTER TABLE premio RENAME COLUMN restaurante_id TO negocio_id;
ALTER TABLE premio RENAME INDEX fk_premio_restaurante TO fk_premio_negocio;

-- 4. Volver a crear la clave foránea apuntando a negocio
ALTER TABLE premio ADD CONSTRAINT fk_premio_negocio FOREIGN KEY (negocio_id) REFERENCES negocio (id);