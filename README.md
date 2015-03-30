#DiplomaSy

Script para crear diplomas a partir de los datos contenidos en un archivo CSV y una plantilla PDF.


##Opciones de configuración:

Se asignan en el archivo config.txt

En caso de que alguna opción no esté definida, se usará su valor por defecto.


###COORDINATES

Coordenadas del documento (en puntos) donde se imprimirá el contenido de los campos del archivo CSV de entrada.

Consta de pares de coordenadas horizontal y vertical separadas por comas. Si hay más de uno, cada par de coordenadas se separa del siguiente por un punto.


###OutputPDF

Nombre del archivo resultante. Se trata de un archivo PDF con tantas páginas como filas tenga el archivo CSV de entrada, cada una de ellas con una instancia del archivo PDF de entrada completado con los datos de esa fila. 

Si el archivo ya existe, se sobreescribirá.

Valor por defecto: "output.pdf"


###InputPDF

Archivo PDF con la plantilla para el diploma.

Valor por defecto: "diploma.pdf"


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

Valor por defecto: data.csv


###FontSize

Tamaó (en puntos) de la tipografía usada para escribir los datos en el diploma.

Valor por defecto: 30


###Font

Tipografía usada para escribir los datos en el diploma.

Valor por defecto: Times-Bold