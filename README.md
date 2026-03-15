    [![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/0esC98hF)
Tienda de Componentes de Ordenador.
Nuestra página sirve para vender componentes de ordenador con múltiples ofertas.

Por un lado, tenemos un amplio catálogo que el usuario puede explorar mediante el menú desplegable o bien a través
del carrusel de ofertas que posicionado en la portada.

Por otro lado, gracias al carrito de compra el usuario podrá guardar aquellos componentes que sean de su interés. Además,
podrá registrarse en la página para hacer sus pedidos.

Por último, si surge cualquier inconveniente, contamos con varias formas de contacto de soporte técnico para los usuarios.
## Fase 4: Proceso de transformación y consulta de datos (XSLT y XPath)

En esta fase del proyecto se ha automatizado la generación de los catálogos de productos de la tienda. Se ha pasado de tener los datos almacenados en bruto en archivos XML a generar páginas web completas y semánticas en HTML5 mediante hojas de transformación XSLT.

### Archivos involucrados
* **Archivos XML (Datos):** Ubicados en la carpeta `/datos/`. Contienen el inventario estructurado de los distintos componentes (CPUs, gráficas, ratones, teclados, etc.).
* **Archivos XSLT (Plantillas):** Ubicados en la carpeta `/xslt/`. Contienen la lógica de transformación, la estructura semántica de la web (incluyendo el menú de navegación y el footer fijos) y las reglas de extracción de datos.
* **Archivos HTML (Generados):** Páginas estáticas resultantes guardadas en la estructura del proyecto (como `Procesador.html` o `grafica.html`) e integradas visualmente con el CSS corporativo del sitio.
* **Consultas de datos:** El archivo `/datos/consultas-xpath.md` incluye 10 consultas variadas extraídas de los inventarios para demostrar el manejo de XPath.

### Cómo ejecutar la transformación (2 Opciones)
Para generar los archivos HTML finales a partir de los documentos XML y XSLT, se han documentado y utilizado estos dos métodos:

**Opción 1: Uso de XML Copy Editor (Software de escritorio)**
1. Abrir el archivo de datos `.xml` con el programa XML Copy Editor.
2. Ir al menú superior y seleccionar **XML > XSL Transform...** (o pulsar la tecla F8).
3. En la ventana emergente, buscar y seleccionar la hoja de transformación `.xsl` correspondiente.
4. El programa generará un nuevo documento con el código HTML resultante, que simplemente debemos guardar con la extensión `.html` en nuestra carpeta correspondiente.

**Opción 2: Uso de FreeFormatter (Herramienta Online)**
1. Acceder a la herramienta web *FreeFormatter XSLT Transformer*.
2. En el primer cuadro de texto (XML Input), pegar el contenido completo del archivo `.xml` (omitiendo temporalmente la línea del `<!DOCTYPE>` para evitar errores de validación del DTD local de la web).
3. En el segundo cuadro de texto (XSL Input), pegar el contenido de la hoja de transformación `.xsl`.
4. Hacer clic en "Transform XML". El código HTML se generará en la parte inferior, listo para ser copiado y guardado como un archivo `.html` en el proyecto.

### Funcionalidades XSLT Avanzadas Implementadas
Además de los elementos obligatorios mínimos requeridos (`<xsl:template>`, `<xsl:apply-templates>`, `<xsl:for-each>`, `<xsl:value-of>`, etc.), se han desarrollado las siguientes funcionalidades avanzadas para enriquecer el catálogo:

* **Variables:** Uso de `<xsl:variable>` en las cabeceras de los catálogos para almacenar valores globales (ej. `$totalCPUs`, `$precioTotal`).
* **Cálculos estadísticos:** Implementación de funciones matemáticas de XPath como `count()` para contar el total de modelos del catálogo y `sum()` para calcular unidades totales o precios medios en tiempo real, mostrándolos en un panel resumen.
* **Ordenación múltiple:** Uso concatenado de `<xsl:sort>` dentro de los bucles para ordenar los artículos aplicando dos criterios (por ejemplo, primero ordenar por disponibilidad o especificación técnica, y como criterio secundario por precio descendente).
* **Formato condicional (Clases dinámicas CSS):** Mediante el uso de `<xsl:attribute>` combinado con sentencias condicionales (`<xsl:if>` y `<xsl:choose>`), se inyectan clases CSS específicas a las tarjetas de producto dependiendo de sus valores. Por ejemplo, si un producto tiene `@disponible='false'`, se le añade la clase dinámica `agotado` para mostrarlo en rojo y con baja opacidad; o si es un producto destacado (`@destacado='true'`), se le añade una clase `premium` para resaltarlo visualmente con un borde dorado.
### Capturas del resultado final

A continuación, se demuestra el correcto funcionamiento de las transformaciones visuales (HTML generado desde XML con XSLT y CSS aplicado), así como las pruebas de extracción de datos y validaciones:

#### 1. Páginas HTML Generadas mediante XSLT
*(Resultado visual de los catálogos con estilos y menús integrados)*
![Procesadores Generado](xslt/procesador_generado.png)
![Placas Base Generado](xslt/placa_base_generado.png)
![Memorias RAM Generado](xslt/memorias_RAM_generado.png)
![Tarjetas Gráficas Generado](xslt/tarjetas_graficas_generado.png)
![Fuentes de Alimentación Generado](xslt/fuentes_alimentacion_generado.png)
![Teclados Generado](xslt/teclado_generado.png)
![Ratones Generado](xslt/ratones_generado.png)

#### 2. Consultas XPath
*(Pruebas de validación de las 10 consultas de extracción de datos)*
![Consulta XPath 1](xslt/consulta1.png)
![Consulta XPath 2](xslt/consulta2.png)
![Consulta XPath 3](xslt/consulta3.png)
![Consulta XPath 4](xslt/consulta4.png)
![Consulta XPath 5](xslt/consulta5.png)
![Consulta XPath 6](xslt/consulta6.png)
![Consulta XPath 7](xslt/consulta7.png)
![Consulta XPath 8](xslt/consulta8.png)
![Consulta XPath 9](xslt/consulta9.png)
![Consulta XPath 10](xslt/consulta10.png)

