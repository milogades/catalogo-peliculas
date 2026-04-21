# 🎬 Catálogo de Películas · XML + XSD + XSLT

Proyecto del módulo de **Lenguajes de Marcas** del ciclo DAW en UNIVERSAE.

## Archivos

| Archivo | Descripción |
|---|---|
| `peliculas.xml` | Catálogo con 8 películas estructurado en XML |
| `peliculas.xsd` | Esquema de validación con tipos personalizados |
| `peliculas.xsl` | Transformación XSLT que genera una web HTML |

## Tecnologías

- **XML** — Estructura de datos
- **XSD** — Validación del esquema (tipos, patrones, enumeraciones)
- **XSLT** — Transformación a HTML

## Cómo abrirlo

Abre `peliculas.xml` en el navegador. El propio XML referencia la hoja de estilos XSLT y la transforma automáticamente en una web.

> Nota: algunos navegadores bloquean XSLT por seguridad. Funciona correctamente en Firefox o abriendo con un servidor local.
