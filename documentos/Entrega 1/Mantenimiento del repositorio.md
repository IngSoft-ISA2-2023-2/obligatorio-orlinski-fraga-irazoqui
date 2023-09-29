# Git Flow

## Justificacion de estrategia de CI elegida

Luego de leer distintas [fuentes que se mencionan al final del documento](#fuentes) y debatirlo en equipo nos hemos decantado por utilizar GitFlow como estrategia de integración contínua, dado que todos tenemos en mayor o menor medida conocimiento sobre los distintos procedimientos a seguir y no nos encontramos muy familiarizados aún con Trunk Based.
Pese a que hemos visto en dichos artículos que Trunk based es muy útil y fácil de implementar en equipos chicos y con entregas en cortos lapsos de tiempo.
Otro de los motivos para decantarnos por GitFlow es la diferencia de conocimiento sobre las estrategias de codificación de cada miembro del equipo, por lo que estaremos seguros de tener un producto estable al no estar haciendo merge a la rama principal cada uno por separado sino reuniéndonos para revisar el código subido mediante los Pull Requests.
Finalmente, y no menos importante, también influyó el cargo de cada uno en sus trabajos ya que no todos somos desarrolladores y estamos acostumbrados a un manejo fluido de GIT, por lo que con GitFlow es más simple poder volver a un estado estable.

## Fuentes

- [Trunk Based Development vs Git Flow, cuál elegir](https://openwebinars.net/blog/trunk-based-development-vs-git-flow-cual-elegir/)
- [Estrategias de integración continua en el desarrollo de aplicaciones moviles con GitFlow o Trunk based](https://andresfelipeocampo.medium.com/estrategias-de-integraci%C3%B3n-continua-en-el-desarrollo-de-aplicaciones-moviles-con-gitflow-o-trunk-24e3f0488c61)
- [Chat GPT](https://chat.openai.com/)

## Guia de como crear un PR

### Introduccion

El proposito de esta seccion es aclarar los pasos que se deben chequear antes de integrar una nueva funcionalidad.

### Primer paso: Chequeos previos

Antes de hacer "submit" a un nuevo PR, chequear lo siguiente:

- El Acceptance Criteria fue cumplido por completo (Pendiente de definicion)
- Los tests unitarios requeridos fueron agregados y funcionan
- El formato del codigo cumple con las definiciones de chequeo de codigo estatico requerido
- No hay tokens/keys/contraseñas en el codigo insertadas directamente si las mismas son secretas

<br>

### Segundo paso: Nomenclarura

#### Nombre de las ramas

Al crear una nueva rama, seguir la siguiente estructura:

`{CATEGORY}/{USER-STORY-ID}-{DESCRIPTION}`

La **CATEGORY** puede ser una de las siguientes:

- `[docs]`
- `[devops]`
- `[feature]`
- `[fix]`
- `[hotfix]`

La **DESCRIPTION** debera seguir la siguiente estructura:

- **Minuscula**
- **Guion medio ("-") en vez de espacios (" ")**
- **No mas de 30 caracteres de largo**
- **Estar en ingles**

En caso de no estar relacionada con una user story porque no es requerido por la materia crearlas aun, ese paso se puede saltear.

Ejemplos concretos:

- `docs/123-guidelines`
- `feature/456-post-drugs-endpoint`

<br>

### Tercer paso: Review

- Ejecutar el codigo localmente y revisar si lo mencionado funciona correctamente
- Buscar casos bordes
- Correr tests unitarios y de integracion (en caso de existir)
- Revisar errores de tipeo

<br>

### Cuarto paso: Integrar

Una vez el PR fue aprobado, la integracion del mismo puede ser realizada por el **reviewer** o el **autor**.

<br>

### Quinto paso: DONE

Despues de integrar un PR, mover la tarea a **_Done_**
