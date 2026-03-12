<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html lang="es">
            <head>
                <meta charset="UTF-8" />
                <title>Catálogo de Gráficas - <xsl:value-of select="tienda/@nombre" /></title>
                <link rel="stylesheet" href="../css/menu.css" />
                <link rel="stylesheet" href="../css/tablas.css" />
            </head>
            <body>
                <header>
                    <h1><xsl:value-of select="tienda/@nombre" /> - Inventario</h1>
                    <p>Total de tarjetas en catálogo: <xsl:value-of select="count(//tarjeta)" /></p>
                </header>

                <main>
                    <section>
                        <h2>Listado de Tarjetas Gráficas</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>Modelo</th>
                                    <th>Fabricante</th>
                                    <th>VRAM</th>
                                    <th>Precio</th>
                                    <th>Disponibilidad</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="//tarjeta">
                                    <xsl:sort select="precio" data-type="number" order="descending" />
                                
                                <tr>
                                        <td>
                                            <strong>
                                                <xsl:value-of select="modelo" />
                                            </strong>
                                        </td>
                                        <td>
                                            <xsl:value-of select="../@nombre" />
                                        </td>
                                        <td><xsl:value-of select="especificaciones/vram" /> GB</td>
                                        <td><xsl:value-of select="precio" /> €</td>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="@disponible = 'true'">
                                                    <span style="color: green; font-weight: bold;">
        Disponible</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <span style="color: red;">Sin Stock</span>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </section>
                </main>

                <footer>
                    <p>Ubicación: <xsl:value-of select="tienda/@ubicacion" /> | Actualizado el: <xsl:value-of
                            select="//inventario/@fechaActualizacion" /></p>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>