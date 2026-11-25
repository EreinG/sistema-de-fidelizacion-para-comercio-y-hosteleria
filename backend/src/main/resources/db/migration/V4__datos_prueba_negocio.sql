-- DATOS DE PRUEBA: borrar o separar antes de producción.
-- Crea un negocio de ejemplo para probar GET /api/negocios/{slug}.
-- No lo inserta si ya existe uno con ese slug.
INSERT INTO negocio (slug, nombre)
SELECT 'bar-prueba', 'Bar de Prueba'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM negocio WHERE slug = 'bar-prueba');
