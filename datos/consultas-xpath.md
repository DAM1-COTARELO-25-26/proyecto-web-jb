# Consultas XPath - Proyecto Web JB

## 1. Rutas
* **Consulta:** `/tienda/inventario/fabricante/@nombre`
    * Selecciona los nombres de todos los fabricantes
    * Resultado esperado: "NVIDIA", "AMD"
    * La intención es generar dinámicamente etiquetas de filtrado por marca en la interfaz
* **Consulta:** `//modelo`
    * Selecciona el texto de todos los nodos modelo en cualquier profundidad del documento.
    * Resultado esperado: Listado completo de nombres de tarjetas gráficas.
    * La intención es crear un índice rápido de productos o un sitemap.

## 2. Predicados 
* **Consulta:** `//tarjeta[@disponible='true']/modelo`
    * Selecciona los modelos de las tarjetas cuyo atributo de disponibilidad es verdadero.
    * Resultado esperado: "NVIDIA GeForce RTX 4090", "AMD Radeon RX 7900 XTX", etc.
    * La intención es mostrar solo productos que el usuario puede comprar actualmente.
* **Consulta:** `//tarjeta[precio > 1000]/modelo`
    * Selecciona el nombre de los modelos cuyo precio numérico supera los 1000€
    * Resultado esperado: Gráficas de gama entusiasta (RTX 4090, 4080 Super, 7900 XTX).
    * La intención es hacer una segmentación de productos para una sección de "Gama Alta".

## 3. Funciones
* **Consulta:** `count(//tarjeta)`
    * Selecciona el número total de elementos tarjeta existentes
    * Resultado esperado: Un número entero (ej. 8).
    * La intención es mostrar el contador de resultados tras aplicar un filtro.
* **Consulta:** `sum(//tarjeta/precio)`
    * Selecciona la suma total de los valores de los nodos precio
    * Resultado esperado: El valor económico total del inventario.
    * La intención es generar informes de stock para la administración de la tienda.
* **Consulta:** `//tarjeta[contains(modelo, 'RTX')]/modelo`
    * Selecciona modelos que incluyen la cadena de texto "RTX" en su nombre
    * Resultado esperado: Únicamente las tarjetas de la familia RTX de NVIDIA.
    * La intención es motor de búsqueda simple para filtrar por familias de procesadores gráficos.

## 4. Navegación por ejes
* **Consulta:** `//tarjeta[@id='GPU-NV-4090']/following-sibling::tarjeta[1]/modelo`
    * Selecciona el modelo de la tarjeta que se encuentra inmediatamente después de la RTX 4090 en el XML
    * Resultado esperado: "NVIDIA GeForce RTX 4080 SUPER".
    * La intención es implementar botones de navegación "Siguiente Producto" en la web.

## 5. Consultas complejas 
* **Consulta:** `//tarjeta[@disponible='true' and especificaciones/vram > 16]/modelo`
    * Selecciona tarjetas con stock que además tengan una memoria VRAM superior a 16GB
    * Resultado esperado: Modelos potentes disponibles (ej. RX 7900 XTX).
    * La intención es filtro avanzado para usuarios profesionales de renderizado o 4K.
* **Consulta:** `//fabricante[@nombre='AMD']//tarjeta[precio < 800]/modelo`
    * Selecciona modelos del fabricante AMD cuyo precio sea menor a 800€
    * Resultado esperado: "AMD Radeon RX 7800 XT", "AMD Radeon RX 6500 XT".
    * La intención es hacer unas recomendaciones de presupuesto ajustado para una marca específica.