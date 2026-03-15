<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <html lang="es">
        <head>
            <meta charset="UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <title>Catálogo - <xsl:value-of select="infraestructura_placa/inventario/@categoria"/></title>
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
                <h1><xsl:value-of select="infraestructura_placa/@tienda"/> - <xsl:value-of select="infraestructura_placa/inventario/@categoria"/></h1>
                
                <xsl:variable name="totalPlacas" select="count(//placa)"/>
                <xsl:variable name="stockTotal" select="sum(//estado)"/>
                
                <div class="resumen-estadistico">
                    <p>Total de placas base en catálogo: <strong><xsl:value-of select="$totalPlacas"/></strong></p>
                    <p>Unidades en stock (todas las marcas): <strong><xsl:value-of select="$stockTotal"/></strong></p>
                </div>
            </header>

            <main>
                <xsl:apply-templates select="infraestructura_placa/inventario/fabricante"/>
            </main>

            <footer>
                <p>Catálogo actualizado el: <xsl:value-of select="infraestructura_placa/inventario/@fechaActualizacion"/></p>
            </footer>
        </body>
        </html>
    </xsl:template>

    <xsl:template match="fabricante">
        <section class="fabricante-section">
            <h2>Placas Base <xsl:value-of select="@nombre"/></h2>
            
            <div class="grid-productos">
                <xsl:for-each select="placa">
                    
                    <xsl:sort select="especificaciones/formato" order="ascending"/>
                    <xsl:sort select="precio" data-type="number" order="descending"/>

                    <article>
                        <xsl:attribute name="class">
                            <xsl:text>tarjeta-placa </xsl:text>
                            <xsl:if test="estado/@disponible = 'false'">agotado </xsl:if>
                            <xsl:if test="@wifi = 'true'">con-wifi</xsl:if>
                        </xsl:attribute>

                        <header>
                            <h3><xsl:value-of select="modelo"/></h3>
                            <p class="gama">Gama: <xsl:value-of select="@gama"/></p>
                        </header>

                        <div class="especificaciones">
                            <ul>
                                <li><strong>Socket:</strong> <xsl:value-of select="especificaciones/socket"/></li>
                                <li><strong>Chipset:</strong> <xsl:value-of select="especificaciones/chipset"/></li>
                                <li><strong>Formato:</strong> <xsl:value-of select="especificaciones/formato"/></li>
                                <li>
                                    <strong>Conectividad:</strong>
                                    <xsl:choose>
                                        <xsl:when test="@wifi = 'true'">Incluye módulo Wi-Fi</xsl:when>
                                        <xsl:otherwise>Solo conexión LAN</xsl:otherwise>
                                    </xsl:choose>
                                </li>
                            </ul>
                        </div>

                        <div class="precio-stock">
                            <p class="precio"><xsl:value-of select="precio"/> <xsl:value-of select="precio/@moneda"/></p>
                            
                            <xsl:choose>
                                <xsl:when test="estado/@disponible = 'true'">
                                    <p class="stock-ok">Stock: <xsl:value-of select="estado"/> unidades</p>
                                </xsl:when>
                                <xsl:otherwise>
                                    <p class="alerta-stock">Agotado temporalmente</p>
                                </xsl:otherwise>
                            </xsl:choose>

                            <xsl:if test="precio &gt; 400">
                                <p class="aviso-premium">Envío gratuito asegurado</p>
                            </xsl:if>
                        </div>
                    </article>
                </xsl:for-each>
            </div>
        </section>
    </xsl:template>

</xsl:stylesheet>