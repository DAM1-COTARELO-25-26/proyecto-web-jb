<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html"  encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <html lang="es">
        <head>
            <meta charset="UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <title>Catálogo - <xsl:value-of select="tienda/inventario/@categoria"/></title>
            <link rel="stylesheet" href="css/style.css"/>
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
                <h1><xsl:value-of select="tienda/@nombre"/> - <xsl:value-of select="tienda/inventario/@categoria"/></h1>
                <p>Ubicación: <xsl:value-of select="tienda/@ubicacion"/></p>
                
                <xsl:variable name="totalGraficas" select="count(//tarjeta)"/>
                <xsl:variable name="precioTotal" select="sum(//precio)"/>
                <xsl:variable name="precioPromedio" select="$precioTotal div $totalGraficas"/>
                
                <div class="resumen-estadistico">
                    <p>Total de tarjetas gráficas en catálogo: <strong><xsl:value-of select="$totalGraficas"/></strong></p>
                    <p>Precio promedio de GPU: <strong><xsl:value-of select="format-number($precioPromedio, '#.00')"/> €</strong></p>
                </div>
            </header>

            <main>
                <xsl:apply-templates select="tienda/inventario/fabricante"/>
            </main>

            <footer>
                <p>Catálogo de gráficas actualizado el: <xsl:value-of select="tienda/inventario/@fechaActualizacion"/></p>
            </footer>
        </body>
        </html>
    </xsl:template>

    <xsl:template match="fabricante">
        <section class="fabricante-section">
            <h2>Tarjetas Gráficas <xsl:value-of select="@nombre"/></h2>
            
            <div class="grid-productos">
                <xsl:for-each select="tarjeta">
                    
                    <xsl:sort select="especificaciones/vram" data-type="number" order="descending"/>
                    <xsl:sort select="precio" data-type="number" order="descending"/>

                    <article>
                        <xsl:attribute name="class">
                            <xsl:text>tarjeta-grafica </xsl:text>
                            <xsl:if test="especificaciones/vram &gt;= 16">gpu-entusiasta </xsl:if>
                            <xsl:if test="@disponible = 'false'">agotado</xsl:if>
                        </xsl:attribute>

                        <header>
                            <h3><xsl:value-of select="modelo"/></h3>
                        </header>

                        <div class="especificaciones">
                            <ul>
                                <li>
                                    <strong>Memoria VRAM:</strong> 
                                    <xsl:value-of select="especificaciones/vram"/> <xsl:value-of select="especificaciones/vram/@unidad"/> 
                                    (<xsl:value-of select="especificaciones/vram/@tipo"/>)
                                </li>
                                <li>
                                    <strong>Interfaz de memoria:</strong> 
                                    <xsl:value-of select="especificaciones/interfaz"/> <xsl:value-of select="especificaciones/interfaz/@unidad"/>
                                </li>
                                <li>
                                    <strong>Consumo (TDP):</strong> 
                                    <xsl:value-of select="especificaciones/consumo"/> <xsl:value-of select="especificaciones/consumo/@unidad"/>
                                </li>
                            </ul>
                        </div>

                        <div class="precio-stock">
                            <p class="precio"><xsl:value-of select="precio"/> <xsl:value-of select="precio/@moneda"/></p>
                            
                            <xsl:choose>
                                <xsl:when test="@disponible = 'true'">
                                    <p class="stock-ok">GPU en stock</p>
                                </xsl:when>
                                <xsl:otherwise>
                                    <p class="alerta-stock">Modelo agotado temporalmente</p>
                                </xsl:otherwise>
                            </xsl:choose>

                            <xsl:if test="precio &gt; 1000">
                                <p class="aviso-financiacion">Financiación disponible para esta gráfica</p>
                            </xsl:if>
                        </div>
                    </article>
                </xsl:for-each>
            </div>
        </section>
    </xsl:template>

</xsl:stylesheet>