## Informe, justificacion y demostracion de bugs

Luego de hablarlo en equipo y haberlo presentado en la entrega anterior, de la lista de bugs a corregir hemos seleccionado los siguientes.

1. **Introducir un número de trackeo inexistente muestra un mensaje de error del backend.**

Implica una gran confusión al usuario a la hora de intentar hacer el trackeo de su pedido, ya que no se puede saber si se ha equivocado en algún caracter del código, es un error en el entorno, el sistema se encuentra caído o cualquier otro tipo de falla posible.
- Captura: 

![PrimerBugImagen](../imagenes/Primer%20Bug.png)

- Video: [Primer Bug](https://cloud.degoo.com/share/dyEX6W36B_4mJy8sBvFbhg)

- [Link a GitHub](https://github.com/IngSoft-ISA2-2023-2/obligatorio-orlinski-fraga-irazoqui/issues/27)

<br/>

2. **El sistema permite agregar cantidades negativas a un pedido de stock.**

Esto conlleva a una gran inconsistencia entre el front end y el back end, ya que se puede realizar el pedido exitosamente, pero luego dicho medicamento no es visible en la web.
Aunque el mismo sí queda registrado en la base de datos como se puede observar a continuación. 
- Captura:

![SegundoBugImagen](../imagenes/Segundo%20Bug.png)

- Video: [Segundo Bug](https://youtu.be/nk8O95cVvWU)

- [Link a GitHub](https://github.com/IngSoft-ISA2-2023-2/obligatorio-orlinski-fraga-irazoqui/issues/12)

<br/>

3. **Se pueden agregar cantidades negativas de medicamentos al carrito.**

Éste error, por más que no permita terminar de realizar la compra, el usuario final no sabe a que se debe ésto, ya que en ningún momento se muestra ningún tipo de mensaje de error.
Además de también ser un problema de manejo en el backend respecto al tipo de campo, ya que debería ser solo numérico. 

- Captura: 

![TercerBugImagen](../imagenes/Tercer%20Bug.png)

- Video: [Tercer Bug](https://youtu.be/tYGSl46HxL8)

- [Link a GitHub](https://github.com/IngSoft-ISA2-2023-2/obligatorio-orlinski-fraga-irazoqui/issues/18)


