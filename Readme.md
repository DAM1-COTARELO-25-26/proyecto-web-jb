Tienda de Componentes de Ordenador.
Nuestra página sirve para vender componentes de ordenador con múltiples ofertas.

Por un lado, tenemos un amplio catálogo que el usuario puede explorar mediante el menú desplegable o bien a través
del carrusel de ofertas que posicionado en la portada.

Por otro lado, gracias al carrito de compra el usuario podrá guardar aquellos componentes que sean de su interés. Además,
podrá registrarse en la página para hacer sus pedidos.

Por último, si surge cualquier inconveniente, contamos con varias formas de contacto de soporte técnico para los usuarios.

Estructura de Datos XML
Descripción
Este proyecto implementa un sistema de gestión de inventario para una tienda de hardware informático. Se utiliza XML como lenguaje de estructuración de datos debido a su capacidad para organizar información técnica compleja de forma jerárquica y legible, tanto para humanos como para máquinas.

Archivos
El núcleo del proyecto reside en la carpeta /datos/, donde cada categoría de producto está blindada por un sistema de validación triple:

Procesadores: cpu.xml, cpu.dtd, cpu.xsd

Fuentes de Alimentación: fuentes.xml, fuentes.dtd, fuentes.xsd

Tarjetas Gráficas: grafica.xml, grafica.dtd, grafica.xsd

Placas Base: placa_base.xml, placa_base.dtd, placa_base.xsd

Memorias RAM: ram.xml, ram.dtd, ram.xsd

Ratones: ratones.xml, ratones.dtd, ratones.xsd

Teclados: teclado.xml, teclado.dtd, teclado.xsd

Nota: Todos los archivos XML incluyen la declaración de encoding="UTF-8" y están vinculados correctamente a sus respectivos esquemas mediante DOCTYPE (DTD) y atributos xsi (XSD).

Estructura principal
La arquitectura de los datos sigue un modelo de árbol de 4 niveles, garantizando que cada pieza de información tenga un lugar lógico:

Nivel 1 (Raíz): Define el contexto del inventario (ej: <infraestructura_placa>). Contiene atributos de metadatos de la tienda.

Nivel 2 (Fabricante): Actúa como contenedor lógico para agrupar productos por marca (ej: <fabricante nombre="MSI">).

Nivel 3 (Entidad/Producto): Es el nodo principal de cada artículo. Utiliza un atributo id (tipo ID único) para indexación y atributos como disponible o gama para filtrado rápido.

Nivel 4 (Especificaciones): Un nodo especializado <especificaciones> que desglosa las características técnicas (socket, vram, potencia, etc.) con atributos de unidad de medida estandarizados.

Validación
Para asegurar que el proyecto cumple con los estándares de calidad y no contiene errores sintácticos o de tipo, se han seguido los siguientes protocolos de validación:

Validación DTD (Estructural): Se ha realizado utilizando la extensión XML de Red Hat en Visual Studio Code. Este proceso garantiza que la jerarquía, el orden de los elementos y los atributos obligatorios coincidan estrictamente con las reglas de negocio definidas.

Validación XSD (Tipado de datos): Se ha verificado mediante la herramienta externa FreeFormatter XML Validator. Esto asegura que los precios sean decimales, el stock sea un entero no negativo y las fechas cumplan el formato AAAA-MM-DD.