<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <html lang="es">
        <head>
            <meta charset="UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <title>Catálogo - <xsl:value-of select="perifericos_puntero/inventario/@categoria"/></title>
            <link rel="stylesheet" href="/css/style.css"/>
        </head>
        <body>
             <header class="cabecera">
                <div class="logo">
                    <img src="../img/logo.png" alt="Logo de la tienda"/>
                </div>
                <nav class="menu">
                    <ul>
                        <li><a href="/index.html">Inicio</a></li>
                        <li class="item-menu">
                            <a href="#">Componentes</a>
                            <ul class="submenu">
                                <li><a href="/pages/placa_base.html">Placa Base</a></li>
                                <li><a href="/pages/Procesador.html">Procesador</a></li>
                                <li><a href="/pages/grafica.html">Tarjeta Gráfica</a></li>
                                <li><a href="/pages/Memorias_Ram.html">Memoria RAM</a></li>
                                <li><a href="/pages/Fuentes_alimentacion.html">Fuente de Alimentación</a></li>
                                <li><a href="/pages/Perifericos.html">Periféricos</a></li>
                            </ul>
                        </li>
                        <li><a href="/pages/Contacto.html">Contactos</a></li>
                        <li><a href="/pages/Informacion.html">Información</a></li>
                    </ul>
                </nav>
            </header>
            <header>
                <h1><xsl:value-of select="perifericos_puntero/@tienda"/> - <xsl:value-of select="perifericos_puntero/inventario/@categoria"/></h1>
                
                <xsl:variable name="totalRatones" select="count(//raton)"/>
                <xsl:variable name="precioTotal" select="sum(//precio)"/>
                <xsl:variable name="precioMedio" select="$precioTotal div $totalRatones"/>
                
                <div class="resumen-estadistico">
                    <p>Total de modelos en catálogo: <strong><xsl:value-of select="$totalRatones"/></strong></p>
                    <p>Precio medio del catálogo: <strong><xsl:value-of select="format-number($precioMedio, '#.00')"/> €</strong></p>
                </div>
            </header>

            <main>
                <xsl:apply-templates select="perifericos_puntero/inventario/fabricante"/>
            </main>

            <footer>
                <p>Catálogo de ratones actualizado el: <xsl:value-of select="perifericos_puntero/inventario/@fechaActualizacion"/></p>
            </footer>
        </body>
        </html>
    </xsl:template>

    <xsl:template match="fabricante">
        <section class="fabricante-section">
            <h2>Ratones <xsl:value-of select="@nombre"/></h2>
            
            <div class="grid-productos">
                <xsl:for-each select="raton">
                    
                    <xsl:sort select="especificaciones/dpi_max" data-type="number" order="descending"/>
                    <xsl:sort select="especificaciones/peso" data-type="number" order="ascending"/>

                    <article>
                        <xsl:attribute name="class">
                            <xsl:text>tarjeta-raton </xsl:text>
                            <xsl:if test="especificaciones/peso &lt;= 70">raton-ultraligero </xsl:if>
                            <xsl:if test="@disponible = 'false'">agotado</xsl:if>
                        </xsl:attribute>

                        <header>
                            <h3><xsl:value-of select="modelo"/></h3>
                            <p class="conexion">Conexión: <xsl:value-of select="@conexion"/></p>
                        </header>

                        <div class="especificaciones">
                            <ul>
                                <li>
                                    <strong>Resolución máxima:</strong> 
                                    <xsl:value-of select="especificaciones/dpi_max"/> <xsl:value-of select="especificaciones/dpi_max/@unidad"/>
                                </li>
                                <li>
                                    <strong>Peso:</strong> 
                                    <xsl:value-of select="especificaciones/peso"/> <xsl:value-of select="especificaciones/peso/@unidad"/>
                                </li>
                                <li>
                                    <strong>Categoría de peso:</strong>
                                    <xsl:choose>
                                        <xsl:when test="especificaciones/peso &lt;= 70">Ultraligero</xsl:when>
                                        <xsl:when test="especificaciones/peso &gt; 100">Pesado / Ergonómico</xsl:when>
                                        <xsl:otherwise>Estándar</xsl:otherwise>
                                    </xsl:choose>
                                </li>
                            </ul>
                        </div>

                        <div class="precio-stock">
                            <p class="precio"><xsl:value-of select="precio"/> <xsl:value-of select="precio/@moneda"/></p>
                            
                            <xsl:if test="@disponible = 'true'">
                                <p class="stock-ok">Disponible para envío</p>
                            </xsl:if>
                            <xsl:if test="@disponible = 'false'">
                                <p class="alerta-stock">Fuera de stock temporalmente</p>
                            </xsl:if>
                        </div>
                    </article>
                </xsl:for-each>
            </div>
        </section>
    </xsl:template>

</xsl:stylesheet>