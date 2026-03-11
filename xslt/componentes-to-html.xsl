<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html lang="es">
            <head>
                <meta charset="UTF-8" />
                <title>Catálogo de Componentes - Proyecto JB</title>
                <link rel="stylesheet" href="../css/menu.css" />
                <link rel="stylesheet" href="../css/tablas.css" />
                <link rel="stylesheet" href="../css/formulario.css" />
            </head>
            <body>
                <header>
                    <h1>Panel de Componentes</h1>
                </header>

                <main>
                    <section>
                        <h2>Listado de Productos</h2>
                        <div class="contenedor-productos">
                            <xsl:apply-templates select="//producto" />
                        </div>
                    </section>
                </main>

                <footer>
                    <p>DAM1 - Proyecto Web JB 2026</p>
                </footer>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="producto">
        <article class="tarjeta-producto">
            <h3>
                <xsl:value-of select="nombre" />
            </h3>
            <p>Marca: <xsl:value-of select="marca" /></p>
        </article>
    </xsl:template>

</xsl:stylesheet>