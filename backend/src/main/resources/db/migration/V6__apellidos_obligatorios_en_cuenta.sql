-- Los apellidos pasan a ser obligatorios, igual que el nombre.
-- La tabla cuenta todavía no tiene filas, así que el cambio es seguro.
ALTER TABLE cuenta MODIFY COLUMN apellidos VARCHAR(150) NOT NULL;
