#DiplomaSy


##Descripción

Script en Perl para crear diplomas a partir de los datos contenidos en un archivo CSV y una plantilla PDF.

Necesita que esté instalado el módulo PDF::Reuse [http://search.cpan.org/~cnighs/PDF-Reuse/]

En base a la configuración contenida en el archivo `config.txt`, toma los datos de un archivo CSV (`people.csv`, por defecto) y usa un archivo PDF como plantilla (`model.pdf`, por defecto) para generar un PDF multipágina (`diplomas.pdf`, por defecto) con tantos diplomas como líneas de datos haya en el CSV.

Todas las medidas se dan en puntos tipográficos (pt).

Se adjunta el archivo reference.pdf como referencia de medidas y posiciones.


##Opciones de configuración:

Se asignan en el archivo config.txt

En caso de que alguna opción no esté definida, se usará su valor por defecto.


###COORDINATES

Coordenadas del documento (en puntos) donde se imprimirá el contenido de los campos del archivo CSV de entrada.

Consta de pares de coordenadas horizontal y vertical separadas por comas. Si hay más de uno, cada par de coordenadas se separa del siguiente por un punto.

Independientemente de la orientación del papel (ver más abajo), la posicion se mide siempre desde la esquina inferior izquierda, incrementándose las X a la derecha y las Y hacia arriba.


###OutputPDF

Nombre del archivo resultante. Se trata de un archivo PDF con tantas páginas como filas tenga el archivo CSV de entrada, cada una de ellas con una instancia del archivo PDF de entrada completado con los datos de esa fila. 

Si el archivo ya existe, se sobreescribirá.

Valor por defecto: "diplomas.pdf"


###InputPDF

Archivo PDF con la plantilla para el diploma.

Valor por defecto: "model.pdf"


###Orientation

La orientación del diploma. 

Si es H se asumirá que el diploma está orientado horizontalmente, y el texto se colocará de ese modo.

```
 ___________
|           |
|     H     |
|___________|

Texto -->

```

Si es V se asumirá que el diploma está orientado verticalmente, y el texto se colocará de ese modo (de abajo a arriba).

```
 _______
|       |
|       |   ^
|   V   |   |
|       |   |
|_______| Texto
```

Valor por defecto: V


###DataFile

Archivo CSV con los datos que se usarán para rellenar los diplomas.

El conenido de cada campo será ubicado en las coordenadas asignadas con `COORDINATES`, en el mismo orden.

Valor por defecto: people.csv


###FontSize

Tamaó (en puntos) de la tipografía usada para escribir los datos en el diploma.

Valor por defecto: 40


###Font

Tipografía usada para escribir los datos en el diploma.

Tipografías aceptadas:

* Times-Roman
* Times-Bold
* Times-Italic
* Times-BoldItalic
* Courier
* Courier-Bold
* Courier-Oblique
* Courier-BoldOblique
* Helvetica
* Helvetica-Bold
* Helvetica-Oblique
* Helvetica-BoldOblique

Opcionalmente, se pueden uar los respectivos nombres abreviados:

* TR
* TB
* TI
* TBI
* C
* CB
* CO
* CBO
* H
* HB
* HO
* HBO

Valor por defecto: Times-Bold
