# Pharma GO

![LOGO](./imagenes/Pharma%20Go%20logo.png)

# Estructura del repositorio

```
├── documentos
|   ├── Mantenimiento del repositorio.md
|   ├── Proceso de ingenieria en KANBAN.md
|   └── ...
├── imagenes
|   ├── Pharma Go logo.png
|   └── ...
├── codigo
|   ├── frontend
|   └── backend
```

# Authors 🖋️

- Fabio Orlinski Nº 173630
- Andrés Fraga Nº 151351
- Santiago Irazoqui Nº 234730

# Entregas

- [Entrega 1](#entrega-1)
- [Entrega 2](#entrega-2)
- [Entrega 3](#entrega-3)

## Entrega 1

### Artefactos

- [Definición y uso del proceso de ingeniería en el contexto de KANBAN](./documentos/Entrega%201/Proceso%20de%20ingenieria%20en%20KANBAN.md)
- [Creación y posterior mantenimiento del repositorio: elementos que contiene y cómo los van a versionar](./documentos/Entrega%201/Mantenimiento%20del%20repositorio.md)
- [Detalle de registro de esfuerzo](./documentos/Entrega%201//Detalle%20de%20registro%20de%20esfuerzo.pdf)
- [Resumen de Issues](./documentos/Entrega%201/Resumen%20de%20Issues.pdf)
- [Resumen de la retrospectiva](./documentos/Entrega%201/Resumen%20de%20la%20retrospectiva.pdf)

### Conclusiones del equipo

En conclusión, tras un análisis del código de la aplicación PharmaGo, hemos identificado una serie de áreas de mejora significativas en términos de deuda técnica. Estos hallazgos incluyen problemas relacionados con errores de programación, problemas de diseño y desviaciones con respecto a los estándares de desarrollo recomendados. Estos problemas abarcan desde bugs críticos que afectan la funcionalidad básica de la aplicación hasta problemas de diseño que afectan la usabilidad y la experiencia del usuario, así como desviaciones de las buenas prácticas de desarrollo y estándares de codificación.

Es importante resolver estos problemas de manera efectiva para garantizar la estabilidad, y eficiencia a largo plazo de PharmaGo. Esto requerirá un esfuerzo de colaboración entre los equipos de desarrollo de Angular y .NET, con un enfoque en la corrección de errores, la optimización del diseño de la aplicación y la adhesión a los estándares de desarrollo aceptados.

Además, se recomienda implementar una sólida estrategia de pruebas y revisión de código para prevenir la reintroducción de estos problemas en el futuro.

En resumen, este analisis de software ha proporcionado una hoja de ruta clara para la mejora continua de PharmaGo y la entrega de un producto más sólido y eficiente en las siguientes iteraciones.

## Entrega 2

### Informe de avance

En esta etapa del proyecto, el equipo se centró en seleccionar y resolver 3 bugs de aquellos que fueron relevados en la entrega anterior. Para seleccionarlos, se tomó en consideración la clasificación que le dimos en cuanto a prioridad y severidad, eligiendo aquellos que tuvieran las clasificaciones más altas. El desarrollo y diseño fue llevado a cabo utilizando TDD.

Por otro lado, también nos enfocamos en la automatización de partes del pipeline de desarrollo. Este se realizó con Github Actions, y diseñamos el pipeline junto con el tablero para identificar qué secciones se pueden automatizar.

En cuanto al tablero, en esta entrega decidimos cambiar y pasar a utilizar un tablero sustentable, ya que creímos que se ajustaba mejor a las necesidades actuales.

### Artefactos

- [Definición/uso del proceso de ingeniería en el contexto de KANBAN](./documentos/Entrega%202/Proceso%20de%20ingenieria%20en%20KANBAN%202.md)
- [Explicación del tablero y su vínculo con el proceso de ingeniería](./documentos/Entrega%202/Explicacion%20del%20tablero%20y%20su%20vinculo%20con%20el%20proceso%20de%20ingenieria.md)
- [Informe con identificación y justificación de los bugs](./documentos/Entrega%202/Informe%20con%20identificacion%20y%20justificacion%20de%20los%20bugs.md)
- [Evidencia de reparación de bugs con TDD](./documentos/Entrega%202/Evidencia%20de%20reparaci%C3%B3n%20de%20bugs%20con%20TDD.pdf)
- [Configuración del pipeline y si vínculo con el tablero](./documentos/Entrega%202/Configuracion%20pipeline.md)
- [Detalle de registro de esfuerzo](./documentos/Entrega%202/Detalle%20de%20registro%20de%20esfuerzo%20(Entrega%202).pdf)
- [Video de revisión de bugs con el PO](https://youtu.be/Xfz3ubNvXgk)
- [Resumen de la retrospectiva](./documentos/Entrega%202/Resumen%20de%20la%20retrospectiva%20(Entrega%202).pdf)

#### Ceremonias realizadas

![Ceremonias](./imagenes/Entrega%202/Ceremonias.png)

### Conclusiones del equipo

En primer lugar, el tablero sustentable demostró ser mucho más útil para el equipo en esta etapa. Ahora que tenemos las issues y tareas bien definidas, fue más importante para el equipo poder entender rápidamente en qué estado se encuentra cada tarjeta. De esta manera, si una tarjeta se encuentra en Review por ejemplo, sabemos que hay un PR esperando para ser revisado, aprobado, y mergeado. Esto logró que la comunicación del equipo sea más fluida.

Trabajar con TDD nos permitió estar seguros de nuestro trabajo, ya que tenemos los tests (tanto los nuestros como aquellos realizados previamente por los autores del proyecto original) funcionando como una base para chequear los requerimientos. Pudimos lograr entonces un diseño simple con código testeable.

En esta etapa aprendimos mucho sobre la automatización de ciertas partes del pipeline de desarrollo. Fue una buena oportunidad para investigar sobre el tema, ver qué acciones es posible utilizar, y sobre todo nos permitió acercarnos un poco más a las prácticas de entrega continua.

## Entrega 3

### Informe de avance

Para esta etapa, nos enfocamos en la implementación de nuevas funcionalidades como fueron indicadas por los profesores. Sin embargo, en esta oportunidad utilizamos BDD, una nueva metodología ágil, junto con la herramienta Specflow para desarrollar los tests. Esto significó un cambio en el tablero, ya que varias columnas del tablero sustentable pasaron a ser las etapas de BDD.

### Artefactos

- [Explicación del tablero y su vínculo con el proceso de ingeniería](./documentos/Entrega%203/Explicacion%20del%20tablero%20y%20su%20vinculo%20con%20el%20proceso%20de%20ingenieria.md)

#### Ceremonias realizadas

### Conclusiones del equipo

Aplicar BDD fue muy interesante ya que nos permitió desarrollar nuestra aplicación de forma ágil y con código testeable (antes lo logramos con TDD), pero ahora partiendo siempre desde el punto de vista del usuario. Esto nos asegura que todos los cambios que nosotros los desarrolladores queramos hacer le agreguen valor al usuario, ya que los tests ahora parten directamente de los criterios de aceptación de una historia de usuario. Otra ventaja es que de esta manera ampliamos el ciclo de feedback, haciéndolo más accesible y ágil, lo que ayuda también a las prácticas de entrega continua.

Utilizar Specflow fue una buena herramienta para desarrollar estos tests. Aunque al principio dificulta el avance ya que no es algo a lo que estemos acostumbrados, se le puede agarrar la mano fácilmente. A fin de cuentas los tests siguen siendo muy similares en su lógica, es el enfoque lo que más cambia.
