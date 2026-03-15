<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <xsl:output method="html" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <html lang="es">
            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Catálogo de Procesadores - <xsl:value-of select="tienda/@nombre" /></title>
                <link rel="stylesheet" href="css/style.css" />
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
                    <h1><xsl:value-of select="tienda/@nombre" /> - Catálogo de CPUs</h1>
                    <p>Ubicación: <xsl:value-of select="tienda/@ubicacion" /></p>

                    <xsl:variable name="totalCPUs" select="count(//chip)" />
                    <xsl:variable name="precioTotal" select="sum(//precio)" />
                    <xsl:variable name="precioMedio" select="$precioTotal div $totalCPUs" />

                    <div class="estadisticas">
                        <p>Total de modelos en catálogo: <strong>
                                <xsl:value-of select="$totalCPUs" />
                            </strong></p>
                        <p>Precio medio del catálogo: <strong><xsl:value-of
                                    select="format-number($precioMedio, '#.00')" /> €</strong></p>
                    </div>
                </header>

                <main>
                    <xsl:apply-templates select="tienda/inventario/fabricante" />
                </main>

                <footer>
                    <p>Catálogo actualizado el: <xsl:value-of
                            select="tienda/inventario/@fechaActualizacion" /></p>
                </footer>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="fabricante">
        <section class="fabricante-section">
            <h2>Procesadores <xsl:value-of select="@nombre" /> (Arq: <xsl:value-of
                    select="@arquitectura" />)</h2>

            <div class="grid-productos">
                <xsl:for-each select="chip">

                    <xsl:sort select="@disponible" order="descending" />
                    <xsl:sort select="precio"
                        data-type="number" order="descending" />

                    <article>
                        <xsl:attribute name="class">
                            <xsl:text>tarjeta-cpu </xsl:text>
    <xsl:if test="@destacado = 'true'">cpu-destacada </xsl:if>
    <xsl:if
                                test="@disponible = 'false'">cpu-agotada</xsl:if>
                        </xsl:attribute>

                        <header>
                            <h3>
                                <xsl:value-of select="modelo" />
                            </h3>
                            <xsl:if test="@destacado = 'true'">
                                <span class="badge"> Destacado</span>
                            </xsl:if>
                        </header>

                        <div class="especificaciones">
                            <ul>
                                <li>
                                    <strong>Núcleos/Hilos:</strong>
                                    <xsl:value-of select="especificaciones/nucleos_hilos" />
                                </li>
                                <li>
                                    <strong>Socket:</strong>
                                    <xsl:value-of select="especificaciones/socket" />
                                </li>
                                <li>
                                    <strong>Frecuencia:</strong>
                                    <xsl:value-of select="especificaciones/frecuencia" />
                                    <xsl:value-of select="especificaciones/frecuencia/@unidad" />
                                </li>
                            </ul>
                        </div>

                        <div class="precio-stock">
                            <p class="precio">
                                <xsl:value-of select="precio" />
                                <xsl:value-of select="precio/@moneda" />
                            </p>

                            <p class="stock">
                                <xsl:choose>
                                    <xsl:when test="stock_actual &gt; 15"> Stock alto (<xsl:value-of
                                            select="stock_actual" />)</xsl:when>
                                    <xsl:when test="stock_actual &gt; 0"> Últimas unidades (<xsl:value-of
                                            select="stock_actual" />)</xsl:when>
                                    <xsl:otherwise> Agotado</xsl:otherwise>
                                </xsl:choose>
                            </p>
                        </div>
                    </article>
                </xsl:for-each>
            </div>
        </section>
    </xsl:template>

</xsl:stylesheet>