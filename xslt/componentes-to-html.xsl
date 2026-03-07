<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <html lang="es">
            <head>
                <meta charset="UTF-8" />
                <title>Catálogo de Componentes JB</title>
                <link rel="stylesheet" href="../css/tablas.css" />
            </head>
            <body>
                <header>
                    <h1>Panel de Control de Stock: Gráficas</h1>
                    <p>Modelos registrados actualmente: <xsl:value-of select="count(//grafica)" /></p>
                </header>

                <main>
                    <section class="contenedor-lista">
                        <xsl:apply-templates select="//grafica">
                            <xsl:sort select="precio" data-type="number" order="ascending" />
                        </xsl:apply-templates>
                    </section>
                </main>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="grafica">
        <article>
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="precio > 1000">tarjeta-producto premium</xsl:when>
                    <xsl:otherwise>tarjeta-producto</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>

            <h3>
                <xsl:value-of select="modelo" />
            </h3>

            <p>Marca: <strong>
                    <xsl:value-of select="marca" />
                </strong></p>

            <xsl:if test="stock > 0">
                <p class="stock-info">Unidades: <xsl:value-of select="stock" /></p>
            </xsl:if>

            <p class="precio-tag">Precio: <xsl:value-of select="precio" />€</p>
        </article>
    </xsl:template>

</xsl:stylesheet>