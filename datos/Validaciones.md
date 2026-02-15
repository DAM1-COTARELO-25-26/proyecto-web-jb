# Validación del archivo cpu.xml

## 1. Herramientas utilizadas

### Validación DTD
- Herramienta: Visual Studio Code (XML by Red Hat)
- Versión: v0.27.0

### Validación XSD
- Herramienta: xmllint (libxml2)
- Versión: 2.9.10

## 2. Proceso de validación

### Validación contra DTD
**Comando/Pasos ejecutados:**
Inclusión de la referencia <!DOCTYPE tienda SYSTEM "cpu.dtd"> y comprobación de errores en el editor.

## 3. Proceso de validación

### Validación contra XSD
**Comando/Pasos ejecutados:**
xmllint --schema cpu.xsd cpu.xml --noout


# Validación del archivo fuentes.xml

## 1. Herramientas utilizadas

### Validación DTD
- Herramienta: Visual Studio Code

### Validación XSD
- Herramienta: xmllint

## 2. Proceso de validación

### Validación contra DTD
**Comando/Pasos ejecutados:**
Verificación de los atributos booleanos modular y disponible.

## 3. Proceso de validación

### Validación contra XSD
**Comando/Pasos ejecutados:**
xmllint --schema fuentes.xsd fuentes.xml --noout


# Validación del archivo grafica.xml

## 1. Herramientas utilizadas

### Validación DTD
- Herramienta: Visual Studio Code

### Validación XSD
- Herramienta: xmllint

## 2. Proceso de validación

### Validación contra DTD
**Comando/Pasos ejecutados:**
Validación del enumerado (NVIDIA | AMD) en el atributo nombre del fabricante.

## 3. Proceso de validación

### Validación contra XSD
**Comando/Pasos ejecutados:**
xmllint --schema grafica.xsd grafica.xml --noout


# Validación del archivo placa_base.xml

## 1. Herramientas utilizadas

### Validación DTD
- Herramienta: Visual Studio Code

### Validación XSD
- Herramienta: xmllint

## 2. Proceso de validación

### Validación contra DTD
**Comando/Pasos ejecutados:**
Vinculación con placa_base.dtd y verificación de la estructura de especificaciones.

## 3. Proceso de validación

### Validación contra XSD
**Comando/Pasos ejecutados:**
xmllint --schema placas_base.xsd placa_base.xml --noout


# Validación del archivo ram.xml

## 1. Herramientas utilizadas

### Validación DTD
- Herramienta: Visual Studio Code

### Validación XSD
- Herramienta: xmllint

## 2. Proceso de validación

### Validación contra DTD
**Comando/Pasos ejecutados:**
Verificación de los atributos fijos unidad="GB" y unidad="MHz".

## 3. Proceso de validación

### Validación contra XSD
**Comando/Pasos ejecutados:**
xmllint --schema ram.xsd ram.xml --noout


# Validación del archivo ratones.xml

## 1. Herramientas utilizadas

### Validación DTD
- Herramienta: Visual Studio Code (XML by Red Hat)
- Versión: v0.27.0

### Validación XSD
- Herramienta: xmllint
- Versión: 2.9.10

## 2. Proceso de validación

### Validación contra DTD
**Comando/Pasos ejecutados:**
Se utilizó la declaración <!DOCTYPE perifericos_puntero SYSTEM "ratones.dtd">. Se validó que cada elemento <raton> contuviera los campos obligatorios de DPI y Peso con sus respectivas unidades fijas.

## 3. Proceso de validación

### Validación contra XSD
**Comando/Pasos ejecutados:**
xmllint --schema ratones.xsd ratones.xml --noout  
Se validó que los valores de dpi_max y peso fueran de tipo entero y que el atributo disponible fuera booleano.


# Validación del archivo teclado.xml

## 1. Herramientas utilizadas

### Validación DTD
- Herramienta: Visual Studio Code
- Versión: v0.27.0

### Validación XSD
- Herramienta: xmllint
- Versión: 2.9.10

## 2. Proceso de validación

### Validación contra DTD
**Comando/Pasos ejecutados:**
Se vinculó el archivo teclado.dtd al XML. Se comprobó que el atributo rgb solo aceptara los valores "true" o "false" definidos en el DTD.

## 3. Proceso de validación

### Validación contra XSD
**Comando/Pasos ejecutados:**
xmllint --schema teclado.xsd teclado.xml --noout  
Se verificó que el elemento <estado> fuera un entero no negativo (xs:nonNegativeInteger) y que las fechas de registro siguieran el formato ISO.
