# Explicación del Tablero y su Vínculo con el Proceso de Ingeniería

En esta sección, vamos a profundizar en los aspectos clave del tablero Kanban y su relación con nuestro proceso de ingeniería ágil. Para una comprensión completa, abordaremos los siguientes elementos:

## Métodos de Diseño y Pruebas

### 1 - Pruebas (BDD)

Para las nuevas feature, en el marco de nuestras prácticas de Desarrollo Guiado por el Comportamiento (BDD), utilizamos SpecFlow y Gherkin para definir y ejecutar pruebas de comportamiento. SpecFlow nos permite escribir escenarios de prueba en lenguaje natural y automatizar las pruebas en función de esos escenarios. Esto garantiza que nuestras características se alineen con las expectativas del usuario y que el software cumpla con los requisitos definidos.
Una user story de una nueva feature deberia pasar por: Backlog -> Requeriments Definitions -> Test Cases Implementation -> Application Implementation -> Automation Testing -> Refactoring -> Integration Testing -> Review -> Done

### 2 - Pruebas (TDD)

Para asegurar la calidad de nuestro código al solucionar issues, seguiremos la metodología de Desarrollo Guiado por Pruebas (TDD). Con TDD, escribiremos pruebas automatizadas antes de implementar nuevas características o corregir errores. Esto nos ayudará a garantizar que el software funcione como se espera y a mantener la estabilidad del sistema a lo largo del tiempo. Las pruebas formarán parte integral de nuestro proceso de desarrollo y estarán representadas en nuestro tablero Kanban en las columnas correspondientes.
Una tarea de una nueva issue deberia pasar por: Backlog -> TDD -> Integration Testing -> Review -> Done

### 3 - Tareas Auxiliares

Para las tareas que no requieran codigo, las dejaremos en 4 columnas solamente, backlog, doing, review y done.
Una tarea no relacionada con el codigo deberia pasar por: Backlog -> Doing -> Review -> Done

## CEREMONIA, ROL, ARTEFACTO, MÉTODO

A continuación, se presenta una tabla que ilustra la estructura de nuestras ceremonias, roles, artefactos y métodos en el proceso de ingeniería ágil:

| Ceremonia                 | Rol             | Artefacto                  | Método                                               |
| ------------------------- | --------------- | -------------------------- | ---------------------------------------------------- |
| Planning                  | Equipo          | Plan                       | Estimacion                                           |
| ------------------------- | --------------- | -------------------------- | ---------------------------------------------------- |
| Requeriment Definition    | Usuario         | Requerimiento              | Card Conversation Confirmation + Historia de Usuario |
|                           | Equipo          |                            |                                                      |
| ------------------------- | --------------- | -------------------------- | ---------------------------------------------------- |
| Test Cases Implementation | Equipo          | Test Cases                 | Gherkin                                              |
| ------------------------- | --------------- | -------------------------- | ---------------------------------------------------- |
| Aplication Implementation | Equipo          | Codigo                     | Object Orienting Programing                          |
| ------------------------- | --------------- | -------------------------- | ---------------------------------------------------- |
| Testing                   | Equipo          | Test Report                | Listado                                              |
| ------------------------- | --------------- | -------------------------- | ---------------------------------------------------- |
| Refactoring               | Equipo          | Codigo Refactoriado        | Object Orienting Programing                          |
| ------------------------- | --------------- | -------------------------- | ---------------------------------------------------- |
| Integration Testing       | Equipo          | Test Report de Selenium    | Listado                                              |
| ------------------------- | --------------- | -------------------------- | ---------------------------------------------------- |
| Revisión de Código        | Product Owner   | Código Fuente              | Revisión de Calidad y Cumplimiento                   |
|                           | Desarrolladores |                            | Mejoras y Correcciones                               |
| ------------------------- | --------------- | -------------------------- | ---------------------------------------------------- |
|                           |                 |                            |                                                      |
| Retrospectiva             | Scrum Master    | Registro de Retrospectiva  | Identificación de Mejoras y Lecciones Aprendidas     |
|                           | Desarrolladores |                            | Planificación de Acciones Correctivas                |
| ------------------------- | --------------- | -------------------------- | ---------------------------------------------------- |
