<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html"  encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <html lang="es">
        <head>
            <meta charset="UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <title>Catálogo - <xsl:value-of select="almacenamiento_volatil/inventario/@categoria"/></title>
           <link rel="stylesheet" href="../css/tablas.css"/>
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
                <h1><xsl:value-of select="almacenamiento_volatil/@tienda"/> - <xsl:value-of select="almacenamiento_volatil/inventario/@categoria"/></h1>
                
                <xsl:variable name="totalModulos" select="count(//modulo)"/>
                <xsl:variable name="stockTotal" select="sum(//estado)"/>
                
                <div class="resumen-estadistico">
                    <p>Total de modelos en catálogo: <strong><xsl:value-of select="$totalModulos"/></strong></p>
                    <p>Unidades totales en stock: <strong><xsl:value-of select="$stockTotal"/></strong></p>
                </div>
            </header>

            <main>
                <xsl:apply-templates select="almacenamiento_volatil/inventario/fabricante"/>
            </main>

            <footer>
                <p>Catálogo actualizado el: <xsl:value-of select="almacenamiento_volatil/inventario/@fechaActualizacion"/></p>
            </footer>
        </body>
        </html>
    </xsl:template>

    <xsl:template match="fabricante">
        <section class="fabricante-section">
            <h2>Memorias <xsl:value-of select="@nombre"/></h2>
            
            <div class="grid-productos">
                <xsl:for-each select="modulo">
                    
                    <xsl:sort select="@tecnologia" order="descending"/>
                    <xsl:sort select="especificaciones/capacidad" data-type="number" order="descending"/>

                    <article>
                        <xsl:attribute name="class">
                            <xsl:text>tarjeta-ram </xsl:text>
                            <xsl:if test="@rgb = 'true'">iluminacion-rgb </xsl:if>
                            <xsl:if test="@tecnologia = 'DDR5'">nueva-generacion </xsl:if>
                            <xsl:if test="estado/@disponible = 'false'">agotado</xsl:if>
                        </xsl:attribute>

                        <header>
                            <h3><xsl:value-of select="modelo"/></h3>
                            <p class="gama">Tecnología: <xsl:value-of select="@tecnologia"/></p>
                        </header>

                        <div class="especificaciones">
                            <ul>
                                <li><strong>Capacidad:</strong> <xsl:value-of select="especificaciones/capacidad"/> <xsl:value-of select="especificaciones/capacidad/@unidad"/></li>
                                <li><strong>Configuración:</strong> <xsl:value-of select="especificaciones/configuracion"/></li>
                                <li><strong>Frecuencia:</strong> <xsl:value-of select="especificaciones/frecuencia"/> <xsl:value-of select="especificaciones/frecuencia/@unidad"/></li>
                                <li>
                                    <strong>Estética:</strong>
                                    <xsl:choose>
                                        <xsl:when test="@rgb = 'true'">Con iluminación RGB</xsl:when>
                                        <xsl:otherwise>Diseño estándar (Sin RGB)</xsl:otherwise>
                                    </xsl:choose>
                                </li>
                            </ul>
                        </div>

                        <div class="precio-stock">
                            <p class="precio"><xsl:value-of select="precio"/> <xsl:value-of select="precio/@moneda"/></p>
                            
                            <xsl:choose>
                                <xsl:when test="estado/@disponible = 'true'">
                                    <p class="stock-ok">En stock: <xsl:value-of select="estado"/> unidades</p>
                                </xsl:when>
                                <xsl:otherwise>
                                    <p class="alerta-stock">Agotado temporalmente</p>
                                </xsl:otherwise>
                            </xsl:choose>

                            <xsl:if test="especificaciones/frecuencia &gt;= 6000">
                                <p class="aviso-rendimiento">Alto rendimiento (6000+ MHz)</p>
                            </xsl:if>
                        </div>
                    </article>
                </xsl:for-each>
            </div>
        </section>
    </xsl:template>

</xsl:stylesheet>