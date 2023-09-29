# Explicación del Tablero y su Vínculo con el Proceso de Ingeniería

En esta sección, vamos a profundizar en los aspectos clave del tablero Kanban y su relación con nuestro proceso de ingeniería ágil. Para una comprensión completa, abordaremos los siguientes elementos:

## Métodos de Diseño y Pruebas

### Diseño

En nuestro proceso de ingeniería, utilizaremos Mermaid como método principal para diseñar y representar visualmente nuestros diagramas. Mermaid nos permite crear diagramas de flujo, diagramas de secuencia, diagramas UML y otros tipos de diagramas directamente en nuestro entorno de desarrollo, lo que facilita la comunicación y la comprensión de la arquitectura y el diseño del software. Además, al ser compatible con GitHub, podemos integrar estos diagramas en nuestra documentación y colaborar de manera efectiva sin necesidad de herramientas adicionales.

### Pruebas (TDD)

Para asegurar la calidad de nuestro código, seguiremos la metodología de Desarrollo Guiado por Pruebas (TDD). Con TDD, escribiremos pruebas automatizadas antes de implementar nuevas características o corregir errores. Esto nos ayudará a garantizar que el software funcione como se espera y a mantener la estabilidad del sistema a lo largo del tiempo. Las pruebas formarán parte integral de nuestro proceso de desarrollo y estarán representadas en nuestro tablero Kanban en las columnas correspondientes.

## CEREMONIA, ROL, ARTEFACTO, MÉTODO

Para mantener una visión general y coherente de nuestro proceso de ingeniería ágil, utilizaremos una estructura simple basada en los conceptos de Ceremonia, Rol, Artefacto y Método. Estos elementos se interrelacionan para definir y guiar nuestro proceso de desarrollo:

| Ceremonia                | Rol             | Artefacto                  | Método                                           |
| ------------------------ | --------------- | -------------------------- | ------------------------------------------------ |
| Reunión de Planificación | Product Owner   | Lista de Tareas Pendientes | Establecimiento de Prioridades y Objetivos       |
|                          | Scrum Master    |                            |                                                  |
|                          | Desarrolladores |                            |                                                  |
|                          |                 |                            |                                                  |
| Daily Standup            | Desarrolladores | Tablero Kanban             | Actualización del Estado de Tareas               |
|                          |                 | Lista de Tareas Pendientes | Identificación de Obstáculos                     |
|                          |                 |                            |                                                  |
| Revisión de Código       | Product Owner   | Código Fuente              | Revisión de Calidad y Cumplimiento               |
|                          | Desarrolladores |                            | Mejoras y Correcciones                           |
|                          |                 |                            |                                                  |
| Retrospectiva            | Scrum Master    | Registro de Retrospectiva  | Identificación de Mejoras y Lecciones Aprendidas |
|                          | Desarrolladores |                            | Planificación de Acciones Correctivas            |
