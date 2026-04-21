<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.01//EN"/>

  <xsl:template match="/">
    <html lang="es">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Catálogo de Películas</title>
        <style>
          @import url('https://fonts.googleapis.com/css2?family=Syne:wght@400;700;800&amp;family=DM+Mono:wght@400;500&amp;display=swap');

          *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

          :root {
            --bg: #0a0a0a;
            --surface: #111;
            --border: #1e1e1e;
            --accent: #00e5a0;
            --text: #f0f0f0;
            --muted: #666;
          }

          body {
            background: var(--bg);
            color: var(--text);
            font-family: 'Syne', sans-serif;
            min-height: 100vh;
          }

          header {
            border-bottom: 1px solid var(--border);
            padding: 2.5rem 3rem;
            display: flex;
            align-items: flex-end;
            gap: 1.5rem;
          }

          header h1 {
            font-size: clamp(2rem, 5vw, 3.5rem);
            font-weight: 800;
            letter-spacing: -0.03em;
            line-height: 1;
          }

          header h1 span { color: var(--accent); }

          .header-meta {
            font-family: 'DM Mono', monospace;
            font-size: 0.75rem;
            color: var(--muted);
            letter-spacing: 0.1em;
            padding-bottom: 0.3rem;
          }

          .grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 1px;
            background: var(--border);
            border: 1px solid var(--border);
            margin: 2rem 3rem;
          }

          .card {
            background: var(--surface);
            padding: 2rem;
            display: flex;
            flex-direction: column;
            gap: 0.75rem;
            transition: background 0.2s;
          }

          .card:hover { background: #161616; }

          .card-id {
            font-family: 'DM Mono', monospace;
            font-size: 0.68rem;
            color: var(--accent);
            letter-spacing: 0.15em;
          }

          .card-title {
            font-size: 1.15rem;
            font-weight: 800;
            line-height: 1.2;
            letter-spacing: -0.01em;
          }

          .card-director {
            font-family: 'DM Mono', monospace;
            font-size: 0.78rem;
            color: var(--muted);
          }

          .card-sinopsis {
            font-family: 'DM Mono', monospace;
            font-size: 0.78rem;
            color: #888;
            line-height: 1.6;
            flex: 1;
          }

          .card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 0.75rem;
            border-top: 1px solid var(--border);
          }

          .card-tags {
            display: flex;
            gap: 0.4rem;
            flex-wrap: wrap;
          }

          .tag {
            font-family: 'DM Mono', monospace;
            font-size: 0.68rem;
            padding: 0.25rem 0.6rem;
            border: 1px solid var(--border);
            color: var(--muted);
            border-radius: 2px;
          }

          .puntuacion {
            font-family: 'DM Mono', monospace;
            font-size: 0.9rem;
            font-weight: 500;
            color: var(--accent);
          }

          .puntuacion::before { content: "★ "; }

          footer {
            border-top: 1px solid var(--border);
            padding: 1.5rem 3rem;
            font-family: 'DM Mono', monospace;
            font-size: 0.7rem;
            color: var(--muted);
          }

          @media (max-width: 768px) {
            header { padding: 1.5rem; flex-direction: column; align-items: flex-start; gap: 0.5rem; }
            .grid { margin: 1rem; }
            footer { padding: 1.5rem; }
          }
        </style>
      </head>
      <body>
        <header>
          <h1>Catálogo de <span>Películas</span></h1>
          <span class="header-meta">
            <xsl:value-of select="count(catalogo/pelicula)"/> películas · XML + XSLT
          </span>
        </header>

        <div class="grid">
          <xsl:apply-templates select="catalogo/pelicula"/>
        </div>

        <footer>
          Proyecto DAW · XML + XSD + XSLT · Miguel López León
        </footer>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="pelicula">
    <div class="card">
      <span class="card-id"><xsl:value-of select="@id"/></span>
      <div class="card-title"><xsl:value-of select="titulo"/></div>
      <div class="card-director">dir. <xsl:value-of select="director"/> · <xsl:value-of select="anio"/></div>
      <div class="card-sinopsis"><xsl:value-of select="sinopsis"/></div>
      <div class="card-footer">
        <div class="card-tags">
          <span class="tag"><xsl:value-of select="genero"/></span>
          <span class="tag"><xsl:value-of select="duracion"/> min</span>
        </div>
        <span class="puntuacion"><xsl:value-of select="puntuacion"/></span>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>
