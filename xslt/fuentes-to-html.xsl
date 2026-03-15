<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html"  encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <html lang="es">
        <head>
            <meta charset="UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <title>Catálogo - <xsl:value-of select="unidades_alimentacion/inventario/@categoria"/></title>
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
                <h1><xsl:value-of select="unidades_alimentacion/@tienda"/> - <xsl:value-of select="unidades_alimentacion/inventario/@categoria"/></h1>
                
                <xsl:variable name="totalFuentes" select="count(//fuente)"/>
                <xsl:variable name="stockTotal" select="sum(//estado)"/>
                
                <div class="resumen-estadistico">
                    <p>Total de modelos en catálogo: <strong><xsl:value-of select="$totalFuentes"/></strong></p>
                    <p>Unidades totales en almacén: <strong><xsl:value-of select="$stockTotal"/></strong></p>
                </div>
            </header>

            <main>
                <xsl:apply-templates select="unidades_alimentacion/inventario/fabricante"/>
            </main>

            <footer>
                <p>Catálogo actualizado el: <xsl:value-of select="unidades_alimentacion/inventario/@fechaActualizacion"/></p>
            </footer>
        </body>
        </html>
    </xsl:template>

    <xsl:template match="fabricante">
        <section class="fabricante-section">
            <h2>Fuentes de Alimentación <xsl:value-of select="@nombre"/></h2>
            
            <div class="grid-productos">
                <xsl:for-each select="fuente">
                    
                    <xsl:sort select="precio" data-type="number" order="descending"/>
                    <xsl:sort select="especificaciones/potencia" data-type="number" order="descending"/>

                    <article>
                        <xsl:attribute name="class">
                            <xsl:text>tarjeta-producto </xsl:text>
                            <xsl:if test="especificaciones/certificacion = '80+ Platinum' or especificaciones/certificacion = '80+ Titanium'">fuente-premium </xsl:if>
                            <xsl:if test="@disponible = 'false'">agotado</xsl:if>
                        </xsl:attribute>

                        <header>
                            <h3><xsl:value-of select="modelo"/></h3>
                            <p class="gama">Gama: <xsl:value-of select="@gama"/></p>
                        </header>

                        <div class="especificaciones">
                            <ul>
                                <li><strong>Potencia:</strong> <xsl:value-of select="especificaciones/potencia"/> <xsl:value-of select="especificaciones/potencia/@unidad"/></li>
                                <li><strong>Certificación:</strong> <xsl:value-of select="especificaciones/certificacion"/></li>
                                <li>
                                    <strong>Modular:</strong> 
                                    <xsl:choose>
                                        <xsl:when test="@modular = 'true'">Sí (Cables desmontables)</xsl:when>
                                        <xsl:otherwise>No (Cables fijos)</xsl:otherwise>
                                    </xsl:choose>
                                </li>
                            </ul>
                        </div>

                        <div class="precio-stock">
                            <p class="precio"><xsl:value-of select="precio"/> <xsl:value-of select="precio/@moneda"/></p>
                            
                            <xsl:if test="estado &lt; 10 and estado &gt; 0">
                                <p class="alerta-stock">¡Solo quedan <xsl:value-of select="estado"/> unidades!</p>
                            </xsl:if>
                            <xsl:if test="estado = 0">
                                <p class="alerta-stock">Agotado temporalmente</p>
                            </xsl:if>
                        </div>
                    </article>
                </xsl:for-each>
            </div>
        </section>
    </xsl:template>

</xsl:stylesheet>