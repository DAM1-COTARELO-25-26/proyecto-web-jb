<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <html lang="es">
        <head>
            <meta charset="UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <title>Catálogo - <xsl:value-of select="perifericos_entrada/inventario/@categoria"/></title>
            <link rel="stylesheet" href="css/style.css"/>
        </head>
        <body>
            <header>
                <h1><xsl:value-of select="perifericos_entrada/@tienda"/> - <xsl:value-of select="perifericos_entrada/inventario/@categoria"/></h1>
                
                <xsl:variable name="totalTeclados" select="count(//teclado)"/>
                <xsl:variable name="stockTotal" select="sum(//estado)"/>
                
                <div class="resumen-estadistico">
                    <p>Total de modelos en catálogo: <strong><xsl:value-of select="$totalTeclados"/></strong></p>
                    <p>Unidades en stock (todas las marcas): <strong><xsl:value-of select="$stockTotal"/></strong></p>
                </div>
            </header>

            <main>
                <xsl:apply-templates select="perifericos_entrada/inventario/fabricante"/>
            </main>

            <footer>
                <p>Catálogo actualizado el: <xsl:value-of select="perifericos_entrada/inventario/@fechaActualizacion"/></p>
            </footer>
        </body>
        </html>
    </xsl:template>

    <xsl:template match="fabricante">
        <section class="fabricante-section">
            <h2>Teclados <xsl:value-of select="@nombre"/></h2>
            
            <div class="grid-productos">
                <xsl:for-each select="teclado">
                    
                    <xsl:sort select="especificaciones/formato" order="descending"/>
                    <xsl:sort select="precio" data-type="number" order="descending"/>

                    <article>
                        <xsl:attribute name="class">
                            <xsl:text>tarjeta-teclado </xsl:text>
                            <xsl:if test="@conexion = 'Wireless'">teclado-inalambrico </xsl:if>
                            <xsl:if test="estado/@disponible = 'false'">agotado</xsl:if>
                        </xsl:attribute>

                        <header>
                            <h3><xsl:value-of select="modelo"/></h3>
                            <p class="conexion">Conexión: <xsl:value-of select="@conexion"/></p>
                        </header>

                        <div class="especificaciones">
                            <ul>
                                <li><strong>Tipo de Switch:</strong> <xsl:value-of select="especificaciones/switch"/></li>
                                <li><strong>Formato:</strong> <xsl:value-of select="especificaciones/formato"/></li>
                                <li>
                                    <strong>Iluminación:</strong>
                                    <xsl:choose>
                                        <xsl:when test="@rgb = 'true'">Retroiluminación RGB</xsl:when>
                                        <xsl:otherwise>Sin retroiluminación</xsl:otherwise>
                                    </xsl:choose>
                                </li>
                            </ul>
                        </div>

                        <div class="precio-stock">
                            <p class="precio"><xsl:value-of select="precio"/> <xsl:value-of select="precio/@moneda"/></p>
                            
                            <xsl:choose>
                                <xsl:when test="estado/@disponible = 'true'">
                                    <p class="stock-ok">En stock: <xsl:value-of select="estado"/> unidades disponibles</p>
                                </xsl:when>
                                <xsl:otherwise>
                                    <p class="alerta-stock">Fuera de stock temporalmente</p>
                                </xsl:otherwise>
                            </xsl:choose>

                            <xsl:if test="precio &gt; 150">
                                <p class="aviso-premium">Categoría Premium - Envío protegido</p>
                            </xsl:if>
                        </div>
                    </article>
                </xsl:for-each>
            </div>
        </section>
    </xsl:template>

</xsl:stylesheet>