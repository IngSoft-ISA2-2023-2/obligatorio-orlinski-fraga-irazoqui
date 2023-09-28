## Informe, justificacion y demostracion de bugs

Luego de hablarlo en equipo y haberlo presentado en la entrega anterior, de la lista de bugs a corregir hemos seleccionado los siguientes.

1. **Introducir un número de trackeo inexistente muestra un mensaje de error del backend.**

Implica una gran confusión al usuario a la hora de intentar hacer el trackeo de su pedido, ya que no se puede saber si se ha equivocado en algún caracter del código, es un error en el entorno, el sistema se encuentra caído o cualquier otro tipo de falla posible. Sumandole a esto, nunca se le puede mostrar al usuario un mensaje de error que venga desde el backend sin manejarlo previamente y que se le muestren errores por nulos como en este caso.

Al ser una funcionalidad importante que no se esta comportando como se espera, decidimos clasificarla con severidad mayor. Por otro lado, como mensajes de este tipo son inaceptables, y el error es algo muy común en lo que el usuario se pueda equivocar, decidimos clasificarlo con prioridad inmediata para resolvero cuanto antes.

- Captura: 

![PrimerBugImagen](../../imagenes/Primer%20Bug.png)

- Video: [Primer Bug](https://cloud.degoo.com/share/dyEX6W36B_4mJy8sBvFbhg)

- [Link a GitHub](https://github.com/IngSoft-ISA2-2023-2/obligatorio-orlinski-fraga-irazoqui/issues/27)

<br/>

2. **El sistema permite agregar cantidades negativas a un pedido de stock.**

Esto conlleva a una gran inconsistencia entre el front end y el back end, ya que se puede realizar el pedido exitosamente, pero luego dicho medicamento no es visible en la web. 

Al ser una funcionalidad importante que no se comporta como esperamos, lo clasificamos con severidad mayor. Al ser un error importante también lo clasificamos con prioridad alta.

- Captura:

![SegundoBugImagen](../../imagenes/Segundo%20Bug.png)

- Video: [Segundo Bug](https://youtu.be/nk8O95cVvWU)

- [Link a GitHub](https://github.com/IngSoft-ISA2-2023-2/obligatorio-orlinski-fraga-irazoqui/issues/12)

<br/>

3. **Se pueden agregar cantidades negativas de medicamentos al carrito.**

Éste error, por más que no permita terminar de realizar la compra, el usuario final no sabe a que se debe ésto, ya que en ningún momento se muestra ningún tipo de mensaje de error. Además, también es un problema de manejo en el backend respecto al tipo de campo, ya que debería ser solo numérico. 

Decidimos clasificarlo con severidad mayor, ya que la funcionalidad no se comporta como esperamos, y con prioridad alta.

- Captura: 

![TercerBugImagen](../../imagenes/Tercer%20Bug.png)

- Video: [Tercer Bug](https://youtu.be/tYGSl46HxL8)

- [Link a GitHub](https://github.com/IngSoft-ISA2-2023-2/obligatorio-orlinski-fraga-irazoqui/issues/18)


